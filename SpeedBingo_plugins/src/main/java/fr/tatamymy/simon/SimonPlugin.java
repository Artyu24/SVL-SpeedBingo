package fr.tatamymy.simon;

import net.kyori.adventure.text.Component;
import net.kyori.adventure.text.TextComponent;
import net.kyori.adventure.text.format.NamedTextColor;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.Sound;
import org.bukkit.World;
import org.bukkit.block.Block;
import org.bukkit.block.BlockFace;
import org.bukkit.block.Skull;
import org.bukkit.block.data.Directional;
import org.bukkit.block.data.Lightable;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.event.player.PlayerQuitEvent;
import org.bukkit.plugin.java.JavaPlugin;
import org.bukkit.scheduler.BukkitRunnable;

import java.util.ArrayList;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

public final class SimonPlugin extends JavaPlugin implements Listener {
    private static final String PREFIX = "§6[Simon] §r";
    private static final String PLAYING_TAG = "BingoModule_Simon_Playing";
    private static final String RUNNING_TAG = "BingoSimon_Running";
    private static final String TIMER_START_FUNCTION = "sb:timer/start";
    private static final String TIMER_STOP_FUNCTION = "sb:timer/stop";
    private static final String SCORE_OBJECTIVE = "BingoSimonScore";
    private static final int SEARCH_RADIUS = 16;
    private static final int SEARCH_HEIGHT = 8;
    private static final int SEQUENCE_STEP_TICKS = 20;
    private static final int COLOR_ON_TICKS = 13;

    // t1 = vert, t2 = rouge, t3 = jaune, t4 = bleu.
    private static final String[] COLOR_NAMES = {null, "VERT", "ROUGE", "JAUNE", "BLEU"};
    private static final NamedTextColor[] TEXT_COLORS = {
            null,
            NamedTextColor.GREEN,
            NamedTextColor.RED,
            NamedTextColor.YELLOW,
            NamedTextColor.BLUE
    };
    private static final Map<Material, Integer> BUTTON_IDS = new EnumMap<>(Material.class);

    static {
        BUTTON_IDS.put(Material.LIME_CONCRETE, 1);
        BUTTON_IDS.put(Material.RED_CONCRETE, 2);
        BUTTON_IDS.put(Material.YELLOW_CONCRETE, 3);
        BUTTON_IDS.put(Material.BLUE_CONCRETE, 4);
    }

    private final Map<UUID, SimonGame> games = new HashMap<>();

    @Override
    public void onEnable() {
        Bukkit.getPluginManager().registerEvents(this, this);
        for (Player player : Bukkit.getOnlinePlayers()) {
            if (player.removeScoreboardTag(RUNNING_TAG)) {
                runTimerFunction(player, TIMER_STOP_FUNCTION);
            }
        }
        getLogger().info("Simon actif : sessions et timers individuels par joueur.");
    }

    @Override
    public void onDisable() {
        for (SimonGame game : new ArrayList<>(games.values())) {
            Player player = Bukkit.getPlayer(game.playerId);
            if (player != null) {
                stopTimer(player, game);
                player.removeScoreboardTag(RUNNING_TAG);
            }
            cancelGame(game);
        }
        games.clear();
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (args.length == 0) {
            help(sender, label);
            return true;
        }
        return switch (args[0].toLowerCase(Locale.ROOT)) {
            case "start", "demarrer", "démarrer" -> startFromCommand(sender, args);
            case "stop", "arreter", "arrêter" -> stopFromCommand(sender, args);
            default -> {
                help(sender, label);
                yield true;
            }
        };
    }

    private boolean startFromCommand(CommandSender sender, String[] args) {
        Player player = targetPlayer(sender, args);
        if (player == null) {
            sender.sendMessage(PREFIX + "§cJoueur introuvable.");
            return true;
        }
        if (!player.getScoreboardTags().contains(PLAYING_TAG)) {
            sender.sendMessage(PREFIX + "§cCe joueur n'est pas sélectionné pour le module Simon.");
            return true;
        }

        RoomLayout room = discoverRoom(player.getLocation());
        if (room == null) {
            sender.sendMessage(PREFIX + "§cSalle incomplète : vérifie t1 à t4, les boutons et les quatre copper bulbs.");
            return true;
        }
        begin(player, room);
        return true;
    }

