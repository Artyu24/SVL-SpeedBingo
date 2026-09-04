tag @p[distance=..5, gamemode=adventure] remove BingoTimerTick

# No Team Winning yet
$execute if entity @e[distance=..150,type=minecraft:marker,tag=$(caseName),tag=!$(teamWin)Win,tag=!$(teamLose)Win,sort=nearest,limit=1] run return run function sb:case/timer/valid_noteam {teamWin:"$(teamWin)", teamLose:"$(teamLose)", caseName:"$(caseName)", colorBlock:"$(colorBlock)", colorText:"$(colorText)"}

# A team has already won, check if the current player has a better time than the winning team
$execute if score #$(caseName) BingoTimer_Saved <= @p[distance=..5, gamemode=adventure] BingoTimer_Second run return fail 

$execute as @e[distance=..150,type=minecraft:marker,tag=$(caseName),tag=$(teamLose),sort=nearest,limit=1] run function sb:case/case_validation {teamWin:"$(teamWin)", teamLose:"$(teamLose)", caseName:"$(caseName)", colorBlock:"$(colorBlock)", colorText:"$(colorText)"}
$scoreboard players operation #$(caseName) BingoTimer_Saved = @p[distance=..5, gamemode=adventure] BingoTimer_Second
$data modify entity @e[distance=..150, type=minecraft:text_display, tag=TextScore_$(caseName), limit=1] text set value [{score:{name:"#$(caseName)",objective:"BingoTimer_Saved"},color:"$(colorText)"},{text:"s",color:"$(colorText)"}]