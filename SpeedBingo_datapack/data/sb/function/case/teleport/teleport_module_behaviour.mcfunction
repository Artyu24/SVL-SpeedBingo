# Si il n'y a aucun joueur de present
execute positioned ~ ~1 ~ unless entity @a[distance=..1,gamemode=adventure] run return fail

# Si le joueur n'est pas de la bonne equipe
$execute positioned ~ ~1 ~ if entity @p[distance=..1,gamemode=adventure,team=!$(teamName)] run title @p[distance=..2,gamemode=adventure,team=!$(teamName)] actionbar {"text":"Tu n'es pas de la bonne équipe","color":"red"} 
$execute positioned ~ ~1 ~ if entity @p[distance=..1,gamemode=adventure,team=!$(teamName)] run return fail

# Si le joueur a deja jouer
$execute positioned ~ ~1 ~ if entity @p[distance=..1,team=$(teamName),tag=BingoModule_$(gameTag)] run title @p[distance=..2,tag=BingoModule_$(gameTag)] actionbar {"text":"Tu as déjà fait ce jeu !","color":"red"} 
$execute positioned ~ ~1 ~ if entity @p[distance=..1,team=$(teamName),tag=BingoModule_$(gameTag)] run return fail

# Si un membre de l'equipe joue deja dans ce module
$execute positioned ~ ~1 ~ if entity @a[distance=..150,team=$(teamName),tag=BingoModule_$(gameTag)_Playing] run title @p[distance=..2,team=$(teamName)] actionbar {"text":"Un joueur de ton équipe est déjà dans ce module !","color":"red"}
$execute positioned ~ ~1 ~ if entity @a[distance=..150,team=$(teamName),tag=BingoModule_$(gameTag)_Playing] run return fail

# Si le joueur n'a pas jouer le jeu

# Si ya déjà un joueur qui joue au module
$execute positioned ~ ~1 ~ if entity @p[distance=..100,team=$(teamName),tag=BingoModule_$(gameTag)_Playing] run title @p[distance=..2,gamemode=adventure,team=!$(teamName)] actionbar {"text":"Quelqu'un est déjà en train de jouer à ce module !","color":"red"} 
$execute positioned ~ ~1 ~ if entity @p[distance=..100,team=$(teamName),tag=BingoModule_$(gameTag)_Playing] run return fail

# Preparation a la tp
$execute positioned ~ ~1 ~ run tag @a[distance=..2,team=$(teamName)] remove BingoTPPad
$execute positioned ~ ~1 ~ run tag @p[distance=..1,team=$(teamName)] add BingoTPPad
$execute positioned ~ ~1 ~ run scoreboard players reset @a[distance=..2,team=$(teamName),tag=!BingoTPPad] BingoTP
$execute positioned ~ ~1 ~ if entity @p[distance=..2,team=$(teamName),tag=!BingoTPPad] run return fail
$execute positioned ~ ~1 ~ run scoreboard players add @p[distance=..1,team=$(teamName),tag=BingoTPPad] BingoTP 1

# Visuel
$execute positioned ~ ~1 ~ as @p[distance=..1,team=$(teamName),tag=BingoTPPad,scores={BingoTP=1}] at @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 0.6 1.5
$execute positioned ~ ~1 ~ as @p[distance=..1,team=$(teamName),tag=BingoTPPad,scores={BingoTP=1..39}] at @s run particle minecraft:reverse_portal ~ ~0.2 ~ 0.35 0.15 0.35 0.08 8 force 

# Textuel
$execute positioned ~ ~1 ~ run title @p[distance=..1,team=$(teamName),tag=BingoTPPad,scores={BingoTP=1..10}] actionbar {"text":"Téléportation  ■□□□","color":"aqua"}
$execute positioned ~ ~1 ~ run title @p[distance=..1,team=$(teamName),tag=BingoTPPad,scores={BingoTP=11..20}] actionbar {"text":"Téléportation  ■■□□","color":"aqua"}
$execute positioned ~ ~1 ~ run title @p[distance=..1,team=$(teamName),tag=BingoTPPad,scores={BingoTP=21..30}] actionbar {"text":"Téléportation  ■■■□","color":"aqua"}
$execute positioned ~ ~1 ~ run title @p[distance=..1,team=$(teamName),tag=BingoTPPad,scores={BingoTP=31..40}] actionbar {"text":"Téléportation  ■■■■","color":"aqua"}
$execute positioned ~ ~1 ~ if entity @p[distance=..1,team=$(teamName),tag=BingoTPPad,scores={BingoTP=..39}] run return fail

# Moment de la TP
$execute positioned ~ ~1 ~ if entity @p[distance=..1,team=$(teamName),tag=BingoTPPad,scores={BingoTP=40..}] run tag @p[team=$(teamName),distance=..1,tag=BingoTPPad] add BingoModule_$(gameTag)_Playing
$function sb:case/head_add_team {teamTag:"$(teamName)", moveX:"$(moveX)", returnMoveX:"$(returnMoveX)"}
$execute positioned ~ ~1 ~ if entity @p[distance=..1,team=$(teamName),tag=BingoModule_$(gameTag)_Playing,tag=BingoTPPad] run scoreboard players reset @p[distance=..1,team=$(teamName),tag=BingoModule_$(gameTag)_Playing,tag=BingoTPPad] BingoTP
$execute positioned ~ ~1 ~ if entity @p[distance=..1,team=$(teamName),tag=BingoModule_$(gameTag)_Playing,tag=BingoTPPad] run tp @p[distance=..1,team=$(teamName),tag=BingoModule_$(gameTag)_Playing,tag=BingoTPPad] $(tpCoord)
$execute as @a[distance=5..100,team=$(teamName),tag=BingoModule_$(gameTag)_Playing,tag=BingoTPPad] run tag @s remove BingoTPPad
return 1
