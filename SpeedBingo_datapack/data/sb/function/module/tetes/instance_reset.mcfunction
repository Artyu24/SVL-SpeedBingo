# Referme le mur et prepare le materiel de l'instance.
$function sb:module/tetes/wall_capture {instance:"$(instance)",block:"minecraft:black_concrete"}
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run data modify block ~ ~ ~ Items set value []
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run function sb:module/tetes/supply_chest
