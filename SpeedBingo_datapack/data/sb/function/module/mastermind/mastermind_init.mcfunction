execute as @a[tag=BingoMastermind_Running] at @s run function sb:case/timer/cancel
tag @a remove BingoMastermind_Running
tag @a remove BingoMastermind_Ready
tag @a remove BingoMastermind_Win
tag @a remove BingoModule_B4
tag @a remove BingoModule_B4_Playing
