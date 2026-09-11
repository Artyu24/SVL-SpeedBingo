execute at @s run function sb:case/timer/cancel {caseName:"D1"}
function sb:case/case_finish {caseName:"D1"}
execute if entity @s[team=Albertos] run function sb:module/simon/finish_team {teamName:"Albertos",enemyTeam:"RTT",colorText:"aqua"}
execute if entity @s[team=RTT] run function sb:module/simon/finish_team {teamName:"RTT",enemyTeam:"Albertos",colorText:"green"}
function sb:case/teleport/tpback {caseName:"D1"}
