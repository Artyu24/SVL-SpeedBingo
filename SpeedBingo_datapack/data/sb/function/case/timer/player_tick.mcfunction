execute if score @s BingoTimer_Tick matches 20.. run function sb:case/timer/increment_second
execute if score @s BingoTimer_Tick matches 0 run title @s actionbar [{"text":"Temps : ","color":"gold"},{score:{name:"@s",objective:"BingoTimer_Second"},color:"yellow"},{"text":"s","color":"gold"}]
