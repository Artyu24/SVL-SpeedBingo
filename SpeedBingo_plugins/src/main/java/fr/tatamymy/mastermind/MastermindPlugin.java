package fr.tatamymy.mastermind;

import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.block.Barrel;
import org.bukkit.block.Block;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Marker;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.plugin.java.JavaPlugin;

import java.util.ArrayList;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

public final class MastermindPlugin extends JavaPlugin implements Listener {
    private static final int CODE_LENGTH = 5;
    private static final int MAX_ATTEMPTS = 5;
    private static final String PLAYING_TAG = "BingoModule_Mastermind_Playing";
    private static final String READY_TAG = "BingoMastermind_Ready";
    private static final String WIN_TAG = "BingoMastermind_Win";
    private static final String RUNNING_TAG = "BingoMastermind_Running";

    private static final Map<MastermindColor, Material> WOOL_BY_COLOR = new EnumMap<>(MastermindColor.class);
    private static final Map<Material, MastermindColor> COLOR_BY_WOOL = new EnumMap<>(Material.class);

    static {
        register(MastermindColor.VIOLET, Material.PURPLE_WOOL);
        register(MastermindColor.BLANC, Material.WHITE_WOOL);
        register(MastermindColor.BLEU, Material.BLUE_WOOL);
        register(MastermindColor.ROSE, Material.PINK_WOOL);
        register(MastermindColor.JAUNE, Material.YELLOW_WOOL);
        register(MastermindColor.ORANGE, Material.ORANGE_WOOL);
        register(MastermindColor.BLEU_CLAIR, Material.LIGHT_BLUE_WOOL);
        register(MastermindColor.VERT_CLAIR, Material.LIME_WOOL);
        register(MastermindColor.MARRON, Material.BROWN_WOOL);
        register(MastermindColor.ROUGE, Material.RED_WOOL);
    }

    private final Map<UUID, RoomSession> sessions = new HashMap<>();
    private final Random random = new Random();

    private static void register(MastermindColor color, Material wool) {
        WOOL_BY_COLOR.put(color, wool);
        COLOR_BY_WOOL.put(wool, color);
    }

    @Override
    public void onEnable() {
        Bukkit.getPluginManager().registerEvents(this, this);
        Bukkit.getScheduler().runTaskTimer(this, this::tickPlayers, 1L, 1L);
        getLogger().info("Mastermind physique active : 5 couleurs, 5 essais, doublons autorises.");
    }

    @Override
    public void onDisable() {
        sessions.clear();
    }

    private void tickPlayers() {
        for (Player player : Bukkit.getOnlinePlayers()) {
            if (!player.getScoreboardTags().contains(PLAYING_TAG)) {
                sessions.remove(player.getUniqueId());
                continue;
            }
            if (!sessions.containsKey(player.getUniqueId())) {
                startIfInsideRoom(player);
            }
        }
    }

    private void startIfInsideRoom(Player player) {
        for (String instance : List.of("A", "B")) {
            Marker start = marker(player.getWorld(), "BingoMastermind_" + instance + "_Start");
            if (start != null && start.getLocation().distanceSquared(player.getLocation()) <= 16.0) {
                RoomLayout layout = discoverLayout(start.getLocation(), instance);
                if (layout == null) {
                    player.sendMessage("§6[Mastermind] §cSalle incomplete : verifie les tetes nommees et les marqueurs.");
                    return;
                }
                List<MastermindColor> solution = randomSolution();
                RoomSession session = new RoomSession(instance, layout, new GameSession(solution));
                sessions.put(player.getUniqueId(), session);
                player.removeScoreboardTag(READY_TAG);
                player.removeScoreboardTag(WIN_TAG);
                refillBarrel(layout.barrel());
                clearPlayArea(layout);
                displaySolution(layout, solution);
                player.sendMessage("§6[Mastermind] §aPartie lancee. Compose 5 propositions de 5 couleurs.");
                return;
            }
        }
    }

    @EventHandler
    public void onButton(PlayerInteractEvent event) {
        if (event.getAction() != Action.RIGHT_CLICK_BLOCK || event.getClickedBlock() == null) {
            return;
        }
        Player player = event.getPlayer();
        RoomSession room = sessions.get(player.getUniqueId());
        if (room == null || room.complete()) {
            return;
        }
        Marker button = marker(player.getWorld(), "BingoMastermind_" + room.instance() + "_ValidationButton");
        if (button == null || button.getLocation().distanceSquared(event.getClickedBlock().getLocation().add(0.5, 0.5, 0.5)) > 1.0) {
            return;
        }
        event.setCancelled(true);
        validateGuess(player, room);
    }

    private void validateGuess(Player player, RoomSession room) {
        List<MastermindColor> guess = readProposal(room.layout());
        if (guess == null) {
            player.sendMessage("§6[Mastermind] §cPlace une laine sur chacun des 5 blocs jaunes.");
            return;
        }

        GuessResult result = room.game().guess(guess);
        int attempt = room.game().attempts();
        displayAttempt(room.layout(), attempt, guess, result);
        clearProposal(room.layout());

        if (result.won(CODE_LENGTH)) {
            room.markWon();
            player.sendMessage("§6[Mastermind] §aCombinaison trouvee ! Termine les 5 essais.");
        } else {
            player.sendMessage("§6[Mastermind] §eEssai " + attempt + "/5 : §a"
                    + result.correctPositions() + " bien placees §7- §e"
                    + result.misplacedColors() + " mal placees");
        }

        if (attempt >= MAX_ATTEMPTS) {
            room.markComplete();
            player.addScoreboardTag(READY_TAG);
            if (room.won()) {
                player.addScoreboardTag(WIN_TAG);
            }
            player.sendMessage("§6[Mastermind] §bLes 5 essais sont termines. Prends la plaque en or pour sortir.");
        }
    }

