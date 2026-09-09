# Le coffre de materiel est a deux blocs du baril. Les quatre directions sont
# testees afin de rester compatible avec une salle collee avec rotation.
execute positioned ~2 ~ ~ if block ~ ~ ~ minecraft:chest run function sb:module/tetes/supply_chest_fill
execute positioned ~-2 ~ ~ if block ~ ~ ~ minecraft:chest run function sb:module/tetes/supply_chest_fill
execute positioned ~ ~ ~2 if block ~ ~ ~ minecraft:chest run function sb:module/tetes/supply_chest_fill
execute positioned ~ ~ ~-2 if block ~ ~ ~ minecraft:chest run function sb:module/tetes/supply_chest_fill
