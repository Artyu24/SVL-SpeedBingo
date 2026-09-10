$scoreboard players operation #Simon_$(teamName) BingoSimonScore = @s BingoSimonScore
$scoreboard players operation #SimonTime_$(teamName) BingoTimer_Second = @s BingoTimer_Second
$scoreboard players set #$(teamName) BingoDone_Simon 1

$tellraw @s [{"text":"Simon - ","color":"gold"},{"text":"module fini, ","color":"green"},{"score":{"name":"#Simon_$(teamName)","objective":"BingoSimonScore"},"color":"yellow"},{"text":" séquences réussies en ","color":"green"},{"score":{"name":"#SimonTime_$(teamName)","objective":"BingoTimer_Second"},"color":"yellow"},{"text":" secondes","color":"green"}]

$execute if score #$(teamName) BingoDone_Simon matches 1 if score #$(enemyTeam) BingoDone_Simon matches 1 run function sb:module/simon/compare