    private RoomLayout discoverLayout(Location center, String instance) {
        Map<String, Block> named = new HashMap<>();
        World world = center.getWorld();
        Marker barrelMarker = marker(world, "BingoMastermind_" + instance + "_Barrel");
        if (barrelMarker == null) {
            return null;
        }
        Block barrel = barrelMarker.getLocation().getBlock();
        for (int index = 1; index <= 5; index++) {
            for (String role : List.of("Answer", "Proposal", "Test")) {
                Marker zone = marker(world, "BingoMastermind_" + instance + "_" + role + index);
                if (zone == null) {
                    return null;
                }
                named.put((role + index).toLowerCase(), zone.getLocation().getBlock());
            }
            if (!named.containsKey("answer" + index)) {
                return null;
            }
        }
        return new RoomLayout(named, barrel);
    }

    private Marker marker(World world, String tag) {
        for (Marker marker : world.getEntitiesByClass(Marker.class)) {
            if (marker.getScoreboardTags().contains(tag)) {
                return marker;
            }
        }
        return null;
    }

    private List<MastermindColor> randomSolution() {
        MastermindColor[] colors = MastermindColor.values();
        List<MastermindColor> solution = new ArrayList<>(CODE_LENGTH);
        for (int index = 0; index < CODE_LENGTH; index++) {
            solution.add(colors[random.nextInt(colors.length)]);
        }
        return solution;
    }

    private void refillBarrel(Block barrelBlock) {
        if (!(barrelBlock.getState() instanceof Barrel barrel)) {
            return;
        }
        Inventory inventory = barrel.getInventory();
        inventory.clear();
        int slot = 0;
        for (MastermindColor color : MastermindColor.values()) {
            ItemStack stack = new ItemStack(WOOL_BY_COLOR.get(color), 64);
            ItemMeta meta = stack.getItemMeta();
            meta.setCanPlaceOn(Set.of(Material.YELLOW_CONCRETE));
            stack.setItemMeta(meta);
            inventory.setItem(slot++, stack);
        }
    }

    private List<MastermindColor> readProposal(RoomLayout layout) {
        List<MastermindColor> result = new ArrayList<>(CODE_LENGTH);
        for (int index = 1; index <= CODE_LENGTH; index++) {
            Material material = proposalTarget(layout.named().get("proposal" + index)).getType();
            MastermindColor color = COLOR_BY_WOOL.get(material);
            if (color == null) {
                return null;
            }
            result.add(color);
        }
        return result;
    }

    private void displaySolution(RoomLayout layout, List<MastermindColor> solution) {
        for (int index = 1; index <= CODE_LENGTH; index++) {
            answerTarget(layout.named().get("answer" + index)).setType(WOOL_BY_COLOR.get(solution.get(index - 1)), false);
        }
    }

    private void displayAttempt(RoomLayout layout, int attempt, List<MastermindColor> guess, GuessResult result) {
        Block anchor = layout.named().get("test" + attempt);
        for (int index = 0; index < CODE_LENGTH; index++) {
            testTarget(anchor, index).setType(WOOL_BY_COLOR.get(guess.get(index)), false);
            Material hint = index < result.misplacedColors()
                    ? Material.YELLOW_WOOL
                    : index < result.misplacedColors() + result.correctPositions()
                    ? Material.LIME_WOOL
                    : Material.AIR;
            hintTarget(anchor, index).setType(hint, false);
        }
    }

    private void clearPlayArea(RoomLayout layout) {
        clearProposal(layout);
        for (int attempt = 1; attempt <= MAX_ATTEMPTS; attempt++) {
            Block anchor = layout.named().get("test" + attempt);
            for (int index = 0; index < CODE_LENGTH; index++) {
                testTarget(anchor, index).setType(Material.AIR, false);
                hintTarget(anchor, index).setType(Material.AIR, false);
            }
        }
    }

    private void clearProposal(RoomLayout layout) {
        for (int index = 1; index <= CODE_LENGTH; index++) {
            proposalTarget(layout.named().get("proposal" + index)).setType(Material.AIR, false);
        }
    }

    private Block answerTarget(Block namedHead) {
        return namedHead.getRelative(1, 0, 0);
    }

    private Block proposalTarget(Block namedHead) {
        return namedHead.getRelative(1, 0, 0);
    }

    private Block testTarget(Block testHead, int index) {
        return testHead.getRelative(0, 0, -1 - index);
    }

    private Block hintTarget(Block testHead, int index) {
        return testHead.getRelative(0, 0, -7 - index);
    }

    private record RoomLayout(Map<String, Block> named, Block barrel) {
    }

    private static final class RoomSession {
        private final String instance;
        private final RoomLayout layout;
        private final GameSession game;
        private boolean won;
        private boolean complete;

        private RoomSession(String instance, RoomLayout layout, GameSession game) {
            this.instance = instance;
            this.layout = layout;
            this.game = game;
        }

        String instance() { return instance; }
        RoomLayout layout() { return layout; }
        GameSession game() { return game; }
        boolean won() { return won; }
        boolean complete() { return complete; }
        void markWon() { won = true; }
        void markComplete() { complete = true; }
    }
}
