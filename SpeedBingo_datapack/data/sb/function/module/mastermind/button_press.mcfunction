# Un appui reste alimente plusieurs ticks. Le cooldown empeche de compter
# plusieurs essais sans modifier l'orientation du bouton dans la salle.
scoreboard players set @s BingoMMCooldown 20

$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal1,limit=1] at @s run function sb:module/mastermind/read_color
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal2,limit=1] at @s run function sb:module/mastermind/read_color
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal3,limit=1] at @s run function sb:module/mastermind/read_color
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal4,limit=1] at @s run function sb:module/mastermind/read_color
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal5,limit=1] at @s run function sb:module/mastermind/read_color

scoreboard players set @s BingoMMValid 1
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal1,scores={BingoMMColor=1..11},limit=1] run scoreboard players set @s BingoMMValid 0
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal2,scores={BingoMMColor=1..11},limit=1] run scoreboard players set @s BingoMMValid 0
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal3,scores={BingoMMColor=1..11},limit=1] run scoreboard players set @s BingoMMValid 0
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal4,scores={BingoMMColor=1..11},limit=1] run scoreboard players set @s BingoMMValid 0
$execute unless entity @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal5,scores={BingoMMColor=1..11},limit=1] run scoreboard players set @s BingoMMValid 0

execute if score @s BingoMMValid matches 0 run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 0.8
$execute if score @s BingoMMValid matches 1 run function sb:module/mastermind/validate {instance:"$(instance)"}
