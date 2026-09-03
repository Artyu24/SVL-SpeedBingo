scoreboard players operation #current trainRoom = @s trainRoom
tag @s add trainMymyCurrentController

# Passage au point suivant. Au retour au rouge, on repart à 1 : boucle infinie.
execute if score @s trainPoint matches 1 as @e[type=minecraft:marker,tag=trainMymyOrange,distance=..0.16] if score @s trainRoom = #current trainRoom run scoreboard players add @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] trainPoint 1
execute if score @s trainPoint matches 2 as @e[type=minecraft:marker,tag=trainMymyYellow,distance=..0.16] if score @s trainRoom = #current trainRoom run scoreboard players add @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] trainPoint 1
execute if score @s trainPoint matches 3 as @e[type=minecraft:marker,tag=trainMymyLime,distance=..0.16] if score @s trainRoom = #current trainRoom run scoreboard players add @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] trainPoint 1
execute if score @s trainPoint matches 4 as @e[type=minecraft:marker,tag=trainMymyMagenta,distance=..0.16] if score @s trainRoom = #current trainRoom run scoreboard players add @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] trainPoint 1
execute if score @s trainPoint matches 5 as @e[type=minecraft:marker,tag=trainMymyCyan,distance=..0.16] if score @s trainRoom = #current trainRoom run scoreboard players add @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] trainPoint 1
execute if score @s trainPoint matches 6 as @e[type=minecraft:marker,tag=trainMymyBlue,distance=..0.16] if score @s trainRoom = #current trainRoom run scoreboard players add @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] trainPoint 1
execute if score @s trainPoint matches 7 as @e[type=minecraft:marker,tag=trainMymyRed,distance=..0.16] if score @s trainRoom = #current trainRoom run scoreboard players set @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] trainPoint 1

# Déplacement vers le point actif du circuit.
execute if score @s trainPoint matches 1 as @e[type=minecraft:marker,tag=trainMymyOrange,distance=..18] if score @s trainRoom = #current trainRoom at @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] facing entity @s feet run tp @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1,distance=..0.2] ^ ^ ^0.06 facing entity @s feet
execute if score @s trainPoint matches 2 as @e[type=minecraft:marker,tag=trainMymyYellow,distance=..18] if score @s trainRoom = #current trainRoom at @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] facing entity @s feet run tp @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1,distance=..0.2] ^ ^ ^0.06 facing entity @s feet
execute if score @s trainPoint matches 3 as @e[type=minecraft:marker,tag=trainMymyLime,distance=..18] if score @s trainRoom = #current trainRoom at @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] facing entity @s feet run tp @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1,distance=..0.2] ^ ^ ^0.06 facing entity @s feet
execute if score @s trainPoint matches 4 as @e[type=minecraft:marker,tag=trainMymyMagenta,distance=..18] if score @s trainRoom = #current trainRoom at @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] facing entity @s feet run tp @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1,distance=..0.2] ^ ^ ^0.06 facing entity @s feet
execute if score @s trainPoint matches 5 as @e[type=minecraft:marker,tag=trainMymyCyan,distance=..18] if score @s trainRoom = #current trainRoom at @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] facing entity @s feet run tp @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1,distance=..0.2] ^ ^ ^0.06 facing entity @s feet
execute if score @s trainPoint matches 6 as @e[type=minecraft:marker,tag=trainMymyBlue,distance=..18] if score @s trainRoom = #current trainRoom at @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] facing entity @s feet run tp @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1,distance=..0.2] ^ ^ ^0.06 facing entity @s feet
execute if score @s trainPoint matches 7 as @e[type=minecraft:marker,tag=trainMymyRed,distance=..18] if score @s trainRoom = #current trainRoom at @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] facing entity @s feet run tp @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1,distance=..0.2] ^ ^ ^0.06 facing entity @s feet

# Les trois modèles suivent la position et la rotation du contrôleur.
execute as @e[type=minecraft:item_display,tag=trainMymyPart,distance=..2] if score @s trainRoom = #current trainRoom at @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] rotated as @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] run tp @s ~ ~ ~ ~ ~

tag @e[type=minecraft:marker,tag=trainMymyCurrentController,limit=1] remove trainMymyCurrentController
