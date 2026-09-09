$execute at @s run function sb:case/timer/valid {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
$function sb:case/case_finish {caseName:"$(caseName)"}

tag @s remove BingoCraft_Running

$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Submit,limit=1] run data remove block ~ ~ ~ Items[{id:"minecraft:crossbow"}]

title @s title {"text":"ARBALETE VALIDEE !","color":"green","bold":true}
title @s subtitle {"text":"Tu peux sortir de la salle","color":"yellow"}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
$function sb:case/teleport/tpback {caseName:"$(caseName)"}
