$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Start,limit=1] as @a[team=$(teamName),tag=BingoModule_Mastermind_Playing,tag=!BingoMastermind_Running,distance=..4] run function sb:module/mastermind/player_start {teamName:"$(teamName)"}

$scoreboard players add @a[team=$(teamName),tag=BingoModule_Mastermind_Playing,tag=BingoMastermind_Running] BingoTime_MM 1

$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Finish,limit=1] if block ~ ~ ~ minecraft:light_weighted_pressure_plate[power=1] as @a[team=$(teamName),tag=BingoModule_Mastermind_Playing,tag=BingoMastermind_Running,tag=BingoMastermind_Ready,distance=..1] run function sb:module/mastermind/finish {instance:"$(instance)",teamName:"$(teamName)",teamColor:"$(teamColor)",enemyTeam:"$(enemyTeam)",enemyColor:"$(enemyColor)",caseName:"$(caseName)"}