    private boolean stopFromCommand(CommandSender sender, String[] args) {
        Player player = targetPlayer(sender, args);
        if (player == null) {
            sender.sendMessage(PREFIX + "§cJoueur introuvable.");
            return true;
        }
        endGame(player.getUniqueId(), "§ePartie arrêtée.");
        return true;
    }

    private Player targetPlayer(CommandSender sender, String[] args) {
        if (args.length >= 2 && sender.hasPermission("simon.admin")) {
            return Bukkit.getPlayerExact(args[1]);
        }
        return sender instanceof Player player ? player : null;
    }

    @EventHandler
    public void onButton(PlayerInteractEvent event) {
        if (event.getAction() != Action.RIGHT_CLICK_BLOCK || event.getClickedBlock() == null) {
            return;
        }

        Block clicked = event.getClickedBlock();
        Player player = event.getPlayer();

        if (clicked.getType() == Material.POLISHED_BLACKSTONE_BUTTON) {
            event.setCancelled(true);
            if (!player.getScoreboardTags().contains(PLAYING_TAG)) {
                player.sendMessage(PREFIX + "§cTu n'es pas le joueur sélectionné pour ce module.");
                return;
            }
            RoomLayout room = discoverRoom(clicked.getLocation());
            if (room == null) {
                player.sendMessage(PREFIX + "§cSalle incomplète : vérifie t1 à t4, les boutons et les quatre copper bulbs.");
                return;
            }
            begin(player, room);
            return;
        }

        SimonGame game = games.get(player.getUniqueId());
        if (game == null || !game.session.acceptingInput()) {
            return;
        }

        int value = idAt(clicked.getLocation(), game.room.buttons);
        if (value == 0) {
            return;
        }

        event.setCancelled(true);
        light(game, value, true);
        Bukkit.getScheduler().runTaskLater(this, () -> light(game, value, false), 8L);

        SimonSession.Answer answer = game.session.answer(value);
        if (answer == SimonSession.Answer.WRONG) {
            int score = Math.max(0, game.session.round() - 1);
            updateScore(player, score);
            player.playSound(player, Sound.ENTITY_VILLAGER_NO, 1f, .8f);
            endGame(
                    player.getUniqueId(),
                    "§cMauvais bouton ! Partie perdue. §6Score final : §e" + score
                            + (score > 1 ? " manches" : " manche") + "."
            );
        } else if (answer == SimonSession.Answer.ROUND_COMPLETE) {
            updateScore(player, game.session.round());
            player.sendMessage(PREFIX + "§aCorrect !");
            Bukkit.getScheduler().runTaskLater(this, () -> {
                if (games.get(player.getUniqueId()) == game) {
                    nextRound(game);
                }
            }, 25L);
        }
    }

    @EventHandler
    public void onQuit(PlayerQuitEvent event) {
        SimonGame game = games.remove(event.getPlayer().getUniqueId());
        if (game != null) {
            stopTimer(event.getPlayer(), game);
            event.getPlayer().removeScoreboardTag(RUNNING_TAG);
            cancelGame(game);
        }
    }

    private void begin(Player player, RoomLayout room) {
        for (SimonGame running : games.values()) {
            if (!running.playerId.equals(player.getUniqueId()) && sameBlock(running.room.start, room.start)) {
                player.sendMessage(PREFIX + "§cCette salle est déjà utilisée par un autre joueur.");
                return;
            }
        }

        endGame(player.getUniqueId(), null);
        SimonGame game = new SimonGame(player.getUniqueId(), room);
        games.put(player.getUniqueId(), game);
        player.addScoreboardTag(RUNNING_TAG);
        updateScore(player, 0);

        player.sendMessage(PREFIX + "§aObserve puis reproduis la séquence.");
        startCountdown(player, game);
    }

    private void startCountdown(Player player, SimonGame game) {
        game.task = new BukkitRunnable() {
            int count = 3;

            @Override
            public void run() {
                if (games.get(game.playerId) != game || !player.isOnline()) {
                    cancelCurrentTask(game, this);
                    return;
                }
                if (count > 0) {
                    player.sendMessage(PREFIX + "§e" + count);
                    player.playSound(player, Sound.UI_BUTTON_CLICK, .8f, 1f);
                    count--;
                    return;
                }

                cancelCurrentTask(game, this);
                player.sendMessage(PREFIX + "§aC'est parti !");
                startTimer(player, game);
                nextRound(game);
            }
        };
        game.task.runTaskTimer(this, 0L, 20L);
    }

