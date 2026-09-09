scoreboard players remove @s Simon2Timer 1
$execute if score @s Simon2Timer matches 60 run title @a[tag=Simon2_$(instance)_Player,limit=1] title {"text":"3","color":"yellow"}
$execute if score @s Simon2Timer matches 40 run title @a[tag=Simon2_$(instance)_Player,limit=1] title {"text":"2","color":"gold"}
$execute if score @s Simon2Timer matches 20 run title @a[tag=Simon2_$(instance)_Player,limit=1] title {"text":"1","color":"red"}
$execute if score @s Simon2Timer matches 0 run function simon2:instance/begin_playback {instance:"$(instance)"}
