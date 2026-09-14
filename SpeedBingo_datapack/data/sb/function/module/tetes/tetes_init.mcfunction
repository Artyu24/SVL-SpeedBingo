# Reinitialise les deux salles et les resultats des equipes.
execute as @a[tag=BingoTetes_Running] at @s run function sb:case/timer/cancel {caseName:"B1"}
execute as @a[tag=BingoModule_B1_Playing] at @s run function sb:case/case_finish_behaviour {caseName:"B1"}
tag @a remove BingoTetes_Running
tag @a remove BingoTetesWallOpen

function sb:module/tetes/instance_reset {instance:"Albertos"}
function sb:module/tetes/instance_reset {instance:"RTT"}
