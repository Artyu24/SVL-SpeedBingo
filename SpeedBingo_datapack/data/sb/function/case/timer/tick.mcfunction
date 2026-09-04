scoreboard players add @a[tag=BingoTimerTick] BingoTimer_Tick 1
execute as @a[tag=BingoTimerTick] if score @s BingoTimer_Tick matches 20.. run function sb:case/timer/increment_second
execute as @a[tag=BingoTimerTick] run title @s actionbar [{"text":"Temps : ","color":"gold"},{score:{name:"@s",objective:"BingoTimer_Second"},color:"yellow"},{"text":"s","color":"gold"}]