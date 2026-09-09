$execute store result score @s Simon2Color run data get storage simon2:games $(instance).playback[0] 1
$data remove storage simon2:games $(instance).playback[0]
$function simon2:lights/off {instance:"$(instance)"}
$function simon2:lights/on {instance:"$(instance)"}
scoreboard players set @s Simon2Phase 1
scoreboard players set @s Simon2Timer 13
