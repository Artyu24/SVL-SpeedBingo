# Reinitialise les deux salles et les resultats des equipes.
$scoreboard players set #Tetes_$(teamA) BingoTime 0
$scoreboard players set #Tetes_$(teamB) BingoTime 0
$scoreboard players set #$(teamA) BingoValid_Tetes 0
$scoreboard players set #$(teamB) BingoValid_Tetes 0
$scoreboard players set #$(teamA) BingoDone_Tetes 0
$scoreboard players set #$(teamB) BingoDone_Tetes 0

execute as @a[tag=BingoTetes_Running] run function sb:timer/stop
tag @a remove BingoTetes_Running
tag @a remove BingoModule_Tetes
tag @a remove BingoModule_Tetes_Playing

function sb:module/tetes/instance_reset {instance:"A"}
function sb:module/tetes/instance_reset {instance:"B"}
