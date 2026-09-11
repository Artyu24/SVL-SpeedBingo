execute if score @s Simon2Timer matches 1.. run scoreboard players remove @s Simon2Timer 1
$execute if score @s Simon2Phase matches 0 if score @s Simon2Timer matches 0 run function sb:module/simon/game/instance/show_next {instance:"$(instance)"}
$execute if score @s Simon2Phase matches 1 if score @s Simon2Timer matches 0 run function sb:module/simon/game/instance/finish_step {instance:"$(instance)"}
