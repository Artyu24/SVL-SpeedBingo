$function simon2:lights/off {instance:"$(instance)"}
$execute if data storage simon2:games $(instance).playback[0] run scoreboard players set @s Simon2Phase 0
$execute if data storage simon2:games $(instance).playback[0] run scoreboard players set @s Simon2Timer 7
$execute unless data storage simon2:games $(instance).playback[0] run scoreboard players set @s Simon2State 3
$execute unless data storage simon2:games $(instance).playback[0] run scoreboard players set @s Simon2Cooldown 0
$execute unless data storage simon2:games $(instance).playback[0] run title @a[tag=Simon2_$(instance)_Player,limit=1] actionbar {"text":"A toi !","color":"green"}
