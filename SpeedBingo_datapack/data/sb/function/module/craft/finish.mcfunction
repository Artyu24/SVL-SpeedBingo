$execute at @s run function sb:case/timer/valid_silent {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
tellraw @s [{"text":"Craft - ","color":"gold"},{"text":"module fini en ","color":"green"},{"score":{"name":"@s","objective":"BingoTimer_Second"},"color":"yellow"},{"text":" secondes","color":"green"}]
$function sb:case/case_finish {caseName:"$(caseName)"}
$function sb:case/teleport/tpback {caseName:"$(caseName)"}

tag @s remove BingoCraft_Running
$function sb:module/craft/refill_instance {instance:"$(instance)"}
