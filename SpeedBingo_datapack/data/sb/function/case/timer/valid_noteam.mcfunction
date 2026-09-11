$function sb:case/case_validation {teamWin:"$(teamWin)", teamLose:"$(teamLose)", caseName:"$(caseName)", colorBlock:"$(colorBlock)", colorText:"$(colorText)"}
$scoreboard players operation #$(caseName) BingoTimer_Saved = @p[distance=..25, gamemode=adventure, team=$(teamWin)] BingoTimer_Second
$execute as @e[type=minecraft:marker,tag=$(caseName),tag=$(teamWin)Win,limit=1] at @s run data modify entity @e[type=minecraft:text_display,tag=TextScore_$(caseName),distance=..10,sort=nearest,limit=1] text set value [{score:{name:"#$(caseName)",objective:"BingoTimer_Saved"},color:"$(colorText)"},{text:"s",color:"$(colorText)"}]
return 1
