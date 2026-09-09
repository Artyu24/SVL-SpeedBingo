$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Start,limit=1] as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=!BingoMastermind_Running,scores={BingoMMCooldown=0},distance=..4,sort=nearest,limit=1] run function sb:module/mastermind/player_start {instance:"$(instance)",teamName:"$(teamName)",caseName:"$(caseName)"}

$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_ValidationButton,limit=1] run function sb:module/mastermind/validation_scan {instance:"$(instance)"}

$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Finish,limit=1] run function sb:module/mastermind/finish_scan {instance:"$(instance)",teamName:"$(teamName)",teamColorBlock:"$(teamColorBlock)",teamColorText:"$(teamColorText)",enemyTeam:"$(enemyTeam)",enemyColorBlock:"$(enemyColorBlock)",enemyColorText:"$(enemyColorText)",caseName:"$(caseName)"}
