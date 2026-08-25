package fr.tatamymy.simon;

import org.bukkit.*;
import org.bukkit.block.Block;
import org.bukkit.block.BlockFace;
import org.bukkit.block.data.Levelled;
import org.bukkit.command.*;
import org.bukkit.configuration.ConfigurationSection;
import org.bukkit.entity.Player;
import org.bukkit.event.*;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.plugin.java.JavaPlugin;
import org.bukkit.scheduler.BukkitRunnable;
import org.bukkit.util.RayTraceResult;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public final class SimonPlugin extends JavaPlugin implements Listener {
    private static final String PREFIX = "§6[Simon] §r";
    private static final Color[] COLORS = {null, Color.LIME, Color.RED, Color.YELLOW, Color.BLUE};
    private final Map<Integer, Location> buttons = new HashMap<>(), effects = new HashMap<>(), lights = new HashMap<>();
    private SimonSession session;
    private UUID playerId;
    private BukkitRunnable playback;

    @Override public void onEnable() {
        saveDefaultConfig(); loadLocations("buttons", buttons); loadLocations("effects", effects); loadLocations("lights", lights);
        Bukkit.getPluginManager().registerEvents(this, this);
    }
    @Override public void onDisable() { stopPlayback(); lightsOff(); }

    @Override public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (args.length == 0) { help(sender, label); return true; }
        return switch (args[0].toLowerCase(Locale.ROOT)) {
            case "start", "demarrer", "démarrer" -> start(sender, args);
            case "stop", "arreter", "arrêter" -> { end("§ePartie arrêtée."); yield true; }
            case "bindbutton" -> bindButton(sender, args);
            case "bindlight", "bindlumiere", "bindlumière" -> bindLight(sender, args);
            default -> { help(sender, label); yield true; }
        };
    }
    private boolean start(CommandSender sender, String[] args) {
        Player player = args.length >= 2 && sender.hasPermission("simon.admin") ? Bukkit.getPlayerExact(args[1]) : sender instanceof Player p ? p : null;
        if (player == null) { sender.sendMessage(PREFIX + "§cJoueur introuvable."); return true; }
        if (buttons.size() != 4 || effects.size() != 4 || lights.size() != 4) {
            sender.sendMessage(PREFIX + "§cConfigure d'abord les 4 boutons et les 4 lumières."); return true;
        }
        stopPlayback(); lightsOff(); session = new SimonSession(); playerId = player.getUniqueId();
        player.sendMessage(PREFIX + "§aObserve puis reproduis la séquence."); nextRound(); return true;
    }
    private void nextRound() {
        if (session == null) return;
        session.addRandom(ThreadLocalRandom.current());
        Player player = Bukkit.getPlayer(playerId); if (player != null) player.sendActionBar("§eManche " + session.round());
        List<Integer> sequence = session.sequence();
        playback = new BukkitRunnable() {
            int tick, index;
            @Override public void run() {
                if (session == null) { cancel(); return; }
                if (tick % 16 == 0 && index < sequence.size()) light(sequence.get(index), true);
                if (tick % 16 == 9 && index < sequence.size()) { light(sequence.get(index), false); index++; }
                if (index == sequence.size() && tick % 16 == 10) {
                    session.startInput(); Player p = Bukkit.getPlayer(playerId); if (p != null) p.sendActionBar("§aÀ toi !");
                    cancel(); playback = null;
                }
                tick++;
            }
        }; playback.runTaskTimer(this, 10L, 1L);
    }
    @EventHandler public void onButton(PlayerInteractEvent event) {
        if (event.getAction() != Action.RIGHT_CLICK_BLOCK || event.getClickedBlock() == null || session == null
                || !event.getPlayer().getUniqueId().equals(playerId) || !session.acceptingInput()) return;
        int value = idAt(event.getClickedBlock().getLocation(), buttons); if (value == 0) return;
        event.setCancelled(true); light(value, true); Bukkit.getScheduler().runTaskLater(this, () -> light(value, false), 6L);
        SimonSession.Answer answer = session.answer(value);
        if (answer == SimonSession.Answer.WRONG) {
            event.getPlayer().playSound(event.getPlayer(), Sound.ENTITY_VILLAGER_NO, 1f, .8f); end("§cMauvais bouton ! Partie perdue.");
        } else if (answer == SimonSession.Answer.ROUND_COMPLETE) {
            event.getPlayer().sendMessage(PREFIX + "§aCorrect !"); Bukkit.getScheduler().runTaskLater(this, this::nextRound, 25L);
        }
    }
    private boolean bindButton(CommandSender sender, String[] args) {
        if (!(sender instanceof Player player) || !sender.hasPermission("simon.admin")) return true;
        int id = parseId(args); Block block = player.getTargetBlockExact(8);
        if (id == 0 || block == null || !block.getType().name().endsWith("_BUTTON")) {
            sender.sendMessage(PREFIX + "§cRegarde le bouton et indique un numéro de 1 à 4."); return true;
        }
        buttons.put(id, block.getLocation()); getConfig().set("buttons." + id, block.getLocation()); saveConfig();
        sender.sendMessage(PREFIX + "§aBouton " + id + " enregistré."); return true;
    }
    private boolean bindLight(CommandSender sender, String[] args) {
        if (!(sender instanceof Player player) || !sender.hasPermission("simon.admin")) return true;
        int id = parseId(args); RayTraceResult hit = player.rayTraceBlocks(8);
        Block glass = hit == null ? null : hit.getHitBlock(); BlockFace face = hit == null ? null : hit.getHitBlockFace();
        Block light = glass == null || face == null ? null : glass.getRelative(face);
        if (id == 0 || glass == null || light == null || !glass.getType().name().endsWith("_STAINED_GLASS")
                || (light.getType() != Material.AIR && light.getType() != Material.LIGHT)) {
            sender.sendMessage(PREFIX + "§cRegarde une vitre colorée avec une case d'air devant elle (numéro 1 à 4)."); return true;
        }
        effects.put(id, glass.getLocation().add(.5, .5, .5)); lights.put(id, light.getLocation());
        getConfig().set("effects." + id, effects.get(id)); getConfig().set("lights." + id, lights.get(id)); saveConfig();
        sender.sendMessage(PREFIX + "§aEffet lumineux " + id + " enregistré."); return true;
    }
    private static int parseId(String[] args) {
        if (args.length != 2) return 0;
        try { int id = Integer.parseInt(args[1]); return id >= 1 && id <= 4 ? id : 0; } catch (NumberFormatException ignored) { return 0; }
    }
    private void light(int id, boolean on) {
        Location effect = effects.get(id), lightLocation = lights.get(id);
        if (effect == null || lightLocation == null || effect.getWorld() == null) return;
        Block lightBlock = lightLocation.getBlock();
        if (on) {
            lightBlock.setType(Material.LIGHT, false); Levelled data = (Levelled) lightBlock.getBlockData();
            data.setLevel(data.getMaximumLevel()); lightBlock.setBlockData(data, false);
            effect.getWorld().spawnParticle(Particle.DUST, effect, 28, .32, .32, .32, 0, new Particle.DustOptions(COLORS[id], 1.25f));
        } else if (lightBlock.getType() == Material.LIGHT) lightBlock.setType(Material.AIR, false);
        Player player = playerId == null ? null : Bukkit.getPlayer(playerId);
        if (on && player != null) player.playSound(effect, Sound.BLOCK_NOTE_BLOCK_PLING, .8f, .75f + id * .12f);
    }
    private void lightsOff() { for (int id = 1; id <= 4; id++) light(id, false); }
    private void stopPlayback() { if (playback != null) { playback.cancel(); playback = null; } }
    private void end(String message) {
        Player player = playerId == null ? null : Bukkit.getPlayer(playerId); if (player != null) player.sendMessage(PREFIX + message);
        stopPlayback(); lightsOff(); session = null; playerId = null;
    }
    private static int idAt(Location location, Map<Integer, Location> locations) {
        return locations.entrySet().stream().filter(e -> sameBlock(e.getValue(), location)).map(Map.Entry::getKey).findFirst().orElse(0);
    }
    private static boolean sameBlock(Location a, Location b) {
        return a.getWorld() != null && a.getWorld().equals(b.getWorld()) && a.getBlockX() == b.getBlockX()
                && a.getBlockY() == b.getBlockY() && a.getBlockZ() == b.getBlockZ();
    }
    private void loadLocations(String path, Map<Integer, Location> target) {
        ConfigurationSection section = getConfig().getConfigurationSection(path); if (section == null) return;
        for (int id = 1; id <= 4; id++) { Location location = section.getLocation(String.valueOf(id)); if (location != null) target.put(id, location); }
    }
    private static void help(CommandSender sender, String label) {
        sender.sendMessage(PREFIX + "§f/" + label + " start [joueur]§7, stop");
        sender.sendMessage(PREFIX + "§f/" + label + " bindbutton <1-4>§7, bindlight <1-4>");
    }
}
