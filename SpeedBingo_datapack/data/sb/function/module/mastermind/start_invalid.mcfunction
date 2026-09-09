tellraw @s [{"text":"[Mastermind] ","color":"gold"},{"text":"Réponse incomplète : place 5 laines valides dans la zone Answer avant la partie.","color":"red"}]
playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 0.8
tag @s remove BingoMastermind_Running
scoreboard players set @s BingoMMCooldown 100
