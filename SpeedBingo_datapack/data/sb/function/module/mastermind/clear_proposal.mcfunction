# Retire uniquement les dix laines de jeu autour des cinq marqueurs de proposition.
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal1,limit=1] at @s run function sb:module/mastermind/clear_proposal_slot
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal2,limit=1] at @s run function sb:module/mastermind/clear_proposal_slot
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal3,limit=1] at @s run function sb:module/mastermind/clear_proposal_slot
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal4,limit=1] at @s run function sb:module/mastermind/clear_proposal_slot
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal5,limit=1] at @s run function sb:module/mastermind/clear_proposal_slot
