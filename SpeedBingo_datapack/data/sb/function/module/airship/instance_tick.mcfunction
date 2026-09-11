# Un joueur envoye par la grille dans cette salle est place sur l'echelle au lancement.
$execute at @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Room,limit=1] as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=!BingoTimerTick,distance=..40,sort=nearest,limit=1] run function sb:module/airship/player_start {instance:"$(instance)",teamName:"$(teamName)",caseName:"$(caseName)"}

# La progression appartient au marqueur de la salle, ce qui rend A et B independantes.
$execute as @e[type=minecraft:marker,tag=BingoAirship_$(instance)_Room,limit=1] at @s if entity @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTimerTick,distance=..40] run function sb:module/airship/room_tick {instance:"$(instance)",teamName:"$(teamName)",teamColorBlock:"$(teamColorBlock)",teamColorText:"$(teamColorText)",enemyTeam:"$(enemyTeam)",caseName:"$(caseName)"}
