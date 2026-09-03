tag @s add BingoModule_Airship_Playing
tag @s add BingoAirship_Running

# Chaque nouvelle tentative repart avec les sept leviers baisses.
$execute as @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Room,limit=1] at @s run function sb:module/airship/room_reset_silent {instance:"$(instance)"}

# Le point d'arrivee est directement dans le bloc de l'echelle du schema.
$tp @s @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Start,limit=1]
title @s title {"text":"AIRSHIP","color":"gold","bold":true}
title @s subtitle {"text":"Leve les leviers dans l'ordre de 1 a 7","color":"yellow"}
playsound minecraft:block.iron_door.open master @s ~ ~ ~ 0.7 1.2
