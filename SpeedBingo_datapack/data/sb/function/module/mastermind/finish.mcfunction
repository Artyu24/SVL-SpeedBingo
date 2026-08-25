$execute if entity @s[tag=BingoMastermind_Win] run scoreboard players operation #$(teamName) BingoTime_MM = @s BingoTime_MM
$execute if entity @s[tag=BingoMastermind_Win] run scoreboard players set #$(teamName) BingoValid_MM 1
$execute unless entity @s[tag=BingoMastermind_Win] run scoreboard players set #$(teamName) BingoValid_MM 0
$scoreboard players set #$(teamName) BingoDone_MM 1

tag @s remove BingoMastermind_Running
tag @s remove BingoMastermind_Ready
tag @s remove BingoMastermind_Win
tag @s remove BingoModule_Mastermind_Playing
tag @s add BingoModule_Mastermind

$tp @s @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Return,limit=1]
$execute if score #$(teamName) BingoDone_MM matches 1 if score #$(enemyTeam) BingoDone_MM matches 1 run function sb:module/mastermind/compare {teamA:"$(teamName)",colorA:"$(teamColor)",teamB:"$(enemyTeam)",colorB:"$(enemyColor)",caseName:"$(caseName)"}
