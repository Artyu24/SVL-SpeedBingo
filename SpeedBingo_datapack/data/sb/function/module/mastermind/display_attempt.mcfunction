# La tete placee au marqueur Test donne directement l'orientation du mur.
# Cela reste correct apres un //rotate de la schematic.
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] if block ~ ~ ~ minecraft:player_wall_head[facing=east] run function sb:module/mastermind/display_attempt_north {instance:"$(instance)",attempt:"$(attempt)"}
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] if block ~ ~ ~ minecraft:player_wall_head[facing=west] run function sb:module/mastermind/display_attempt_south {instance:"$(instance)",attempt:"$(attempt)"}
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] if block ~ ~ ~ minecraft:player_wall_head[facing=south] run function sb:module/mastermind/display_attempt_east {instance:"$(instance)",attempt:"$(attempt)"}
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] if block ~ ~ ~ minecraft:player_wall_head[facing=north] run function sb:module/mastermind/display_attempt_west {instance:"$(instance)",attempt:"$(attempt)"}
