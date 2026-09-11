$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run data modify block ~ ~ ~ Items set value []
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run function sb:module/tetes/supply_chest
scoreboard players set @s BingoTetesButton 0
tag @s add BingoTetes_Running
$execute at @s run function sb:case/timer/start {gameTag:"$(caseName)",teamName:"$(teamName)"}
