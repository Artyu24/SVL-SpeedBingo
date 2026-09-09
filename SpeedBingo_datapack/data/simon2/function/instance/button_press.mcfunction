scoreboard players set @s Simon2Pressed 1
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] at @s if score @s Simon2State matches 3 run function simon2:instance/input {instance:"$(instance)",color:$(color)}
function simon2:instance/release_button
