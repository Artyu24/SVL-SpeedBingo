$scoreboard players set #$(teamName) BingoValid_Tetes 0
tellraw @s {"text":"Reponse incorrecte.","color":"red"}
$function sb:module/tetes/finish_common {instance:"$(instance)",teamName:"$(teamName)",teamColor:"$(teamColor)",enemyTeam:"$(enemyTeam)",enemyColor:"$(enemyColor)",caseName:"$(caseName)"}
