$execute store result score @s Simon2Color run data get storage sb:simon $(instance).input[0] 1
$execute unless score @s Simon2Color matches $(color) run return run function sb:module/simon/game/instance/wrong {instance:"$(instance)"}

$data remove storage sb:simon $(instance).input[0]
$scoreboard players set @s Simon2Color $(color)
$function sb:module/simon/game/lights/off {instance:"$(instance)"}
$function sb:module/simon/game/lights/on {instance:"$(instance)"}
scoreboard players set @s Simon2Cooldown 10

$execute unless data storage sb:simon $(instance).input[0] run scoreboard players add @a[tag=Simon2_$(instance)_Player,limit=1] BingoSimonScore 1
$execute unless data storage sb:simon $(instance).input[0] run title @a[tag=Simon2_$(instance)_Player,limit=1] actionbar {"text":"Correct !","color":"green"}
$execute unless data storage sb:simon $(instance).input[0] run scoreboard players set @s Simon2State 4
$execute unless data storage sb:simon $(instance).input[0] run scoreboard players set @s Simon2Timer 25
