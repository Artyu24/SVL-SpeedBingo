# Capture les coordonnees entieres des deux marqueurs du mur.
# La selection est decalee d'un bloc vers +Z : les marqueurs Axiom sont
# places un bloc trop pres du mur portant les tetes de panda.
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall1,limit=1] store result storage sb:tetes wall.x1 int 1 run data get entity @s Pos[0] 1
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall1,limit=1] store result storage sb:tetes wall.y1 int 1 run data get entity @s Pos[1] 1
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall1,limit=1] store result score #TetesWallZ1 BingoTP run data get entity @s Pos[2] 1
scoreboard players add #TetesWallZ1 BingoTP 1
execute store result storage sb:tetes wall.z1 int 1 run scoreboard players get #TetesWallZ1 BingoTP
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall2,limit=1] store result storage sb:tetes wall.x2 int 1 run data get entity @s Pos[0] 1
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall2,limit=1] store result storage sb:tetes wall.y2 int 1 run data get entity @s Pos[1] 1
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall2,limit=1] store result score #TetesWallZ2 BingoTP run data get entity @s Pos[2] 1
scoreboard players add #TetesWallZ2 BingoTP 1
execute store result storage sb:tetes wall.z2 int 1 run scoreboard players get #TetesWallZ2 BingoTP
$data modify storage sb:tetes wall.block set value "$(block)"
function sb:module/tetes/wall_fill with storage sb:tetes wall
