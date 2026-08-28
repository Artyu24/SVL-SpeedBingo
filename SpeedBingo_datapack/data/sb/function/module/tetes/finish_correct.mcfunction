$scoreboard players operation #Tetes_$(teamName) BingoTime = @s BingoTime
$scoreboard players set #$(teamName) BingoValid_Tetes 1
tellraw @s [{"text":"Bonne reponse ! Temps : ","color":"green"},{"score":{"name":"@s","objective":"BingoTime"},"color":"yellow"},{"text":" ticks","color":"gray"}]
$function sb:module/tetes/finish_common {instance:"$(instance)",teamName:"$(teamName)",teamColor:"$(teamColor)",enemyTeam:"$(enemyTeam)",enemyColor:"$(enemyColor)",caseName:"$(caseName)"}
