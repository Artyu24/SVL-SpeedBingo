$scoreboard players add @a[tag=BingoModule_$(caseName)_Playing] BingoMMCooldown 0
$scoreboard players add @a[tag=BingoModule_$(caseName)_Playing] BingoMMState 0
$scoreboard players remove @a[tag=BingoModule_$(caseName)_Playing,scores={BingoMMCooldown=1..}] BingoMMCooldown 1

$function sb:module/mastermind/instance_tick {instance:"Albertos",teamName:"$(teamA)",teamColorBlock:"light_blue",teamColorText:"aqua",enemyTeam:"$(teamB)",enemyColorBlock:"lime",enemyColorText:"green",caseName:"$(caseName)"}
$function sb:module/mastermind/instance_tick {instance:"RTT",teamName:"$(teamB)",teamColorBlock:"lime",teamColorText:"green",enemyTeam:"$(teamA)",enemyColorBlock:"light_blue",enemyColorText:"aqua",caseName:"$(caseName)"}
