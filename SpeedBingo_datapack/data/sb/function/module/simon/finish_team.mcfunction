$scoreboard players operation #Simon_$(teamName) BingoSimonScore = @s BingoSimonScore
$scoreboard players operation #SimonTime_$(teamName) BingoTimer_Second = @s BingoTimer_Second
$scoreboard players set #$(teamName) BingoDone_Simon 1

tag @s remove BingoModule_D1_Playing
tag @s add BingoModule_D1

$tellraw @s [{"text":"Resultat Simon : ","color":"gold"},{"score":{"name":"#Simon_$(teamName)","objective":"BingoSimonScore"},"color":"yellow"},{"text":" series en ","color":"gold"},{"score":{"name":"#SimonTime_$(teamName)","objective":"BingoTimer_Second"},"color":"yellow"},{"text":"s","color":"gold"}]

$execute if score #$(teamName) BingoDone_Simon matches 1 if score #$(enemyTeam) BingoDone_Simon matches 1 run function sb:module/simon/compare
