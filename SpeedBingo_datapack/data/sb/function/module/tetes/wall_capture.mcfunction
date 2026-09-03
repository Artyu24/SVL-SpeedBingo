# Capture les coordonnees entieres des deux marqueurs du mur.
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall1,limit=1] store result storage sb:tetes wall.x1 int 1 run data get entity @s Pos[0] 1
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall1,limit=1] store result storage sb:tetes wall.y1 int 1 run data get entity @s Pos[1] 1
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall1,limit=1] store result storage sb:tetes wall.z1 int 1 run data get entity @s Pos[2] 1
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall2,limit=1] store result storage sb:tetes wall.x2 int 1 run data get entity @s Pos[0] 1
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall2,limit=1] store result storage sb:tetes wall.y2 int 1 run data get entity @s Pos[1] 1
$execute as @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Wall2,limit=1] store result storage sb:tetes wall.z2 int 1 run data get entity @s Pos[2] 1
$data modify storage sb:tetes wall.block set value "$(block)"
function sb:module/tetes/wall_fill with storage sb:tetes wall
