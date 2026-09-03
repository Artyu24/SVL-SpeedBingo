# Attribue un identifiant unique à cette salle.
scoreboard players add #next trainRoom 1
scoreboard players operation @s trainRoom = #next trainRoom
scoreboard players operation #current trainRoom = @s trainRoom

# Relie les sept points du circuit à cette copie de la salle.
$execute as @e[type=minecraft:marker,tag=BingoTrain_$(instance),tag=trainMymyRed,sort=nearest,limit=1,distance=..0.1] run scoreboard players operation @s trainRoom = #current trainRoom
$execute as @e[type=minecraft:marker,tag=BingoTrain_$(instance),tag=trainMymyOrange,sort=nearest,limit=1,distance=..18] run scoreboard players operation @s trainRoom = #current trainRoom
$execute as @e[type=minecraft:marker,tag=BingoTrain_$(instance),tag=trainMymyYellow,sort=nearest,limit=1,distance=..18] run scoreboard players operation @s trainRoom = #current trainRoom
$execute as @e[type=minecraft:marker,tag=BingoTrain_$(instance),tag=trainMymyLime,sort=nearest,limit=1,distance=..18] run scoreboard players operation @s trainRoom = #current trainRoom
$execute as @e[type=minecraft:marker,tag=BingoTrain_$(instance),tag=trainMymyMagenta,sort=nearest,limit=1,distance=..18] run scoreboard players operation @s trainRoom = #current trainRoom
$execute as @e[type=minecraft:marker,tag=BingoTrain_$(instance),tag=trainMymyCyan,sort=nearest,limit=1,distance=..18] run scoreboard players operation @s trainRoom = #current trainRoom
$execute as @e[type=minecraft:marker,tag=BingoTrain_$(instance),tag=trainMymyBlue,sort=nearest,limit=1,distance=..18] run scoreboard players operation @s trainRoom = #current trainRoom

tag @s add trainMymyRegistered
