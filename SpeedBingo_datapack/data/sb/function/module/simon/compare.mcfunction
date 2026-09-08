# La serie la plus longue gagne. Le temps le plus court ne sert qu'en cas d'egalite.
execute if score #Simon_Albertos BingoSimonScore > #Simon_RTT BingoSimonScore run return run function sb:module/simon/win {teamWin:"Albertos",teamLose:"RTT",colorBlock:"light_blue",colorText:"aqua"}
execute if score #Simon_RTT BingoSimonScore > #Simon_Albertos BingoSimonScore run return run function sb:module/simon/win {teamWin:"RTT",teamLose:"Albertos",colorBlock:"lime",colorText:"green"}
execute if score #Simon_Albertos BingoSimonScore = #Simon_RTT BingoSimonScore if score #SimonTime_Albertos BingoTimer_Second < #SimonTime_RTT BingoTimer_Second run return run function sb:module/simon/win {teamWin:"Albertos",teamLose:"RTT",colorBlock:"light_blue",colorText:"aqua"}
execute if score #Simon_Albertos BingoSimonScore = #Simon_RTT BingoSimonScore if score #SimonTime_RTT BingoTimer_Second < #SimonTime_Albertos BingoTimer_Second run return run function sb:module/simon/win {teamWin:"RTT",teamLose:"Albertos",colorBlock:"lime",colorText:"green"}
tellraw @a {"text":"Egalite parfaite au Simon : meme serie et meme temps.","color":"yellow"}