    private void nextRound(SimonGame game) {
        if (games.get(game.playerId) != game) {
            return;
        }

        game.session.addRandom(ThreadLocalRandom.current());
        Player player = Bukkit.getPlayer(game.playerId);
        if (player != null) {
            player.sendActionBar(Component.text("Manche " + game.session.round(), NamedTextColor.YELLOW));
        }

        List<Integer> sequence = game.session.sequence();
        game.task = new BukkitRunnable() {
            int tick;
            int index;

            @Override
            public void run() {
                if (games.get(game.playerId) != game) {
                    cancelCurrentTask(game, this);
                    return;
                }
                int phase = tick % SEQUENCE_STEP_TICKS;
                if (phase == 0 && index < sequence.size()) {
                    light(game, sequence.get(index), true);
                }
                if (phase == COLOR_ON_TICKS && index < sequence.size()) {
                    light(game, sequence.get(index), false);
                    index++;
                }
                if (index == sequence.size() && phase == COLOR_ON_TICKS + 1) {
                    game.session.startInput();
                    Player current = Bukkit.getPlayer(game.playerId);
                    if (current != null) {
                        current.sendActionBar(Component.text("À toi !", NamedTextColor.GREEN));
                    }
                    cancelCurrentTask(game, this);
                    return;
                }
                tick++;
            }
        };
        game.task.runTaskTimer(this, 10L, 1L);
    }

    private RoomLayout discoverRoom(Location center) {
        World world = center.getWorld();
        if (world == null) {
            return null;
        }

        Map<Integer, Location> foundHeads = new HashMap<>();
        Map<Integer, Location> foundButtons = new HashMap<>();
        Location foundStart = null;
        int centerX = center.getBlockX();
        int centerY = center.getBlockY();
        int centerZ = center.getBlockZ();
        int minimumY = Math.max(world.getMinHeight(), centerY - SEARCH_HEIGHT);
        int maximumY = Math.min(world.getMaxHeight() - 1, centerY + SEARCH_HEIGHT);

        for (int x = centerX - SEARCH_RADIUS; x <= centerX + SEARCH_RADIUS; x++) {
            for (int y = minimumY; y <= maximumY; y++) {
                for (int z = centerZ - SEARCH_RADIUS; z <= centerZ + SEARCH_RADIUS; z++) {
                    Block block = world.getBlockAt(x, y, z);
                    if (block.getType() == Material.PLAYER_WALL_HEAD) {
                        Skull skull = (Skull) block.getState();
                        int id = skull.customName() instanceof TextComponent name ? markerId(name.content()) : 0;
                        if (id != 0) {
                            putClosest(foundHeads, id, block.getLocation(), center);
                        }
                    } else if (block.getType().name().endsWith("_BUTTON")) {
                        if (block.getType() == Material.POLISHED_BLACKSTONE_BUTTON) {
                            Location candidate = block.getLocation();
                            if (foundStart == null || candidate.distanceSquared(center) < foundStart.distanceSquared(center)) {
                                foundStart = candidate;
                            }
                        } else {
                            Integer id = BUTTON_IDS.get(block.getRelative(BlockFace.DOWN).getType());
                            if (id != null) {
                                putClosest(foundButtons, id, block.getLocation(), center);
                            }
                        }
                    }
                }
            }
        }

        if (foundStart == null || foundHeads.size() != 4 || foundButtons.size() != 4) {
            return null;
        }

        Map<Integer, Location> foundBulbs = new HashMap<>();
        for (int id = 1; id <= 4; id++) {
            Block head = foundHeads.get(id).getBlock();
            if (!(head.getBlockData() instanceof Directional directional)) {
                return null;
            }
            Block bulb = head.getRelative(directional.getFacing().getOppositeFace());
            if (!bulb.getType().name().endsWith("COPPER_BULB")) {
                return null;
            }
            foundBulbs.put(id, bulb.getLocation());
        }

        return new RoomLayout(
                foundStart,
                Map.copyOf(foundHeads),
                Map.copyOf(foundButtons),
                Map.copyOf(foundBulbs)
        );
    }

    private static void putClosest(Map<Integer, Location> locations, int id, Location candidate, Location center) {
        Location current = locations.get(id);
        if (current == null || candidate.distanceSquared(center) < current.distanceSquared(center)) {
            locations.put(id, candidate);
        }
    }

