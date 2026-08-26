function sb:module/elytra/elytra_behaviour {mainTeam:"Rat", colorTeam:"red", enemyTeam:"Stagiaire"}
function sb:module/elytra/elytra_behaviour {mainTeam:"Stagiaire", colorTeam:"green", enemyTeam:"Rat"}
$function sb:module/elytra/elytra_win_behaviour {teamA:"Rat", teamB:"Stagiaire", caseName:"$(caseName)", colorTeamA:"red", colorTeamB:"green"}

$function sb:module/elytra/elytra_floorwarning_behaviour {caseName:"$(caseName)"}

#Show Score
$data modify entity @e[distance=..100, type=minecraft:text_display, tag=TextScore_$(caseName), limit=1] text set value [{score:{name:"#RatScore",objective:"BingoScore_Elytra"},color:"red"},{text:" - ",color:"gray"},{score:{name:"#StagiaireScore",objective:"BingoScore_Elytra"},color:"green"}]