# Chaque nouvelle tentative repart avec les sept leviers desactives et les lampes eteintes.
$execute as @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Room,limit=1] at @s run function sb:module/airship/room_reset_silent {instance:"$(instance)"}
$execute at @s run function sb:case/timer/start {gameTag:"$(caseName)",teamName:"$(teamName)"}

# Le point d'arrivee est directement dans le bloc de l'echelle du schema.
$tp @s @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Start,limit=1]
playsound minecraft:block.iron_door.open master @s ~ ~ ~ 0.7 1.2
