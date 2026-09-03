scoreboard players operation #current trainRoom = @s trainRoom

# La zone correspond aux dimensions 20 x 15 x 21 du schéma.
scoreboard players set #occupied trainMymyTmp 0
$execute positioned ~-5.5 ~-5.5 ~-17.5 if entity @a[team=$(teamName),gamemode=!spectator,dx=20,dy=15,dz=21] run scoreboard players set #occupied trainMymyTmp 1

# Vérifie si cette salle possède déjà son train.
scoreboard players set #hasTrain trainMymyTmp 0
execute as @e[type=minecraft:marker,tag=trainMymyController] if score @s trainRoom = #current trainRoom run scoreboard players set #hasTrain trainMymyTmp 1

# Apparition à l'entrée du premier joueur, suppression à la sortie du dernier.
execute if score #occupied trainMymyTmp matches 1 if score #hasTrain trainMymyTmp matches 0 run function train_mymy:train/spawn
execute if score #occupied trainMymyTmp matches 0 as @e[type=minecraft:marker,tag=trainMymyController] if score @s trainRoom = #current trainRoom at @s run function train_mymy:train/stop
