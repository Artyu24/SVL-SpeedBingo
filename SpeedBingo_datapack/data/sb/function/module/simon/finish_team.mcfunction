# Conserve le meilleur resultat de l'equipe au lieu de remplacer celui-ci
# par la derniere tentative. En cas d'egalite, le temps le plus court gagne.
$execute unless score #$(teamName) BingoDone_Simon matches 1 run function sb:module/simon/save_best {teamName:"$(teamName)"}
$execute if score #$(teamName) BingoDone_Simon matches 1 if score @s BingoSimonScore > #Simon_$(teamName) BingoSimonScore run function sb:module/simon/save_best {teamName:"$(teamName)"}
$execute if score #$(teamName) BingoDone_Simon matches 1 if score @s BingoSimonScore = #Simon_$(teamName) BingoSimonScore if score @s BingoTimer_Second < #SimonTime_$(teamName) BingoTimer_Second run function sb:module/simon/save_best {teamName:"$(teamName)"}
$scoreboard players set #$(teamName) BingoDone_Simon 1

# Affiche immédiatement le résultat de cette équipe sur la grille.
$execute as @e[type=minecraft:marker,tag=D1,tag=BingoReturn_$(teamName),limit=1] at @s run data modify entity @e[type=minecraft:text_display,tag=TextScore_D1,distance=..10,sort=nearest,limit=1] text set value [{score:{name:"#Simon_$(teamName)",objective:"BingoSimonScore"},color:"$(colorText)"},{text:" séquence(s)",color:"$(colorText)"}]

$tellraw @s [{"text":"Simon - ","color":"gold"},{"text":"module fini, ","color":"green"},{"score":{"name":"@s","objective":"BingoSimonScore"},"color":"yellow"},{"text":" séquence(s) finie(s) en ","color":"green"},{"score":{"name":"@s","objective":"BingoTimer_Second"},"color":"yellow"},{"text":" secondes","color":"green"}]

$execute if score #$(teamName) BingoDone_Simon matches 1 if score #$(enemyTeam) BingoDone_Simon matches 1 run function sb:module/simon/compare
