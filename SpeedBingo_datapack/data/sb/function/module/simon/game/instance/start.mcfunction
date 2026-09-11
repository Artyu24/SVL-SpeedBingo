$tag @a[tag=Simon2_$(instance)_Player] remove Simon2_$(instance)_Player
$tag @s add Simon2_$(instance)_Player
tag @s add BingoSimon_Running
scoreboard players set @s BingoSimonScore 0
execute if entity @s[team=Albertos] at @s run function sb:case/timer/start {gameTag:"D1",teamName:"Albertos"}
execute if entity @s[team=RTT] at @s run function sb:case/timer/start {gameTag:"D1",teamName:"RTT"}

$data modify storage sb:simon $(instance).sequence set value []
$function sb:module/simon/game/instance/add_color {instance:"$(instance)"}

$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2State 1
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2Timer 61
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2Phase 0
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2Cooldown 0

tellraw @s [{"text":"[Simon] ","color":"gold"},{"text":"Observe puis reproduis la sequence.","color":"green"}]
