$function sb:module/mastermind/clear_play_area {instance:"$(instance)"}
$function sb:case/timer/start {gameTag:"$(caseName)",teamName:"$(teamName)"}
tellraw @s [{"text":"Partie lancée.","color":"green"}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.2
