# Definis l'emplacement de la prochaine tete
$kill @e[distance=..10, type=minecraft:marker, tag=$(teamA)]
$kill @e[distance=..10, type=minecraft:marker, tag=$(teamB)]
$kill @e[distance=..10, type=minecraft:marker, tag=$(caseName)]
kill @e[distance=..10, type=minecraft:item_display, tag=SB_Head]

$summon minecraft:marker ~-1 ~5 ~0 {Tags:[$(teamA)]}
$summon minecraft:marker ~1 ~5 ~0 {Tags:[$(teamB)]}
$summon minecraft:marker ~ ~1 ~0 {Tags:[$(caseName)]}