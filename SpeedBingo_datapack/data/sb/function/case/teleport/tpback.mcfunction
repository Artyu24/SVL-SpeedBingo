# Retourne le joueur vers le marqueur de sa case sur la grille.
# Le marqueur memorise lors de l'entree est prioritaire. La recherche par nom
# de case reste disponible pour les anciennes salles et les appels manuels.
$execute if entity @s[team=Albertos] if entity @e[type=minecraft:marker,tag=$(caseName),tag=BingoReturn_Albertos,limit=1] run return run tp @s @e[type=minecraft:marker,tag=$(caseName),tag=BingoReturn_Albertos,limit=1]
$execute if entity @s[team=RTT] if entity @e[type=minecraft:marker,tag=$(caseName),tag=BingoReturn_RTT,limit=1] run return run tp @s @e[type=minecraft:marker,tag=$(caseName),tag=BingoReturn_RTT,limit=1]

$execute unless entity @e[type=minecraft:marker,tag=$(caseName),sort=nearest,limit=1] run tellraw @s [{"text":"[Speed Bingo] ","color":"gold"},{"text":"Marqueur de retour introuvable : $(caseName)","color":"red"}]
$execute unless entity @e[type=minecraft:marker,tag=$(caseName),sort=nearest,limit=1] run return fail
$tp @s @e[type=minecraft:marker,tag=$(caseName),sort=nearest,limit=1]
return 1
