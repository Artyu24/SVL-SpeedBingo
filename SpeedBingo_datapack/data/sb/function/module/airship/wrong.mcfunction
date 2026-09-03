$function sb:module/airship/room_reset_silent {instance:"$(instance)"}
$tp @p[tag=BingoAirship_Running,distance=..40,sort=nearest,limit=1] @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Start,limit=1]
title @p[tag=BingoAirship_Running,distance=..40,sort=nearest,limit=1] title {"text":"MAUVAIS ORDRE","color":"red","bold":true}
title @p[tag=BingoAirship_Running,distance=..40,sort=nearest,limit=1] subtitle {"text":"Les sept leviers ont ete reinitialises","color":"gray"}
playsound minecraft:block.anvil.land master @p[tag=BingoAirship_Running,distance=..40,sort=nearest,limit=1] ~ ~ ~ 0.7 0.7
