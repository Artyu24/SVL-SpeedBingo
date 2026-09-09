tag @s remove BingoTetes_Running
$function sb:case/case_finish {caseName:"$(caseName)"}

$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] run data remove block ~ ~ ~ Items[{id:"minecraft:paper"}]
$function sb:module/tetes/wall_capture {instance:"$(instance)",block:"minecraft:black_concrete"}
$function sb:case/teleport/tpback {caseName:"$(caseName)"}
