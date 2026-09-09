execute at @s run function sb:case/timer/cancel {caseName:"D1"}
execute if entity @s[team=Albertos] run function sb:module/simon/finish_team {teamName:"Albertos",enemyTeam:"RTT"}
execute if entity @s[team=RTT] run function sb:module/simon/finish_team {teamName:"RTT",enemyTeam:"Albertos"}
