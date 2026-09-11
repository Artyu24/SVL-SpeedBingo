# Vide puis remplit le coffre de jeu avec les dix couleurs autorisees.
data modify block ~ ~ ~ Items set value []
item replace block ~ ~ ~ container.0 with minecraft:white_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.1 with minecraft:lime_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.2 with minecraft:cyan_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.3 with minecraft:red_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.4 with minecraft:yellow_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.5 with minecraft:black_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.6 with minecraft:orange_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.7 with minecraft:purple_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.8 with minecraft:blue_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.9 with minecraft:light_blue_wool[minecraft:can_place_on={blocks:"minecraft:yellow_concrete"}] 64
item replace block ~ ~ ~ container.10 with minecraft:shears[minecraft:can_break={blocks:["minecraft:white_wool","minecraft:lime_wool","minecraft:cyan_wool","minecraft:red_wool","minecraft:yellow_wool","minecraft:black_wool","minecraft:orange_wool","minecraft:purple_wool","minecraft:blue_wool","minecraft:light_blue_wool"]}] 1
