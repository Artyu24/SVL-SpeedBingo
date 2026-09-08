# Le chrono commun est deja lance par la case C2 lors de la teleportation.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Start,limit=1] as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=!BingoTetes_Running,distance=..4] run function sb:module/tetes/player_start {teamName:"$(teamName)"}

# Un bouton alimente ouvre le mur de cette instance.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Button,limit=1] if block ~ ~ ~ minecraft:stone_button[powered=true] run function sb:module/tetes/wall_capture {instance:"$(instance)",block:"minecraft:air"}

# La plaque en or termine immediatement la tentative.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Finish,limit=1] if block ~ ~ ~ minecraft:light_weighted_pressure_plate[power=1] as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTetes_Running,distance=..1] run function sb:module/tetes/check_answer {instance:"$(instance)",teamName:"$(teamName)",teamColorBlock:"$(teamColorBlock)",teamColorText:"$(teamColorText)",enemyTeam:"$(enemyTeam)",enemyColorBlock:"$(enemyColorBlock)",enemyColorText:"$(enemyColorText)",caseName:"$(caseName)",answer:"$(answer)"}
