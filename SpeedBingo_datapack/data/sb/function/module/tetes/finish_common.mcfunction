$scoreboard players set #$(teamName) BingoDone_Tetes 1
tag @s remove BingoTetes_Running
tag @s remove BingoModule_Tetes_Playing
tag @s add BingoModule_Tetes

$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run data remove block ~ ~ ~ Items[{id:"minecraft:paper"}]
$function sb:module/tetes/wall_capture {instance:"$(instance)",block:"minecraft:black_concrete"}
$tp @s @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Return,limit=1]

$execute if score #$(teamName) BingoDone_Tetes matches 1 if score #$(enemyTeam) BingoDone_Tetes matches 1 run function sb:module/tetes/compare {teamA:"$(teamName)",colorA:"$(teamColor)",teamB:"$(enemyTeam)",colorB:"$(enemyColor)",caseName:"$(caseName)"}
