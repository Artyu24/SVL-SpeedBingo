# Definis l'emplacement de la prochaine tete
$kill @e[distance=..10, type=minecraft:marker, tag=$(teamA)]
$kill @e[distance=..10, type=minecraft:marker, tag=$(teamB)]
kill @e[distance=..10, type=minecraft:item_display, tag=SB_Head]

$summon minecraft:marker ~-1 ~6 ~0 {Tags:[$(teamA)]}
$summon minecraft:marker ~1 ~6 ~0 {Tags:[$(teamB)]}

# Pour gerer la case et le score
$kill @e[distance=..10, type=minecraft:marker, tag=$(caseName)]
$kill @e[distance=..10, type=minecraft:text_display, tag=TextScore_$(caseName)]

$summon minecraft:marker ~ ~1 ~ {Tags:[$(caseName)]}
$summon minecraft:text_display ~ ~4.5 ~ {Tags:[TextScore_$(caseName)], background: 0, billboard: "vertical", default_background: 0b, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [4.0f, 4.0f, 4.0f], translation: [0.0f, 0.0f, 0.0f]}}

execute positioned ~ ~1 ~ run fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:white_concrete replace #survisland:concretes