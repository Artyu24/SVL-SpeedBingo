$data modify storage sb:simon $(instance).playback set from storage sb:simon $(instance).sequence
$data modify storage sb:simon $(instance).input set from storage sb:simon $(instance).sequence
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2State 2
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2Phase 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2Timer 0
