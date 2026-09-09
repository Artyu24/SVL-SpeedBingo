$function sb:module/mastermind/clear_play_area {instance:"$(instance)"}
$execute at @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Barrel,limit=1] run function sb:module/mastermind/refill_barrel
$function sb:case/timer/start {gameTag:"$(caseName)",teamName:"$(teamName)"}
tellraw @s [{"text":"[Mastermind] ","color":"gold"},{"text":"Partie lancée. Compose 5 propositions de 5 couleurs.","color":"green"}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.2
