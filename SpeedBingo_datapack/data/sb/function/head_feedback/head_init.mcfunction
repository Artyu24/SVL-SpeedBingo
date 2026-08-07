# Definis l'emplacement de la prochaine tete
kill @e[distance=..10, type=minecraft:marker, tag=SB_HeadPos_TeamA]
kill @e[distance=..10, type=minecraft:marker, tag=SB_HeadPos_TeamB]
kill @e[distance=..10, type=minecraft:item_display, tag=SB_Head]

summon minecraft:marker ~-1 ~5 ~0 {Tags:[SB_HeadPos_TeamA]}
summon minecraft:marker ~1 ~5 ~0 {Tags:[SB_HeadPos_TeamB]}