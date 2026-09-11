# Le marqueur Test occupe le premier bloc d'affichage. La tete adjacente
# indique le cote du mur; la ligne part dans le sens oppose.
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] if block ~ ~ ~1 minecraft:player_wall_head run function sb:module/mastermind/display_attempt_north {instance:"$(instance)",attempt:"$(attempt)"}
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] if block ~ ~ ~-1 minecraft:player_wall_head run function sb:module/mastermind/display_attempt_south {instance:"$(instance)",attempt:"$(attempt)"}
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] if block ~1 ~ ~ minecraft:player_wall_head run function sb:module/mastermind/display_attempt_west {instance:"$(instance)",attempt:"$(attempt)"}
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] if block ~-1 ~ ~ minecraft:player_wall_head run function sb:module/mastermind/display_attempt_east {instance:"$(instance)",attempt:"$(attempt)"}
