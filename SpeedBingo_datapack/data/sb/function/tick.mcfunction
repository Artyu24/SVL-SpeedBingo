# Securite : aucun module personnel ne doit rester Running apres la fin de sa case.
scoreboard players reset @a[tag=!BingoModule_B4_Playing,scores={BingoMMState=1..}] BingoMMState
tag @a[tag=BingoTetes_Running,tag=!BingoModule_C2_Playing] remove BingoTetes_Running
tag @a[tag=BingoSimon_Running,tag=!BingoModule_D1_Playing] remove BingoSimon_Running

function sb:case/timer/tick
function sb:module/tetes/tetes_game {teamA:"Albertos",teamB:"RTT",caseName:"C2",answer:"16"}
function sb:module/mastermind/mastermind_game {teamA:"Albertos",teamB:"RTT",caseName:"B4"}
function sb:module/craft/craft_game {teamA:"Albertos",teamB:"RTT",caseName:"A2"}
function sb:module/airship/airship_game
function sb:module/simon/game/tick
