# Nettoie les joueurs et remet toutes les instances presentes a zero.
execute as @a[tag=BingoAirship_Running] at @s run function sb:case/timer/cancel
tag @a remove BingoAirship_Running
tag @a remove BingoModule_A3_Playing
tag @a remove BingoModule_A3
tag @a remove BingoAirship_Albertos_Success
tag @a remove BingoAirship_RTT_Success

execute as @e[type=minecraft:marker,tag=BingoAirship_Albertos_Room,limit=1] at @s run function sb:module/airship/room_reset_silent {instance:"Albertos"}
execute as @e[type=minecraft:marker,tag=BingoAirship_RTT_Room,limit=1] at @s run function sb:module/airship/room_reset_silent {instance:"RTT"}
