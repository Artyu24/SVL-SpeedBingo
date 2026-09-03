$scoreboard players set @s BingoAirStep $(step)
$title @p[tag=BingoAirship_Running,distance=..40,sort=nearest,limit=1] actionbar [{"text":"Sequence : ","color":"gray"},{"text":"$(step) / 7","color":"green","bold":true}]
playsound minecraft:block.note_block.pling master @p[tag=BingoAirship_Running,distance=..40,sort=nearest,limit=1] ~ ~ ~ 0.8 1.5
