# Demarre le chrono lorsque le joueur teleporte arrive dans sa salle.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Start,limit=1] as @a[team=$(teamName),tag=BingoModule_Tetes_Playing,tag=!BingoTetes_Running,distance=..4] run function sb:module/tetes/player_start {teamName:"$(teamName)"}

# Un bouton alimente ouvre le mur de cette instance.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Button,limit=1] if block ~ ~ ~ minecraft:stone_button[powered=true] run function sb:module/tetes/wall_capture {instance:"$(instance)",block:"minecraft:air"}

# La plaque en or termine immediatement la tentative.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Finish,limit=1] if block ~ ~ ~ minecraft:light_weighted_pressure_plate[power=1] as @a[team=$(teamName),tag=BingoModule_Tetes_Playing,tag=BingoTetes_Running,distance=..1] run function sb:module/tetes/check_answer {instance:"$(instance)",teamName:"$(teamName)",teamColor:"$(teamColor)",enemyTeam:"$(enemyTeam)",enemyColor:"$(enemyColor)",caseName:"$(caseName)",answer:"$(answer)"}
