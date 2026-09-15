execute at @e[distance=..100, type=minecraft:marker, tag=RTTSpawn, limit=1] run tp @a[distance=..250, gamemode=adventure, team=RTT] ~ ~ ~
execute at @e[distance=..100, type=minecraft:marker, tag=AlbertosSpawn, limit=1] run tp @a[distance=..250, gamemode=adventure, team=Albertos] ~ ~ ~

clear @a[distance=..250, gamemode=adventure] *[custom_data~{BingoArmorItem:1}]
clear @a[distance=..250, gamemode=adventure] *[custom_data~{BingoElytraItem:1}]
clear @a[distance=..250, gamemode=adventure] *[custom_data~{BingoSearchItem:1}]
clear @a[distance=..250, gamemode=adventure] *[custom_data~{BingoShootItem:1}]
clear @a[distance=..250, gamemode=adventure] *[custom_data~{BingoSulfurItem:1}]
clear @a[distance=..250, gamemode=adventure] *[custom_data~{BingoZipItem:1}]
#clear @a[distance=..250, gamemode=adventure] #sb:mastermind_items[minecraft:custom_data~{sb_module:"mastermind"}]
#clear @a[distance=..250, gamemode=adventure] #sb:craft_items[minecraft:custom_data~{sb_module:"craft"}]

execute as @a[distance=..200] at @s run playsound survisland:abyssion_wrath/end_rat record @s ~ ~ ~ 1

title @a[distance=..200] subtitle {"text":":mignon:","color":"light_purple"} 
title @a[distance=..200] title {"text":"Fin d'épreuve !","color":"gold"}