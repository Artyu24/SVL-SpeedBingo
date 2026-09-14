# Securite : aucun module personnel ne doit rester Running apres la fin de sa case.
scoreboard players reset @a[tag=!BingoModule_B4_Playing,scores={BingoMMState=1..}] BingoMMState
tag @a[tag=BingoTetes_Running,tag=!BingoModule_C2_Playing] remove BingoTetes_Running
tag @a[tag=BingoSimon_Running,tag=!BingoModule_D1_Playing] remove BingoSimon_Running

function sb:case/timer/tick
# Les salles inactives ne lancent ni recherche de joueur ni lecture de bloc.
execute if entity @a[gamemode=adventure,tag=BingoModule_C2_Playing] run function sb:module/tetes/tetes_game {teamA:"Albertos",teamB:"RTT",caseName:"C2",answer:"16"}
execute if entity @a[gamemode=adventure,tag=BingoModule_B4_Playing] run function sb:module/mastermind/mastermind_game {teamA:"Albertos",teamB:"RTT",caseName:"B4"}
execute if entity @a[gamemode=adventure,tag=BingoModule_A2_Playing] run function sb:module/craft/craft_game {teamA:"Albertos",teamB:"RTT",caseName:"A2"}
execute if entity @a[gamemode=adventure,tag=BingoModule_A3_Playing] run function sb:module/airship/airship_game
function sb:module/simon/game/tick
