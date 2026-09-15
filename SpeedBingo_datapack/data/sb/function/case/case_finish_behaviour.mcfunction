$tag @s[tag=BingoModule_$(caseName)_Playing] add BingoModule_$(caseName)
$tag @s[tag=BingoModule_$(caseName)_Playing] remove BingoPlaying
$tag @s remove BingoModule_$(caseName)_Playing
stopsound @s
$execute if entity @s[team=RTT] at @e[type=minecraft:marker,tag=$(caseName)] run setblock ~1 ~1 ~ minecraft:air
$execute if entity @s[team=Albertos] at @e[type=minecraft:marker,tag=$(caseName)] run setblock ~-1 ~1 ~ minecraft:air