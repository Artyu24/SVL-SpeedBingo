$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run fill ~ ~ ~-7 ~ ~ ~-11 minecraft:red_concrete
$execute if score @s BingoMMMatched matches 1.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-7 minecraft:yellow_concrete
$execute if score @s BingoMMMatched matches 2.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-8 minecraft:yellow_concrete
$execute if score @s BingoMMMatched matches 3.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-9 minecraft:yellow_concrete
$execute if score @s BingoMMMatched matches 4.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-10 minecraft:yellow_concrete
$execute if score @s BingoMMMatched matches 5.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-11 minecraft:yellow_concrete
$execute if score @s BingoMMExact matches 1.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-7 minecraft:green_concrete
$execute if score @s BingoMMExact matches 2.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-8 minecraft:green_concrete
$execute if score @s BingoMMExact matches 3.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-9 minecraft:green_concrete
$execute if score @s BingoMMExact matches 4.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-10 minecraft:green_concrete
$execute if score @s BingoMMExact matches 5.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~ ~ ~-11 minecraft:green_concrete
