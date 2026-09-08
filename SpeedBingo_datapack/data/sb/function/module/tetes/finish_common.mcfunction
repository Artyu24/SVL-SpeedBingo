tag @s remove BingoTetes_Running
$tag @s remove BingoModule_$(caseName)_Playing
$tag @s add BingoModule_$(caseName)

$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run data remove block ~ ~ ~ Items[{id:"minecraft:paper"}]
$function sb:module/tetes/wall_capture {instance:"$(instance)",block:"minecraft:black_concrete"}
$tp @s @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Return,limit=1]
