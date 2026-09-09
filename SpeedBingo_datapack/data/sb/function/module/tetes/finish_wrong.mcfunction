$execute at @s run function sb:case/timer/cancel {caseName:"$(caseName)"}
tellraw @s {"text":"Reponse incorrecte.","color":"red"}
$function sb:module/tetes/finish_common {instance:"$(instance)",teamName:"$(teamName)",caseName:"$(caseName)"}
