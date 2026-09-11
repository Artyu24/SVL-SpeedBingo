$scoreboard players operation #Simon_$(teamName) BingoSimonScore = @s BingoSimonScore
$scoreboard players operation #SimonTime_$(teamName) BingoTimer_Second = @s BingoTimer_Second
$scoreboard players set #$(teamName) BingoDone_Simon 1

# Affiche immédiatement le résultat de cette équipe sur la grille.
$execute as @e[type=minecraft:marker,tag=D1,tag=BingoReturn_$(teamName),limit=1] at @s run data modify entity @e[type=minecraft:text_display,tag=TextScore_D1,distance=..10,sort=nearest,limit=1] text set value [{score:{name:"#Simon_$(teamName)",objective:"BingoSimonScore"},color:"$(colorText)"},{text:" séquence(s)",color:"$(colorText)"}]

$tellraw @s [{"text":"Simon - ","color":"gold"},{"text":"module fini, ","color":"green"},{"score":{"name":"#Simon_$(teamName)","objective":"BingoSimonScore"},"color":"yellow"},{"text":" séquence(s) finie(s) en ","color":"green"},{"score":{"name":"#SimonTime_$(teamName)","objective":"BingoTimer_Second"},"color":"yellow"},{"text":" secondes","color":"green"}]

$execute if score #$(teamName) BingoDone_Simon matches 1 if score #$(enemyTeam) BingoDone_Simon matches 1 run function sb:module/simon/compare
