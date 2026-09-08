$execute at @s run function sb:case/timer/valid {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}

tag @s remove BingoCraft_Running
$tag @s remove BingoModule_$(caseName)_Playing
$tag @s add BingoModule_$(caseName)

$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Submit,limit=1] run data remove block ~ ~ ~ Items[{id:"minecraft:crossbow"}]

title @s title {"text":"ARBALETE VALIDEE !","color":"green","bold":true}
title @s subtitle {"text":"Tu peux sortir de la salle","color":"yellow"}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
$tp @s @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Return,limit=1]
