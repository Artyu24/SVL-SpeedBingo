# Reinitialise les deux salles et les resultats des equipes.
execute as @a[tag=BingoTetes_Running] at @s run function sb:case/timer/cancel {caseName:"C2"}
execute as @a[tag=BingoModule_C2_Playing] at @s run function sb:case/case_finish {caseName:"C2"}
tag @a remove BingoTetes_Running
tag @a remove BingoTetesWallOpen

function sb:module/tetes/instance_reset {instance:"Albertos"}
function sb:module/tetes/instance_reset {instance:"RTT"}
