# Definis l'emplacement de la prochaine tete
$kill @e[distance=..10, type=minecraft:marker, tag=$(teamNameA)]
$kill @e[distance=..10, type=minecraft:marker, tag=$(teamNameB)]
kill @e[distance=..10, type=minecraft:item_display, tag=SB_Head]

$summon minecraft:marker ~-1 ~5 ~0 {Tags:[$(teamNameA)]}
$summon minecraft:marker ~1 ~5 ~0 {Tags:[$(teamNameB)]}