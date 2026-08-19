$tag @e[distance=..100, type=minecraft:marker, tag=RingCenter] remove BingoElytra_$(teamA)
$tag @e[distance=..100, type=minecraft:marker, tag=RingCenter] remove BingoElytra_$(teamB)
execute as @e[distance=..100,type=minecraft:marker,tag=RingCenter] at @s run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 minecraft:white_concrete replace #survisland:concretes

$kill @e[distance=..20, type=minecraft:marker, tag=BingoElytra_$(teamA)Score]
$kill @e[distance=..20, type=minecraft:marker, tag=BingoElytra_$(teamB)Score]

$summon minecraft:marker ~-1 ~0 ~0 {Tags:[BingoElytra_$(teamA)Score]}
$summon minecraft:marker ~1 ~0 ~0 {Tags:[BingoElytra_$(teamB)Score]}