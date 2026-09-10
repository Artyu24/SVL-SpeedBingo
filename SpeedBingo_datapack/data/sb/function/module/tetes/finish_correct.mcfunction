$execute at @s run function sb:case/timer/valid_silent {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
tellraw @s [{"text":"Têtes - ","color":"gold"},{"text":"bonne réponse en ","color":"green"},{"score":{"name":"@s","objective":"BingoTimer_Second"},"color":"yellow"},{"text":" secondes","color":"green"}]
$function sb:module/tetes/finish_common {instance:"$(instance)",teamName:"$(teamName)",caseName:"$(caseName)"}
