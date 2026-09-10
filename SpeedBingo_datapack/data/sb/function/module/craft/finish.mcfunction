$execute at @s run function sb:case/timer/valid_silent {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
tellraw @s [{"text":"Module validé en ","color":"green"},{"score":{"name":"@s","objective":"BingoTimer_Second"},"color":"yellow"},{"text":" secondes","color":"green"}]
$function sb:case/case_finish {caseName:"$(caseName)"}

tag @s remove BingoCraft_Running

$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Submit,limit=1] run data remove block ~ ~ ~ Items[{id:"minecraft:crossbow"}]

$function sb:case/teleport/tpback {caseName:"$(caseName)"}
