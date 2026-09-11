# Le marqueur est dans le premier bloc; la tete adjacente est cote mur.
execute if block ~ ~ ~1 minecraft:player_wall_head run fill ~ ~ ~ ~ ~ ~-4 minecraft:air
execute if block ~ ~ ~1 minecraft:player_wall_head run fill ~ ~ ~-6 ~ ~ ~-10 minecraft:air
execute if block ~ ~ ~-1 minecraft:player_wall_head run fill ~ ~ ~ ~ ~ ~4 minecraft:air
execute if block ~ ~ ~-1 minecraft:player_wall_head run fill ~ ~ ~6 ~ ~ ~10 minecraft:air
execute if block ~1 ~ ~ minecraft:player_wall_head run fill ~ ~ ~ ~-4 ~ ~ minecraft:air
execute if block ~1 ~ ~ minecraft:player_wall_head run fill ~-6 ~ ~ ~-10 ~ ~ minecraft:air
execute if block ~-1 ~ ~ minecraft:player_wall_head run fill ~ ~ ~ ~4 ~ ~ minecraft:air
execute if block ~-1 ~ ~ minecraft:player_wall_head run fill ~6 ~ ~ ~10 ~ ~ minecraft:air
