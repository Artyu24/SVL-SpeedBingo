$execute at @s run function sb:case/timer/valid {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
tellraw @s {"text":"Bonne reponse !","color":"green"}
$function sb:module/tetes/finish_common {instance:"$(instance)",teamName:"$(teamName)",caseName:"$(caseName)"}
