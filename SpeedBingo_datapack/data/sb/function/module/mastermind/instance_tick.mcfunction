# Le joueur peut arriver ailleurs que juste sur le marqueur Start. Toute personne
# de la bonne equipe presente dans cette salle doit donc initialiser sa partie.
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Start,limit=1] as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,scores={BingoMMCooldown=0,BingoMMState=0},distance=..40,sort=nearest,limit=1] run function sb:module/mastermind/player_start {instance:"$(instance)",teamName:"$(teamName)",caseName:"$(caseName)"}

$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_ValidationButton,limit=1] run function sb:module/mastermind/validation_scan {instance:"$(instance)",caseName:"$(caseName)"}

$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Finish,limit=1] run function sb:module/mastermind/finish_scan {instance:"$(instance)",teamName:"$(teamName)",teamColorBlock:"$(teamColorBlock)",teamColorText:"$(teamColorText)",enemyTeam:"$(enemyTeam)",enemyColorBlock:"$(enemyColorBlock)",enemyColorText:"$(enemyColorText)",caseName:"$(caseName)"}
