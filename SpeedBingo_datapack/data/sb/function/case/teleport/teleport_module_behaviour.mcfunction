# --- VERIFICATIONS (Le contexte @s est désormais le joueur sur la plaque) ---

# Vérification 1 : Mauvaise équipe
$execute unless entity @s[gamemode=adventure,team=$(teamName)] run title @s actionbar {"text":"Réservé aux joueurs en aventure de la bonne équipe","color":"red"}
$execute unless entity @s[gamemode=adventure,team=$(teamName)] run return fail

# Vérification 2 : Le joueur a déjà fait ce mini-jeu
$execute if entity @s[tag=BingoModule_$(gameTag)] run title @s actionbar {"text":"Tu as déjà fait ce jeu !","color":"red"}
$execute if entity @s[tag=BingoModule_$(gameTag)] run return fail

# Vérification 3 : Un coéquipier joue déjà dans ce module
$execute if entity @a[gamemode=adventure,distance=..200,team=$(teamName),tag=BingoModule_$(gameTag)_Playing] run title @s actionbar {"text":"Un joueur de ton équipe est déjà dans ce module !","color":"red"}
$execute if entity @a[gamemode=adventure,distance=..200,team=$(teamName),tag=BingoModule_$(gameTag)_Playing] run return fail

# --- PREPARATION A LA TELEPORTATION ---

# On retire le tag aux autres joueurs proches pour éviter les conflits
tag @s add BingoTPPad
$execute positioned ~ ~ ~ run scoreboard players set @a[gamemode=adventure,distance=..2,team=$(teamName),tag=!BingoTPPad] BingoTP 0

# Incrémentation du score
scoreboard players add @s BingoTP 1

# Effets visuels & sonores
execute if score @s BingoTP matches 1 run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 0.6 1.5
execute if score @s BingoTP matches 1..39 run particle minecraft:reverse_portal ~ ~0.2 ~ 0.35 0.15 0.35 0.08 8 force


# --- TELEPORTATION PROGRESSIVE (ACTIONBAR) ---

# Mise à jour des textes avec un switch sur le score
execute if score @s BingoTP matches 1..10 run title @s actionbar {"text":"Téléportation  ■□□□","color":"dark_purple"}
execute if score @s BingoTP matches 11..20 run title @s actionbar {"text":"Téléportation  ■■□□","color":"dark_purple"}
execute if score @s BingoTP matches 21..30 run title @s actionbar {"text":"Téléportation  ■■■□","color":"dark_purple"}
execute if score @s BingoTP matches 31..40 run title @s actionbar {"text":"Téléportation  ■■■■","color":"dark_purple"}

# Si le chargement n'est pas terminé, on s'arrête ici
execute if score @s BingoTP matches ..39 run return fail


# --- MOMENT DE LA TELEPORTATION (Score >= 40) ---

$tag @s add BingoModule_$(gameTag)_Playing
tag @s add BingoPlaying

# Pour Simon uniquement, memorise le marqueur D1 exact utilise par l'equipe.
# Les autres modules, notamment Elytra, conservent leur comportement actuel.
$execute if entity @s[tag=BingoModule_D1_Playing] run tag @e[type=minecraft:marker,tag=BingoReturn_$(teamName)] remove BingoReturn_$(teamName)
$execute if entity @s[tag=BingoModule_D1_Playing] run tag @e[type=minecraft:marker,tag=D1,distance=..10,sort=nearest,limit=1] add BingoReturn_$(teamName)

$function sb:case/head_add_team {teamTag:"$(teamName)", moveX:"$(moveX)", returnMoveX:"$(returnMoveX)"}
setblock ~ ~ ~ minecraft:white_stained_glass
$execute if entity @s[team=Albertos] at @e[type=minecraft:marker,tag=$(gameTag),limit=1] run setblock ~-1 ~1 ~ minecraft:light_blue_stained_glass
$execute if entity @s[team=RTT] at @e[type=minecraft:marker,tag=$(gameTag),limit=1] run setblock ~1 ~1 ~ minecraft:lime_stained_glass

scoreboard players reset @s BingoTP
tag @s remove BingoTPPad

stopsound @s

$tp @p[distance=..1,gamemode=adventure, team=$(teamName), tag=BingoModule_$(gameTag)_Playing] $(tpCoord)
return 1
