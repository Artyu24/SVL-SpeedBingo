# Reinitialise les deux salles et les resultats des equipes.
execute as @a[tag=BingoTetes_Running] at @s run function sb:case/timer/cancel
tag @a remove BingoTetes_Running
tag @a remove BingoModule_C2
tag @a remove BingoModule_C2_Playing

function sb:module/tetes/instance_reset {instance:"Albertos"}
function sb:module/tetes/instance_reset {instance:"RTT"}