    private static int markerId(String customName) {
        if (customName == null) {
            return 0;
        }
        String name = customName.trim().toLowerCase(Locale.ROOT);
        if (name.length() != 2 || name.charAt(0) != 't') {
            return 0;
        }
        char number = name.charAt(1);
        return number >= '1' && number <= '4' ? number - '0' : 0;
    }

    private void light(SimonGame game, int id, boolean on) {
        Location headLocation = game.room.heads.get(id);
        Location bulbLocation = game.room.bulbs.get(id);
        if (headLocation == null || bulbLocation == null || headLocation.getWorld() == null) {
            return;
        }

        Block bulb = bulbLocation.getBlock();
        if (bulb.getBlockData() instanceof Lightable data) {
            data.setLit(on);
            bulb.setBlockData(data, false);
        }

        Player player = Bukkit.getPlayer(game.playerId);
        if (on && player != null) {
            player.sendActionBar(Component.text("■ " + COLOR_NAMES[id] + " ■", TEXT_COLORS[id]));
            player.playSound(headLocation, Sound.BLOCK_NOTE_BLOCK_PLING, 1.1f, .75f + id * .12f);
        }
    }

    private void lightsOff(SimonGame game) {
        for (int id = 1; id <= 4; id++) {
            light(game, id, false);
        }
    }

    private void startTimer(Player player, SimonGame game) {
        if (runTimerFunction(player, TIMER_START_FUNCTION)) {
            game.timerRunning = true;
        }
    }

    private void stopTimer(Player player, SimonGame game) {
        if (!game.timerRunning) {
            return;
        }
        runTimerFunction(player, TIMER_STOP_FUNCTION);
        game.timerRunning = false;
    }

    private boolean runTimerFunction(Player player, String function) {
        boolean success = Bukkit.dispatchCommand(
                Bukkit.getConsoleSender(),
                "execute as " + player.getName() + " run function " + function
        );
        if (!success) {
            getLogger().warning("Impossible d'exécuter la fonction " + function + " pour " + player.getName() + '.');
        }
        return success;
    }

    private void updateScore(Player player, int score) {
        boolean success = Bukkit.dispatchCommand(
                Bukkit.getConsoleSender(),
                "scoreboard players set " + player.getName() + " " + SCORE_OBJECTIVE + " " + score
        );
        if (!success) {
            getLogger().warning("Impossible d'enregistrer le score Simon de " + player.getName() + '.');
        }
    }

    private void endGame(UUID id, String message) {
        SimonGame game = games.remove(id);
        if (game == null) {
            return;
        }

        Player player = Bukkit.getPlayer(id);
        if (player != null) {
            if (message != null) {
                player.sendMessage(PREFIX + message);
            }
            stopTimer(player, game);
            player.removeScoreboardTag(RUNNING_TAG);
        }
        cancelGame(game);
    }

    private void cancelGame(SimonGame game) {
        if (game.task != null) {
            game.task.cancel();
            game.task = null;
        }
        lightsOff(game);
    }

    private static void cancelCurrentTask(SimonGame game, BukkitRunnable task) {
        task.cancel();
        if (game.task == task) {
            game.task = null;
        }
    }

    private static int idAt(Location location, Map<Integer, Location> locations) {
        return locations.entrySet().stream()
                .filter(entry -> sameBlock(entry.getValue(), location))
                .map(Map.Entry::getKey)
                .findFirst()
                .orElse(0);
    }

    private static boolean sameBlock(Location first, Location second) {
        return first.getWorld() != null
                && first.getWorld().equals(second.getWorld())
                && first.getBlockX() == second.getBlockX()
                && first.getBlockY() == second.getBlockY()
                && first.getBlockZ() == second.getBlockZ();
    }

    private static void help(CommandSender sender, String label) {
        sender.sendMessage(PREFIX + "§f/" + label + " start [joueur]§7, stop [joueur]");
        sender.sendMessage(PREFIX + "§7Le bouton en pierre noire lance automatiquement la salle du joueur.");
    }

    private record RoomLayout(
            Location start,
            Map<Integer, Location> heads,
            Map<Integer, Location> buttons,
            Map<Integer, Location> bulbs
    ) {
    }

    private static final class SimonGame {
        private final UUID playerId;
        private final RoomLayout room;
        private final SimonSession session = new SimonSession();
        private BukkitRunnable task;
        private boolean timerRunning;

        private SimonGame(UUID playerId, RoomLayout room) {
            this.playerId = playerId;
            this.room = room;
        }
    }
}
