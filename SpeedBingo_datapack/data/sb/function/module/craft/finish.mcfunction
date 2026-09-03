function sb:timer/stop
$scoreboard players operation #Craft_$(teamName) BingoTime = @s BingoTime
$scoreboard players set #$(teamName) BingoValid_Craft 1
$scoreboard players set #$(teamName) BingoDone_Craft 1

tag @s remove BingoCraft_Running
tag @s remove BingoModule_Craft_Playing
tag @s add BingoModule_Craft

$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Submit,limit=1] run data remove block ~ ~ ~ Items[{id:"minecraft:crossbow"}]

title @s title {"text":"ARBALETE VALIDEE !","color":"green","bold":true}
title @s subtitle {"text":"Tu peux sortir de la salle","color":"yellow"}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
$tp @s @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Return,limit=1]

$execute if score #$(teamName) BingoDone_Craft matches 1 if score #$(enemyTeam) BingoDone_Craft matches 1 run function sb:module/craft/compare {teamA:"$(teamName)",colorBlockA:"$(teamColorBlock)",colorTextA:"$(teamColorText)",teamB:"$(enemyTeam)",colorBlockB:"$(enemyColorBlock)",colorTextB:"$(enemyColorText)",caseName:"$(caseName)"}
