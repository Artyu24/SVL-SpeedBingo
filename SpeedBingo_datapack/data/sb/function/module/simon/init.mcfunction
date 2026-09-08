execute as @a[tag=BingoSimon_Running] at @s run function sb:case/timer/cancel
tag @a remove BingoSimon_Running
tag @a remove BingoModule_D1_Playing
tag @a remove BingoModule_D1

scoreboard players set #Albertos BingoDone_Simon 0
scoreboard players set #RTT BingoDone_Simon 0
scoreboard players set #Simon_Albertos BingoSimonScore 0
scoreboard players set #Simon_RTT BingoSimonScore 0
scoreboard players set #SimonTime_Albertos BingoTimer_Second 0
scoreboard players set #SimonTime_RTT BingoTimer_Second 0
