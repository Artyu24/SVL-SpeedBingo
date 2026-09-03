# Supprime uniquement le train de la salle devenue vide.
scoreboard players operation #current trainRoom = @s trainRoom
execute as @e[type=minecraft:item_display,tag=trainMymyPart,distance=..2] if score @s trainRoom = #current trainRoom run kill @s
kill @s
