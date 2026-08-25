# Reinitialise les deux salles et les resultats des equipes.
$scoreboard players set #$(teamA) BingoTime_Tetes 0
$scoreboard players set #$(teamB) BingoTime_Tetes 0
$scoreboard players set #$(teamA) BingoValid_Tetes 0
$scoreboard players set #$(teamB) BingoValid_Tetes 0
$scoreboard players set #$(teamA) BingoDone_Tetes 0
$scoreboard players set #$(teamB) BingoDone_Tetes 0

tag @a remove BingoTetes_Running
tag @a remove BingoModule_Tetes
tag @a remove BingoModule_Tetes_Playing

function sb:module/tetes/instance_reset {instance:"A"}
function sb:module/tetes/instance_reset {instance:"B"}
