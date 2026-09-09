$execute if entity @s[tag=BingoMastermind_Win] at @s run function sb:case/timer/valid {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
execute unless entity @s[tag=BingoMastermind_Win] at @s run function sb:case/timer/cancel

tag @s remove BingoMastermind_Running
tag @s remove BingoMastermind_Ready
tag @s remove BingoMastermind_Win
$tag @s remove BingoModule_$(caseName)_Playing
$tag @s add BingoModule_$(caseName)

$function sb:case/teleport/tpback {caseName:"$(caseName)"}
