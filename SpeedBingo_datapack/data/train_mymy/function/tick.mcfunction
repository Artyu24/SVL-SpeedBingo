# Enregistre les deux salles, puis gère chacune pour son équipe.
execute as @e[type=minecraft:marker,tag=BingoTrain_Albertos_Room,tag=!trainMymyRegistered] at @s run function train_mymy:room/register {instance:"Albertos"}
execute as @e[type=minecraft:marker,tag=BingoTrain_RTT_Room,tag=!trainMymyRegistered] at @s run function train_mymy:room/register {instance:"RTT"}
execute as @e[type=minecraft:marker,tag=BingoTrain_Albertos_Room,tag=trainMymyRegistered] at @s run function train_mymy:room/tick {teamName:"Albertos"}
execute as @e[type=minecraft:marker,tag=BingoTrain_RTT_Room,tag=trainMymyRegistered] at @s run function train_mymy:room/tick {teamName:"RTT"}

# Déplace indépendamment le train de chaque salle occupée.
execute as @e[type=minecraft:marker,tag=trainMymyController] at @s run function train_mymy:train/tick
