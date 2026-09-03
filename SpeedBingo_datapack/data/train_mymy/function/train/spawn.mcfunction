# Cette fonction est exécutée au point rouge/ancre de la salle.
summon minecraft:marker ~ ~ ~ {Tags:["trainMymyDynamic","trainMymyController"]}
scoreboard players operation @e[type=minecraft:marker,tag=trainMymyController,sort=nearest,limit=1,distance=..0.1] trainRoom = #current trainRoom
scoreboard players set @e[type=minecraft:marker,tag=trainMymyController,sort=nearest,limit=1,distance=..0.1] trainPoint 1

summon minecraft:item_display ~ ~ ~ {Tags:["trainMymyDynamic","trainMymyPart","trainMymyLocomotive"],item:{id:"minecraft:recovery_compass",count:1,components:{"minecraft:item_model":"survisland:locomotive_fast"}},item_display:"none",billboard:"fixed",transformation:{translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f],scale:[1.0f,1.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},teleport_duration:2,view_range:2.0f}
summon minecraft:item_display ~ ~ ~ {Tags:["trainMymyDynamic","trainMymyPart","trainMymyCraftWagon"],item:{id:"minecraft:recovery_compass",count:1,components:{"minecraft:item_model":"survisland:craft_wagon_empty"}},item_display:"none",billboard:"fixed",transformation:{translation:[0.0f,0.0f,-0.8125f],left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f],scale:[1.0f,1.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},teleport_duration:2,view_range:2.0f}
summon minecraft:item_display ~ ~ ~ {Tags:["trainMymyDynamic","trainMymyPart","trainMymyChestWagon"],item:{id:"minecraft:recovery_compass",count:1,components:{"minecraft:item_model":"survisland:chest_wagon"}},item_display:"none",billboard:"fixed",transformation:{translation:[0.0f,0.0f,-1.3125f],left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f],scale:[1.0f,1.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},teleport_duration:2,view_range:2.0f}

execute as @e[type=minecraft:item_display,tag=trainMymyPart,distance=..0.1] run scoreboard players operation @s trainRoom = #current trainRoom
