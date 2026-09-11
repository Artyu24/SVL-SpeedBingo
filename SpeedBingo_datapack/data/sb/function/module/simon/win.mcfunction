$function sb:case/case_validation {teamWin:"$(teamWin)",teamLose:"$(teamLose)",caseName:"D1",colorBlock:"$(colorBlock)",colorText:"$(colorText)"}
$scoreboard players operation #D1 BingoSimonScore = #Simon_$(teamWin) BingoSimonScore
$execute as @e[type=minecraft:marker,tag=D1,tag=BingoReturn_$(teamWin),limit=1] at @s run data modify entity @e[type=minecraft:text_display,tag=TextScore_D1,distance=..10,sort=nearest,limit=1] text set value [{score:{name:"#D1",objective:"BingoSimonScore"},color:"$(colorText)"},{text:" séquence(s)",color:"$(colorText)"}]
return 1
