# Si le joueur a deja jouer
$execute positioned ~ ~1 ~ if entity @p[distance=..1,tag=$(gameTag)] run title @p[distance=..2,tag=$(gameTag)] actionbar {"text":"Tu as déjà fait ce jeu !","color":"red"} 
$execute positioned ~ ~1 ~ if entity @p[distance=..1,tag=$(gameTag)] run return fail

# Si le joueur n'a pas jouer le jeu

# Preparation a la tp
execute positioned ~ ~1 ~ run tag @a[distance=..2] remove BingoTPPad
execute positioned ~ ~1 ~ run tag @p[distance=..1] add BingoTPPad
execute positioned ~ ~1 ~ run scoreboard players reset @a[distance=..2,tag=!BingoTPPad] BingoTP
execute positioned ~ ~1 ~ if entity @p[distance=..2,tag=!BingoTPPad] run return fail
execute positioned ~ ~1 ~ run scoreboard players add @p[distance=..1,tag=BingoTPPad] BingoTP 1

# Visuel
execute positioned ~ ~1 ~ as @p[distance=..1,tag=BingoTPPad,scores={BingoTP=1}] at @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 0.6 1.5
execute positioned ~ ~1 ~ as @p[distance=..1,tag=BingoTPPad,scores={BingoTP=1..39}] at @s run particle minecraft:reverse_portal ~ ~0.2 ~ 0.35 0.15 0.35 0.08 8 force 

# Textuel
execute positioned ~ ~1 ~ run title @p[distance=..1,tag=BingoTPPad,scores={BingoTP=1..10}] actionbar {"text":"Téléportation  ■□□□","color":"aqua"}
execute positioned ~ ~1 ~ run title @p[distance=..1,tag=BingoTPPad,scores={BingoTP=11..20}] actionbar {"text":"Téléportation  ■■□□","color":"aqua"}
execute positioned ~ ~1 ~ run title @p[distance=..1,tag=BingoTPPad,scores={BingoTP=21..30}] actionbar {"text":"Téléportation  ■■■□","color":"aqua"}
execute positioned ~ ~1 ~ run title @p[distance=..1,tag=BingoTPPad,scores={BingoTP=31..40}] actionbar {"text":"Téléportation  ■■■■","color":"aqua"}
execute positioned ~ ~1 ~ if entity @p[distance=..1,tag=BingoTPPad,scores={BingoTP=..39}] run return fail

# Moment de la TP
$execute positioned ~ ~1 ~ if entity @p[distance=..1,tag=BingoTPPad,scores={BingoTP=40..}] run tag @p[distance=..1,tag=BingoTPPad] add $(gameTag)
$execute positioned ~ ~1 ~ if entity @p[distance=..1,tag=$(gameTag),tag=BingoTPPad] run scoreboard players reset @p[distance=..1,tag=$(gameTag),tag=BingoTPPad] BingoTP
$execute positioned ~ ~1 ~ if entity @p[distance=..1,tag=$(gameTag),tag=BingoTPPad] run tp @p[distance=..1,tag=$(gameTag),tag=BingoTPPad] ~$(x) ~$(y) ~$(z)
$execute as @a[distance=5..100,tag=$(gameTag),tag=BingoTPPad] run tag @s remove BingoTPPad
return 1