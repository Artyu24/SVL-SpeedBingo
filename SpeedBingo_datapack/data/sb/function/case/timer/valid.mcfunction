$tag @p[distance=..25, gamemode=adventure, team=$(teamWin)] remove BingoTimerTick

$tellraw @p[distance=..25, gamemode=adventure] ["",{color:"gray",text:"["},{color:"#fffb00",text:"S"},{color:"#fff100",text:"p"},{color:"#ffe700",text:"e"},{color:"#ffdc00",text:"e"},{color:"#ffd200",text:"d "},{color:"#ffbe00",text:"B"},{color:"#ffb400",text:"i"},{color:"#ffa900",text:"n"},{color:"#ff9f00",text:"g"},{color:"#ff9500",text:"o"},{color:"gray",text:"]"}," - ",{color:"gray",text:"["},{color:"yellow",text:"$(caseName)"},{color:"gray",text:"]"}," Tu as fais un temps de ",{score:{name:"@p[distance=..25, gamemode=adventure]",objective:"BingoTimer_Second"},color:"yellow"},{color:"yellow",text:"s"}]

# No Team Winning yet
$execute if entity @e[distance=..200,type=minecraft:marker,tag=$(caseName),tag=!$(teamWin)Win,tag=!$(teamLose)Win,sort=nearest,limit=1] run return run function sb:case/timer/valid_noteam {teamWin:"$(teamWin)", teamLose:"$(teamLose)", caseName:"$(caseName)", colorBlock:"$(colorBlock)", colorText:"$(colorText)"}

# A team has already won, check if the current player has a better time than the winning team
$execute if score #$(caseName) BingoTimer_Saved > @p[distance=..25, gamemode=adventure, team=$(teamWin)] BingoTimer_Second run return run function sb:case/timer/valid_withteam {teamWin:"$(teamWin)", teamLose:"$(teamLose)", caseName:"$(caseName)", colorBlock:"$(colorBlock)", colorText:"$(colorText)"}