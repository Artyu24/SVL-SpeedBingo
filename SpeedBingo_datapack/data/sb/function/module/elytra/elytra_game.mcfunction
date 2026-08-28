function sb:module/elytra/elytra_behaviour {mainTeam:"Albertos", colorTeam:"light_blue", enemyTeam:"RTT"}
function sb:module/elytra/elytra_behaviour {mainTeam:"RTT", colorTeam:"lime", enemyTeam:"Albertos"}
$function sb:module/elytra/elytra_win_behaviour {teamA:"Albertos", teamB:"RTT", caseName:"$(caseName)", colorTeamBlockA:"light_blue", colorTeamTextA:"aqua", colorTeamBlockB:"lime", colorTeamTextB:"green"}

$function sb:module/elytra/elytra_floorwarning_behaviour {caseName:"$(caseName)"}

#Show Score
$data modify entity @e[distance=..100, type=minecraft:text_display, tag=TextScore_$(caseName), limit=1] text set value [{score:{name:"#AlbertosScore",objective:"BingoScore_Elytra"},color:"aqua"},{text:" - ",color:"gray"},{score:{name:"#RTTScore",objective:"BingoScore_Elytra"},color:"green"}]

$function sb:module/elytra/elytra_lose_behaviour {caseName:"$(caseName)"}