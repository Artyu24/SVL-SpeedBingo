$function simon2:lights/off {instance:"$(instance)"}
$scoreboard players set @e[type=minecraft:marker,tag=Simon2_$(instance)_Room,limit=1] Simon2State 0
$execute as @a[tag=Simon2_$(instance)_Player,limit=1] at @s run function simon2:instance/wrong_player {instance:"$(instance)"}
