scoreboard players add @s BingoMMAttempt 1
scoreboard players set @s BingoMMExact 0
scoreboard players set @s BingoMMMatched 0
scoreboard players set @s BingoMMMis 0
scoreboard players set @s BingoMMWrong 0

scoreboard players set #MMSol1 BingoMMCalc 0
scoreboard players set #MMSol2 BingoMMCalc 0
scoreboard players set #MMSol3 BingoMMCalc 0
scoreboard players set #MMSol4 BingoMMCalc 0
scoreboard players set #MMSol5 BingoMMCalc 0
scoreboard players set #MMSol6 BingoMMCalc 0
scoreboard players set #MMSol7 BingoMMCalc 0
scoreboard players set #MMSol8 BingoMMCalc 0
scoreboard players set #MMSol9 BingoMMCalc 0
scoreboard players set #MMSol10 BingoMMCalc 0
scoreboard players set #MMGuess1 BingoMMCalc 0
scoreboard players set #MMGuess2 BingoMMCalc 0
scoreboard players set #MMGuess3 BingoMMCalc 0
scoreboard players set #MMGuess4 BingoMMCalc 0
scoreboard players set #MMGuess5 BingoMMCalc 0
scoreboard players set #MMGuess6 BingoMMCalc 0
scoreboard players set #MMGuess7 BingoMMCalc 0
scoreboard players set #MMGuess8 BingoMMCalc 0
scoreboard players set #MMGuess9 BingoMMCalc 0
scoreboard players set #MMGuess10 BingoMMCalc 0

$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer1,limit=1] run function sb:module/mastermind/count_answer
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer2,limit=1] run function sb:module/mastermind/count_answer
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer3,limit=1] run function sb:module/mastermind/count_answer
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer4,limit=1] run function sb:module/mastermind/count_answer
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer5,limit=1] run function sb:module/mastermind/count_answer
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal1,limit=1] run function sb:module/mastermind/count_proposal
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal2,limit=1] run function sb:module/mastermind/count_proposal
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal3,limit=1] run function sb:module/mastermind/count_proposal
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal4,limit=1] run function sb:module/mastermind/count_proposal
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal5,limit=1] run function sb:module/mastermind/count_proposal

$execute if score @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer1,limit=1] BingoMMColor = @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal1,limit=1] BingoMMColor run scoreboard players add @s BingoMMExact 1
$execute if score @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer2,limit=1] BingoMMColor = @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal2,limit=1] BingoMMColor run scoreboard players add @s BingoMMExact 1
$execute if score @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer3,limit=1] BingoMMColor = @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal3,limit=1] BingoMMColor run scoreboard players add @s BingoMMExact 1
$execute if score @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer4,limit=1] BingoMMColor = @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal4,limit=1] BingoMMColor run scoreboard players add @s BingoMMExact 1
$execute if score @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Answer5,limit=1] BingoMMColor = @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Proposal5,limit=1] BingoMMColor run scoreboard players add @s BingoMMExact 1

function sb:module/mastermind/calculate_matched
scoreboard players operation @s BingoMMMis = @s BingoMMMatched
scoreboard players operation @s BingoMMMis -= @s BingoMMExact
scoreboard players set #MMFive BingoMMCalc 5
scoreboard players operation @s BingoMMWrong = #MMFive BingoMMCalc
scoreboard players operation @s BingoMMWrong -= @s BingoMMMatched

$execute if score @s BingoMMAttempt matches 1 run function sb:module/mastermind/display_attempt {instance:"$(instance)",attempt:"1"}
$execute if score @s BingoMMAttempt matches 2 run function sb:module/mastermind/display_attempt {instance:"$(instance)",attempt:"2"}
$execute if score @s BingoMMAttempt matches 3 run function sb:module/mastermind/display_attempt {instance:"$(instance)",attempt:"3"}
$execute if score @s BingoMMAttempt matches 4 run function sb:module/mastermind/display_attempt {instance:"$(instance)",attempt:"4"}
$execute if score @s BingoMMAttempt matches 5 run function sb:module/mastermind/display_attempt {instance:"$(instance)",attempt:"5"}

$function sb:module/mastermind/clear_proposal {instance:"$(instance)"}

execute if score @s BingoMMExact matches 5 run tag @s add BingoMastermind_Win
execute if score @s BingoMMExact matches 5 run tag @s add BingoMastermind_Ready
execute if score @s BingoMMExact matches 5 run tellraw @s [{"text":"[Mastermind] ","color":"gold"},{"text":"Combinaison trouvée ! Active la plaque en or pour sortir.","color":"green"}]
execute unless score @s BingoMMExact matches 5 run tellraw @s [{"text":"[Mastermind] Essai ","color":"gold"},{"score":{"name":"@s","objective":"BingoMMAttempt"},"color":"yellow"},{"text":"/5 : ","color":"gray"},{"score":{"name":"@s","objective":"BingoMMExact"},"color":"green"},{"text":" bien placées - ","color":"gray"},{"score":{"name":"@s","objective":"BingoMMMis"},"color":"yellow"},{"text":" mal placées - ","color":"gray"},{"score":{"name":"@s","objective":"BingoMMWrong"},"color":"red"},{"text":" incorrectes","color":"gray"}]

execute if score @s BingoMMAttempt matches 5.. run tag @s add BingoMastermind_Ready
execute if score @s BingoMMAttempt matches 5.. unless score @s BingoMMExact matches 5 run tellraw @s [{"text":"[Mastermind] ","color":"gold"},{"text":"Les 5 essais sont terminés. Tu peux observer le mur, puis active la plaque en or pour sortir.","color":"aqua"}]
