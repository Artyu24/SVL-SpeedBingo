scoreboard players set @s BingoAirStep 7
$tag @p[tag=BingoAirship_Running,distance=..40,sort=nearest,limit=1] add BingoAirship_$(instance)_Success

$title @a[tag=BingoAirship_$(instance)_Success] title {"text":"SEQUENCE VALIDEE !","color":"green","bold":true}
$title @a[tag=BingoAirship_$(instance)_Success] subtitle {"text":"Sortie deverrouillee","color":"yellow"}
$playsound minecraft:ui.toast.challenge_complete master @a[tag=BingoAirship_$(instance)_Success] ~ ~ ~ 1 1
$particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.8 0.5 0.1 50 force @a[tag=BingoAirship_$(instance)_Success]

$tag @a[tag=BingoAirship_$(instance)_Success] add BingoModule_Airship
$tag @a[tag=BingoAirship_$(instance)_Success] remove BingoAirship_Running
$tp @a[tag=BingoAirship_$(instance)_Success,limit=1] @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Exit,limit=1]
$tag @a[tag=BingoAirship_$(instance)_Success] remove BingoModule_Airship_Playing
$tag @a[tag=BingoAirship_$(instance)_Success] remove BingoAirship_$(instance)_Success
