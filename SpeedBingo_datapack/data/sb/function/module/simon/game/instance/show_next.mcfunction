$execute store result score @s Simon2Color run data get storage sb:simon $(instance).playback[0] 1
$data remove storage sb:simon $(instance).playback[0]
$function sb:module/simon/game/lights/off {instance:"$(instance)"}
$function sb:module/simon/game/lights/on {instance:"$(instance)"}
scoreboard players set @s Simon2Phase 1
scoreboard players set @s Simon2Timer 13
