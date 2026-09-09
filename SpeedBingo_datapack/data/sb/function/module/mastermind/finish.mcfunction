gamemode adventure @s
$execute if entity @s[tag=BingoMastermind_Win] at @s run function sb:case/timer/valid {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
$execute unless entity @s[tag=BingoMastermind_Win] at @s run function sb:case/timer/cancel {caseName:"$(caseName)"}
$function sb:case/case_finish {caseName:"$(caseName)"}

$function sb:module/mastermind/clear_proposal {instance:"$(instance)"}

tag @s remove BingoMastermind_Running
tag @s remove BingoMastermind_Ready
tag @s remove BingoMastermind_Win
scoreboard players reset @s BingoMMAttempt
scoreboard players reset @s BingoMMExact
scoreboard players reset @s BingoMMMatched
scoreboard players reset @s BingoMMMis
scoreboard players reset @s BingoMMWrong
scoreboard players reset @s BingoMMValid
scoreboard players reset @s BingoMMCooldown
$function sb:case/teleport/tpback {caseName:"$(caseName)"}
