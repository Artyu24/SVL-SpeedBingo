$execute at @e[distance=..8,type=minecraft:marker,tag=$(teamTag),limit=1] run summon minecraft:item_display ~ ~ ~ {Rotation:[180f,0f],Tags:["$(teamTag)_New", "SB_Head"],billboard:"fixed",item_display:"head",item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":{id:[I;0,0,0,0]}}}}
$data modify entity @e[distance=..8,type=minecraft:item_display,tag=$(teamTag)_New,limit=1] item.components."minecraft:profile".id set from entity @p[distance=..3,limit=1,sort=nearest] UUID
$tag @e[distance=..8,type=minecraft:item_display,tag=$(teamTag)_New,limit=1] remove $(teamTag)_New
$execute as @e[distance=..8,type=minecraft:marker,tag=$(teamTag),limit=1] at @s run tp @s ~$(moveX) ~ ~
$scoreboard players add @e[distance=..8,type=minecraft:marker,tag=$(teamTag),limit=1] BingoHead 1
$execute as @e[distance=..8,type=minecraft:marker,tag=$(teamTag),limit=1,scores={BingoHead=3}] at @s run tp @s ~$(returnMoveX) ~1 ~
$execute as @e[distance=..8,type=minecraft:marker,tag=$(teamTag),limit=1,scores={BingoHead=6}] at @s run tp @s ~$(returnMoveX) ~1 ~