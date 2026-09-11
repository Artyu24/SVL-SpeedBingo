execute if score @s Simon2Cooldown matches 1.. run scoreboard players remove @s Simon2Cooldown 1
$execute if score @s Simon2Cooldown matches 2 run function sb:module/simon/game/lights/off {instance:"$(instance)"}

$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Button1,limit=1] at @s unless block ~ ~ ~ minecraft:pale_oak_button[powered=true] run scoreboard players set @s Simon2Pressed 0
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Button2,limit=1] at @s unless block ~ ~ ~ minecraft:pale_oak_button[powered=true] run scoreboard players set @s Simon2Pressed 0
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Button3,limit=1] at @s unless block ~ ~ ~ minecraft:pale_oak_button[powered=true] run scoreboard players set @s Simon2Pressed 0
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Button4,limit=1] at @s unless block ~ ~ ~ minecraft:pale_oak_button[powered=true] run scoreboard players set @s Simon2Pressed 0

$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Button1,limit=1] at @s if block ~ ~ ~ minecraft:pale_oak_button[powered=true] if score @s Simon2Pressed matches 0 run function sb:module/simon/game/instance/button_press {instance:"$(instance)",color:1}
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Button2,limit=1] at @s if block ~ ~ ~ minecraft:pale_oak_button[powered=true] if score @s Simon2Pressed matches 0 run function sb:module/simon/game/instance/button_press {instance:"$(instance)",color:2}
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Button3,limit=1] at @s if block ~ ~ ~ minecraft:pale_oak_button[powered=true] if score @s Simon2Pressed matches 0 run function sb:module/simon/game/instance/button_press {instance:"$(instance)",color:3}
$execute as @e[type=minecraft:marker,tag=Simon2_$(instance)_Button4,limit=1] at @s if block ~ ~ ~ minecraft:pale_oak_button[powered=true] if score @s Simon2Pressed matches 0 run function sb:module/simon/game/instance/button_press {instance:"$(instance)",color:4}
