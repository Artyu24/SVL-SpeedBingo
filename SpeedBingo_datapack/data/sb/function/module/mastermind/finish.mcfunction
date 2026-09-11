$execute if entity @s[tag=BingoMastermind_Win] at @s run function sb:case/timer/valid_silent {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
$execute unless entity @s[tag=BingoMastermind_Win] at @s run function sb:case/timer/cancel {caseName:"$(caseName)"}
execute if entity @s[tag=BingoMastermind_Win] run tellraw @s [{"text":"Mastermind - ","color":"gold"},{"text":"combinaison trouvée en ","color":"green"},{"score":{"name":"@s","objective":"BingoTimer_Second"},"color":"yellow"},{"text":" secondes","color":"green"}]
execute unless entity @s[tag=BingoMastermind_Win] run tellraw @s [{"text":"Mastermind - ","color":"gold"},{"text":"combinaison non trouvée","color":"red"}]
$function sb:case/case_finish {caseName:"$(caseName)"}
$function sb:case/teleport/tpback {caseName:"$(caseName)"}

# La remise a zero intervient uniquement apres le retour du joueur.
$function sb:module/mastermind/clear_play_area {instance:"$(instance)"}
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Barrel,limit=1] run function sb:module/mastermind/refill_barrel

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
