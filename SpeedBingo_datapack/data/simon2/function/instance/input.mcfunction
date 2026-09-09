$execute store result score @s Simon2Color run data get storage simon2:games $(instance).input[0] 1
$execute unless score @s Simon2Color matches $(color) run return run function simon2:instance/wrong {instance:"$(instance)"}

$data remove storage simon2:games $(instance).input[0]
$scoreboard players set @s Simon2Color $(color)
$function simon2:lights/off {instance:"$(instance)"}
$function simon2:lights/on {instance:"$(instance)"}
scoreboard players set @s Simon2Cooldown 10

$execute unless data storage simon2:games $(instance).input[0] run scoreboard players add @a[tag=Simon2_$(instance)_Player,limit=1] BingoSimonScore 1
$execute unless data storage simon2:games $(instance).input[0] run title @a[tag=Simon2_$(instance)_Player,limit=1] actionbar {"text":"Correct !","color":"green"}
$execute unless data storage simon2:games $(instance).input[0] run scoreboard players set @s Simon2State 4
$execute unless data storage simon2:games $(instance).input[0] run scoreboard players set @s Simon2Timer 25
