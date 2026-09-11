tag @s add BingoMastermind_Running
tag @s remove BingoMastermind_Ready
tag @s remove BingoMastermind_Win
scoreboard players set @s BingoMMAttempt 0
scoreboard players set @s BingoMMExact 0
scoreboard players set @s BingoMMMatched 0

# Remplace toujours le contenu sauvegarde dans la schematic par les objets de jeu.
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Barrel,limit=1] run function sb:module/mastermind/refill_barrel

$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer1,limit=1] at @s run function sb:module/mastermind/read_color
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer2,limit=1] at @s run function sb:module/mastermind/read_color
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer3,limit=1] at @s run function sb:module/mastermind/read_color
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer4,limit=1] at @s run function sb:module/mastermind/read_color
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer5,limit=1] at @s run function sb:module/mastermind/read_color

scoreboard players set @s BingoMMValid 1
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer1,scores={BingoMMColor=1..10},limit=1] run scoreboard players set @s BingoMMValid 0
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer2,scores={BingoMMColor=1..10},limit=1] run scoreboard players set @s BingoMMValid 0
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer3,scores={BingoMMColor=1..10},limit=1] run scoreboard players set @s BingoMMValid 0
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer4,scores={BingoMMColor=1..10},limit=1] run scoreboard players set @s BingoMMValid 0
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer5,scores={BingoMMColor=1..10},limit=1] run scoreboard players set @s BingoMMValid 0

$execute if score @s BingoMMValid matches 0 run function sb:module/mastermind/start_invalid
$execute if score @s BingoMMValid matches 1 run function sb:module/mastermind/start_valid {instance:"$(instance)",teamName:"$(teamName)",caseName:"$(caseName)"}
