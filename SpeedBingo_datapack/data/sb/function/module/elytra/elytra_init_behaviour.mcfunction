#Rings
$tag @e[distance=..100, type=minecraft:marker, tag=RingCenter] remove BingoElytra_$(teamA)
$tag @e[distance=..100, type=minecraft:marker, tag=RingCenter] remove BingoElytra_$(teamB)
execute as @e[distance=..100,type=minecraft:marker,tag=RingCenter] at @s run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 minecraft:white_concrete replace #survisland:concretes

#Score
$scoreboard players set #$(teamA)Score BingoScore_Elytra 0
$scoreboard players set #$(teamB)Score BingoScore_Elytra 0