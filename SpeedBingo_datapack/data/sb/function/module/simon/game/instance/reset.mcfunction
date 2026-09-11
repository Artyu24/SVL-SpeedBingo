$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room] Simon2State 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room] Simon2Timer 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room] Simon2Phase 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room] Simon2Cooldown 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Button1] Simon2Pressed 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Button2] Simon2Pressed 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Button3] Simon2Pressed 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Button4] Simon2Pressed 0
$function sb:module/simon/game/lights/off {instance:"$(instance)"}
