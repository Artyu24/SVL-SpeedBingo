scoreboard players set @s BingoAirStep 7
$tag @p[tag=BingoAirship_Running,distance=..40,sort=nearest,limit=1] add BingoAirship_$(instance)_Success
$execute as @a[tag=BingoAirship_$(instance)_Success,limit=1] at @s run function sb:case/timer/valid_silent {teamWin:"$(teamName)",teamLose:"$(enemyTeam)",caseName:"$(caseName)",colorBlock:"$(teamColorBlock)",colorText:"$(teamColorText)"}
$execute as @a[tag=BingoAirship_$(instance)_Success,limit=1] at @s run function sb:case/case_finish {caseName:"$(caseName)"}
$execute as @a[tag=BingoAirship_$(instance)_Success,limit=1] run tellraw @s [{"text":"Leviers - ","color":"gold"},{"text":"module fini en ","color":"green"},{"score":{"name":"@s","objective":"BingoTimer_Second"},"color":"yellow"},{"text":" secondes","color":"green"}]

$execute as @a[tag=BingoAirship_$(instance)_Success,limit=1] at @s run function sb:case/teleport/tpback {caseName:"$(caseName)"}

# Remet la salle a zero uniquement apres le retour du joueur sur la grille.
$function sb:module/airship/room_reset_silent {instance:"$(instance)"}
$tag @a[tag=BingoAirship_$(instance)_Success] remove BingoAirship_Running
$tag @a[tag=BingoAirship_$(instance)_Success] remove BingoAirship_$(instance)_Success
