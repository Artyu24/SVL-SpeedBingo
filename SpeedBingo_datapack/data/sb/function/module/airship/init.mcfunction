# Nettoie les joueurs et remet toutes les instances presentes a zero.
tag @a remove BingoAirship_Running
tag @a remove BingoModule_Airship_Playing
tag @a remove BingoModule_Airship
tag @a remove BingoAirship_A_Success
tag @a remove BingoAirship_B_Success

execute as @e[type=minecraft:marker,tag=BingoAirship_A_Room,limit=1] at @s run function sb:module/airship/room_reset_silent {instance:"A"}
execute as @e[type=minecraft:marker,tag=BingoAirship_B_Room,limit=1] at @s run function sb:module/airship/room_reset_silent {instance:"B"}
