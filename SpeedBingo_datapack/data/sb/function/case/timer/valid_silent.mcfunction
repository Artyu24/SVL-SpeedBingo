$tag @p[distance=..25,gamemode=adventure,team=$(teamWin)] remove BingoTimerTick

# Valide et colore la case sans envoyer le message standard du timer.
$execute if entity @e[distance=..200,type=minecraft:marker,tag=$(caseName),tag=!$(teamWin)Win,tag=!$(teamLose)Win,sort=nearest,limit=1] run return run function sb:case/timer/valid_noteam {teamWin:"$(teamWin)",teamLose:"$(teamLose)",caseName:"$(caseName)",colorBlock:"$(colorBlock)",colorText:"$(colorText)"}

# Si une equipe a deja gagne la case, ne la remplace que si ce temps est meilleur.
$execute if score #$(caseName) BingoTimer_Saved > @p[distance=..25,gamemode=adventure,team=$(teamWin)] BingoTimer_Second run return run function sb:case/timer/valid_withteam {teamWin:"$(teamWin)",teamLose:"$(teamLose)",caseName:"$(caseName)",colorBlock:"$(colorBlock)",colorText:"$(colorText)"}
