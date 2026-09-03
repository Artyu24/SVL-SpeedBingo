# Un joueur envoye par la grille dans cette salle est place sur l'echelle au lancement.
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Room,limit=1] unless entity @a[tag=BingoAirship_Running,distance=..40] as @a[tag=BingoModule_Airship_Playing,tag=!BingoAirship_Running,distance=..40,sort=nearest,limit=1] run function sb:module/airship/player_start {instance:"$(instance)"}

# Permet aussi de demarrer simplement en arrivant au pied de l'echelle.
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Start,limit=1] unless entity @a[tag=BingoAirship_Running,distance=..40] as @a[tag=!BingoModule_Airship,tag=!BingoAirship_Running,distance=..1.5,sort=nearest,limit=1] run function sb:module/airship/player_start {instance:"$(instance)"}

# La progression appartient au marqueur de la salle, ce qui rend A et B independantes.
$execute as @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Room,limit=1] at @s if entity @a[tag=BingoAirship_Running,distance=..40] run function sb:module/airship/room_tick {instance:"$(instance)"}
