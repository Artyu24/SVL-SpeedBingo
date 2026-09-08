$function sb:case/case_validation {teamWin:"$(teamWin)",teamLose:"$(teamLose)",caseName:"D1",colorBlock:"$(colorBlock)",colorText:"$(colorText)"}
$scoreboard players operation #D1 BingoSimonScore = #Simon_$(teamWin) BingoSimonScore
$data modify entity @e[distance=..200,type=minecraft:text_display,tag=TextScore_D1,limit=1] text set value [{score:{name:"#D1",objective:"BingoSimonScore"},color:"$(colorText)"},{text:" series",color:"$(colorText)"}]
return 1
