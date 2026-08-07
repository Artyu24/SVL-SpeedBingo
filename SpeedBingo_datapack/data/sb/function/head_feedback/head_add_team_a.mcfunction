execute at @e[distance=..8,type=minecraft:marker,tag=SB_HeadPos_TeamA,limit=1] run summon minecraft:item_display ~ ~ ~ {Rotation:[180f,0f],Tags:["SB_Head_New_TeamA", "SB_Head"],billboard:"fixed",item_display:"head",item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":{id:[I;0,0,0,0]}}}}
data modify entity @e[distance=..8,type=minecraft:item_display,tag=SB_Head_New_TeamA,limit=1] item.components."minecraft:profile".id set from entity @p[distance=..3,limit=1,sort=nearest] UUID
tag @e[distance=..8,type=minecraft:item_display,tag=SB_Head_New_TeamA,limit=1] remove SB_Head_New_TeamA
execute as @e[distance=..8,type=minecraft:marker,tag=SB_HeadPos_TeamA,limit=1] at @s run tp @s ~-1 ~ ~
scoreboard players add @e[distance=..8,type=minecraft:marker,tag=SB_HeadPos_TeamA,limit=1] BingoHead 1
execute as @e[type=minecraft:marker,tag=SB_HeadPos_TeamA,limit=1,scores={BingoHead=3}] at @s run tp @s ~3 ~1 ~
execute as @e[type=minecraft:marker,tag=SB_HeadPos_TeamA,limit=1,scores={BingoHead=6}] at @s run tp @s ~3 ~1 ~