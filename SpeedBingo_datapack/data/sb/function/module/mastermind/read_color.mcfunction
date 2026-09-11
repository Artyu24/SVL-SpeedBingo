# Cherche la laine sur les quatre faces horizontales du marqueur pour supporter //rotate.
scoreboard players set @s BingoMMColor 0
execute positioned ~1 ~ ~ run function sb:module/mastermind/read_color_block
execute positioned ~-1 ~ ~ run function sb:module/mastermind/read_color_block
execute positioned ~ ~ ~1 run function sb:module/mastermind/read_color_block
execute positioned ~ ~ ~-1 run function sb:module/mastermind/read_color_block
