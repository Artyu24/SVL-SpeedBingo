execute as @a[tag=BingoMastermind_Running] at @s run function sb:case/timer/cancel {caseName:"B4"}
execute as @a[tag=BingoModule_B4_Playing] at @s run function sb:case/case_finish_behaviour {caseName:"B4"}
tag @a remove BingoMastermind_Running
tag @a remove BingoMastermind_Ready
tag @a remove BingoMastermind_Win
tag @a remove BingoModule_B4
scoreboard players reset @a BingoMMAttempt
scoreboard players reset @a BingoMMExact
scoreboard players reset @a BingoMMMatched
scoreboard players reset @a BingoMMMis
scoreboard players reset @a BingoMMWrong
scoreboard players reset @a BingoMMValid
scoreboard players reset @a BingoMMCooldown
