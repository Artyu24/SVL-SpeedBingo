$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run fill ~$(x1) ~ ~$(z1) ~$(x5) ~ ~$(z5) minecraft:red_concrete
$execute if score @s BingoMMMatched matches 1.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x1) ~ ~$(z1) minecraft:yellow_concrete
$execute if score @s BingoMMMatched matches 2.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x2) ~ ~$(z2) minecraft:yellow_concrete
$execute if score @s BingoMMMatched matches 3.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x3) ~ ~$(z3) minecraft:yellow_concrete
$execute if score @s BingoMMMatched matches 4.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x4) ~ ~$(z4) minecraft:yellow_concrete
$execute if score @s BingoMMMatched matches 5.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x5) ~ ~$(z5) minecraft:yellow_concrete
$execute if score @s BingoMMExact matches 1.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x1) ~ ~$(z1) minecraft:green_concrete
$execute if score @s BingoMMExact matches 2.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x2) ~ ~$(z2) minecraft:green_concrete
$execute if score @s BingoMMExact matches 3.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x3) ~ ~$(z3) minecraft:green_concrete
$execute if score @s BingoMMExact matches 4.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x4) ~ ~$(z4) minecraft:green_concrete
$execute if score @s BingoMMExact matches 5.. at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test$(attempt),limit=1] run setblock ~$(x5) ~ ~$(z5) minecraft:green_concrete
