$scoreboard players set #Mastermind_$(teamA) BingoTime 0
$scoreboard players set #Mastermind_$(teamB) BingoTime 0
$scoreboard players set #$(teamA) BingoValid_MM 0
$scoreboard players set #$(teamB) BingoValid_MM 0
$scoreboard players set #$(teamA) BingoDone_MM 0
$scoreboard players set #$(teamB) BingoDone_MM 0

execute as @a[tag=BingoMastermind_Running] run function sb:timer/stop
tag @a remove BingoMastermind_Running
tag @a remove BingoMastermind_Ready
tag @a remove BingoMastermind_Win
tag @a remove BingoModule_Mastermind
tag @a remove BingoModule_Mastermind_Playing
