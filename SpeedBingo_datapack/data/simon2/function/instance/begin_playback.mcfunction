$data modify storage simon2:games $(instance).playback set from storage simon2:games $(instance).sequence
$data modify storage simon2:games $(instance).input set from storage simon2:games $(instance).sequence
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2State 2
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2Phase 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2Timer 0
