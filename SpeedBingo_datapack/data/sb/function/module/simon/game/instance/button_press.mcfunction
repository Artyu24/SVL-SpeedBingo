scoreboard players set @s Simon2Pressed 1
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] at @s if score @s Simon2State matches 3 run function sb:module/simon/game/instance/input {instance:"$(instance)",color:$(color)}
function sb:module/simon/game/instance/release_button
