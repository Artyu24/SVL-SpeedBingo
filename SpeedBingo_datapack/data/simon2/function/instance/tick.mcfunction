# Nettoie une ancienne session lorsque la salle est revenue a l'etat libre.
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] if score @s Simon2State matches 0 run tag @a[tag=Simon2_$(instance)_Player] remove BingoSimon_Running
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] if score @s Simon2State matches 0 run tag @a[tag=Simon2_$(instance)_Player] remove Simon2_$(instance)_Player

# Le collage ou la rotation peut decaler le marqueur d'un bloc. La recherche
# controle donc les 27 blocs autour du marqueur Start.
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] at @s if score @s Simon2State matches 0 at @e[type=minecraft:marker,tag=Simon2_$(instance)_Start,limit=1] run function simon2:instance/start_scan {instance:"$(instance)"}

# Abandonne proprement la salle si le joueur n'est plus connecte.
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] unless score @s Simon2State matches 0 unless entity @a[tag=Simon2_$(instance)_Player] run function simon2:instance/reset {instance:"$(instance)"}

$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] at @s if score @s Simon2State matches 1 run function simon2:instance/countdown {instance:"$(instance)"}
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] at @s if score @s Simon2State matches 2 run function simon2:instance/playback_tick {instance:"$(instance)"}
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] at @s if score @s Simon2State matches 3 run function simon2:instance/input_tick {instance:"$(instance)"}
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] at @s if score @s Simon2State matches 4 run function simon2:instance/round_pause {instance:"$(instance)"}
