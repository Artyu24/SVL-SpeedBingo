scoreboard players set @s BingoAirStep 7
$tag @p[tag=BingoAirship_Running,distance=..40,sort=nearest,limit=1] add BingoAirship_$(instance)_Success
$execute as @a[tag=BingoAirship_$(instance)_Success,limit=1] at @s run function sb:case/timer/valid {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
$execute as @a[tag=BingoAirship_$(instance)_Success,limit=1] at @s run function sb:case/case_finish {caseName:"$(caseName)"}

$title @a[tag=BingoAirship_$(instance)_Success] title {"text":"SEQUENCE VALIDEE !","color":"green","bold":true}
$title @a[tag=BingoAirship_$(instance)_Success] subtitle {"text":"Sortie deverrouillee","color":"yellow"}
$playsound minecraft:ui.toast.challenge_complete master @a[tag=BingoAirship_$(instance)_Success] ~ ~ ~ 1 1
$particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.8 0.5 0.1 50 force @a[tag=BingoAirship_$(instance)_Success]

$tag @a[tag=BingoAirship_$(instance)_Success] remove BingoAirship_Running
$execute as @a[tag=BingoAirship_$(instance)_Success,limit=1] at @s run function sb:case/teleport/tpback {caseName:"$(caseName)"}
$tag @a[tag=BingoAirship_$(instance)_Success] remove BingoAirship_$(instance)_Success
