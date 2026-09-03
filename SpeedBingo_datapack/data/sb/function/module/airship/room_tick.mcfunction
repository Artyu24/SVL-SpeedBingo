# Construit un masque binaire de l'etat actuel des sept leviers.
# Les marqueurs de leviers suivent correctement une rotation ou un miroir du schematic.
scoreboard players set @s BingoAirState 0
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Lever1,limit=1] if block ~ ~ ~ minecraft:lever[powered=true] run scoreboard players add @s BingoAirState 1
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Lever2,limit=1] if block ~ ~ ~ minecraft:lever[powered=true] run scoreboard players add @s BingoAirState 2
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Lever3,limit=1] if block ~ ~ ~ minecraft:lever[powered=true] run scoreboard players add @s BingoAirState 4
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Lever4,limit=1] if block ~ ~ ~ minecraft:lever[powered=true] run scoreboard players add @s BingoAirState 8
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Lever5,limit=1] if block ~ ~ ~ minecraft:lever[powered=true] run scoreboard players add @s BingoAirState 16
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Lever6,limit=1] if block ~ ~ ~ minecraft:lever[powered=true] run scoreboard players add @s BingoAirState 32
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Lever7,limit=1] if block ~ ~ ~ minecraft:lever[powered=true] run scoreboard players add @s BingoAirState 64

# A chaque etape, seuls l'etat stable et l'etat avec le prochain levier leve sont valides.
$execute if score @s BingoAirStep matches 0 unless score @s BingoAirState matches 0 unless score @s BingoAirState matches 1 run return run function sb:module/airship/wrong {instance:"$(instance)"}
$execute if score @s BingoAirStep matches 1 unless score @s BingoAirState matches 1 unless score @s BingoAirState matches 3 run return run function sb:module/airship/wrong {instance:"$(instance)"}
$execute if score @s BingoAirStep matches 2 unless score @s BingoAirState matches 3 unless score @s BingoAirState matches 7 run return run function sb:module/airship/wrong {instance:"$(instance)"}
$execute if score @s BingoAirStep matches 3 unless score @s BingoAirState matches 7 unless score @s BingoAirState matches 15 run return run function sb:module/airship/wrong {instance:"$(instance)"}
$execute if score @s BingoAirStep matches 4 unless score @s BingoAirState matches 15 unless score @s BingoAirState matches 31 run return run function sb:module/airship/wrong {instance:"$(instance)"}
$execute if score @s BingoAirStep matches 5 unless score @s BingoAirState matches 31 unless score @s BingoAirState matches 63 run return run function sb:module/airship/wrong {instance:"$(instance)"}
$execute if score @s BingoAirStep matches 6 unless score @s BingoAirState matches 63 unless score @s BingoAirState matches 127 run return run function sb:module/airship/wrong {instance:"$(instance)"}

# Avance exactement lorsque le prochain levier attendu vient d'etre leve.
execute if score @s BingoAirStep matches 0 if score @s BingoAirState matches 1 run function sb:module/airship/advance {step:1}
execute if score @s BingoAirStep matches 1 if score @s BingoAirState matches 3 run function sb:module/airship/advance {step:2}
execute if score @s BingoAirStep matches 2 if score @s BingoAirState matches 7 run function sb:module/airship/advance {step:3}
execute if score @s BingoAirStep matches 3 if score @s BingoAirState matches 15 run function sb:module/airship/advance {step:4}
execute if score @s BingoAirStep matches 4 if score @s BingoAirState matches 31 run function sb:module/airship/advance {step:5}
execute if score @s BingoAirStep matches 5 if score @s BingoAirState matches 63 run function sb:module/airship/advance {step:6}
$execute if score @s BingoAirStep matches 6 if score @s BingoAirState matches 127 run function sb:module/airship/success {instance:"$(instance)"}
