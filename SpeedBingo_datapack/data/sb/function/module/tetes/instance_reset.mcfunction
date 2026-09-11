# Referme le mur et prepare le materiel de l'instance.
$function sb:module/tetes/wall_close {instance:"$(instance)"}
$tag @a[team=$(instance)] remove BingoTetesWallOpen
$scoreboard players reset @a[team=$(instance)] BingoTetesWallTick
$scoreboard players reset @a[team=$(instance)] BingoTetesWallSecond
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run data modify block ~ ~ ~ Items set value []
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run function sb:module/tetes/supply_chest
