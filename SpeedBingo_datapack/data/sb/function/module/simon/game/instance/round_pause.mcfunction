execute if score @s Simon2Timer matches 1.. run scoreboard players remove @s Simon2Timer 1
$execute if score @s Simon2Timer matches 0 run function sb:module/simon/game/instance/add_color {instance:"$(instance)"}
$execute if score @s Simon2Timer matches 0 run function sb:module/simon/game/instance/begin_playback {instance:"$(instance)"}
