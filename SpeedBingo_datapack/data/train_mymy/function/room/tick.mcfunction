scoreboard players operation #current trainRoom = @s trainRoom

# La présence dans le module A1 est donnée par le tag commun du système de cases.
scoreboard players set #occupied trainMymyTmp 0
$execute if entity @a[team=$(teamName),tag=BingoModule_A1_Playing,gamemode=!spectator] run scoreboard players set #occupied trainMymyTmp 1

# Vérifie si cette salle possède déjà son train.
scoreboard players set #hasTrain trainMymyTmp 0
execute as @e[type=minecraft:marker,tag=trainMymyController] if score @s trainRoom = #current trainRoom run scoreboard players set #hasTrain trainMymyTmp 1

# Apparition à l'entrée du premier joueur, suppression à la sortie du dernier.
execute if score #occupied trainMymyTmp matches 1 if score #hasTrain trainMymyTmp matches 0 run function train_mymy:train/spawn
execute if score #occupied trainMymyTmp matches 0 as @e[type=minecraft:marker,tag=trainMymyController] if score @s trainRoom = #current trainRoom at @s run function train_mymy:train/stop
