# Referme le mur et vide le tonneau de l'instance.
$function sb:module/tetes/wall_capture {instance:"$(instance)",block:"minecraft:black_concrete"}
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run data remove block ~ ~ ~ Items[{id:"minecraft:paper"}]
