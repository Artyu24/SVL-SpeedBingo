scoreboard players add @s BingoTetesWallTick 1
execute if score @s BingoTetesWallTick matches 20.. run scoreboard players set @s BingoTetesWallTick 0
execute if score @s BingoTetesWallTick matches 0 run scoreboard players remove @s BingoTetesWallSecond 1
$execute if score @s BingoTetesWallSecond matches ..0 run function sb:module/tetes/wall_expire {instance:"$(instance)"}
execute if entity @s[tag=BingoTetesWallOpen] run title @s actionbar [{"text":"Temps : ","color":"gold"},{"score":{"name":"@s","objective":"BingoTimer_Second"},"color":"yellow"},{"text":"s | Mur réapparaît dans ","color":"gray"},{"score":{"name":"@s","objective":"BingoTetesWallSecond"},"color":"red"},{"text":" secondes","color":"gray"}]
