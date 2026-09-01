# --- VERIFICATIONS (Le contexte @s est désormais le joueur sur la plaque) ---

# Vérification 1 : Mauvaise équipe
$execute unless entity @s[team=$(teamName)] run title @s actionbar {"text":"Tu n'es pas de la bonne équipe","color":"red"}
$execute unless entity @s[team=$(teamName)] run return fail

# Vérification 2 : Le joueur a déjà fait ce mini-jeu
$execute if entity @s[tag=BingoModule_$(gameTag)] run title @s actionbar {"text":"Tu as déjà fait ce jeu !","color":"red"}
$execute if entity @s[tag=BingoModule_$(gameTag)] run return fail

# Vérification 3 : Un coéquipier joue déjà dans ce module
$execute if entity @a[distance=..150,team=$(teamName),tag=BingoModule_$(gameTag)_Playing] run title @s actionbar {"text":"Un joueur de ton équipe est déjà dans ce module !","color":"red"}
$execute if entity @a[distance=..150,team=$(teamName),tag=BingoModule_$(gameTag)_Playing] run return fail


# --- PREPARATION A LA TELEPORTATION ---

# On retire le tag aux autres joueurs proches pour éviter les conflits
execute positioned ~ ~ ~ run tag @a[distance=..2,tag=BingoTPPad] remove BingoTPPad
tag @s add BingoTPPad

# Incrémentation du score
scoreboard players add @s BingoTP 1

# Effets visuels & sonores
execute if score @s BingoTP matches 1 run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 0.6 1.5
execute if score @s BingoTP matches 1..39 run particle minecraft:reverse_portal ~ ~0.2 ~ 0.35 0.15 0.35 0.08 8 force


# --- TELEPORTATION PROGRESSIVE (ACTIONBAR) ---

# Mise à jour des textes avec un switch sur le score
execute if score @s BingoTP matches 1..10 run title @s actionbar {"text":"Téléportation  ■□□□","color":"aqua"}
execute if score @s BingoTP matches 11..20 run title @s actionbar {"text":"Téléportation  ■■□□","color":"aqua"}
execute if score @s BingoTP matches 21..30 run title @s actionbar {"text":"Téléportation  ■■■□","color":"aqua"}
execute if score @s BingoTP matches 31..40 run title @s actionbar {"text":"Téléportation  ■■■■","color":"aqua"}

# Si le chargement n'est pas terminé, on s'arrête ici
execute if score @s BingoTP matches ..39 run return fail


# --- MOMENT DE LA TELEPORTATION (Score >= 40) ---

$tag @s add BingoModule_$(gameTag)_Playing
$function sb:case/head_add_team {teamTag:"$(teamName)", moveX:"$(moveX)", returnMoveX:"$(returnMoveX)"}

scoreboard players reset @s BingoTP
tag @s remove BingoTPPad

$tp @s $(tpCoord)
return 1