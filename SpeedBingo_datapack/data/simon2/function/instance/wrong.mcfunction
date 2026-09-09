$function simon2:lights/off {instance:"$(instance)"}
$scoreboard players set @s Simon2State 0
$title @a[tag=Simon2_$(instance)_Player,limit=1] title {"text":"MAUVAISE COULEUR","color":"red","bold":true}
$playsound minecraft:entity.villager.no master @a[tag=Simon2_$(instance)_Player,limit=1] ~ ~ ~ 1 0.8
$tellraw @a[tag=Simon2_$(instance)_Player,limit=1] [{"text":"[Simon2] Mauvaise couleur ! Score final : ","color":"red"},{"score":{"name":"@a[tag=Simon2_$(instance)_Player,limit=1]","objective":"BingoSimonScore"},"color":"yellow"}]
$tag @a[tag=Simon2_$(instance)_Player,limit=1] remove BingoSimon_Running
$execute as @a[tag=Simon2_$(instance)_Player,limit=1] at @s run function sb:module/simon/finish
$tag @a[tag=Simon2_$(instance)_Player,limit=1] remove BingoTimerTick
$tag @a[tag=Simon2_$(instance)_Player,limit=1] remove BingoModule_D1_Playing
$tag @a[tag=Simon2_$(instance)_Player,limit=1] add BingoModule_D1
$execute as @a[tag=Simon2_$(instance)_Player,limit=1] at @s if entity @e[type=minecraft:marker,tag=D1,sort=nearest,limit=1] run tp @s @e[type=minecraft:marker,tag=D1,sort=nearest,limit=1]
$tag @a[tag=Simon2_$(instance)_Player] remove Simon2_$(instance)_Player
