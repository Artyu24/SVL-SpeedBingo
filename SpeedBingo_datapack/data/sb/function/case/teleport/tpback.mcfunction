# Retourne le joueur vers le marqueur de sa case sur la grille.
# Les deux equipes partagent le meme tag de case ; le marqueur le plus proche
# de la salle correspond au cote de la grille de cette equipe.
$execute unless entity @e[type=minecraft:marker,tag=$(caseName),sort=nearest,limit=1] run tellraw @s [{"text":"[Speed Bingo] ","color":"gold"},{"text":"Marqueur de retour introuvable : $(caseName)","color":"red"}]
$execute unless entity @e[type=minecraft:marker,tag=$(caseName),sort=nearest,limit=1] run return fail
$tp @s @e[type=minecraft:marker,tag=$(caseName),sort=nearest,limit=1]
return 1
