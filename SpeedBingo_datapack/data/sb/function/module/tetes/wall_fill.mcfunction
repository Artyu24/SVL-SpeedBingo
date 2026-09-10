$execute if data storage sb:tetes wall {block:"minecraft:air"} run fill $(x1) $(y1) $(z1) $(x2) $(y2) $(z2) minecraft:air replace minecraft:black_concrete
$execute unless data storage sb:tetes wall {block:"minecraft:air"} run fill $(x1) $(y1) $(z1) $(x2) $(y2) $(z2) $(block)
