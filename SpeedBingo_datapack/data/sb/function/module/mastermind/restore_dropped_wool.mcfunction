# Une laine posee puis cassee perd ses composants dans son drop vanilla.
# Cette fonction ne regarde que les items de la salle active et ne traite chaque drop qu'une fois.
execute as @e[type=minecraft:item,distance=..40] if items entity @s contents #sb:mastermind_wools[!minecraft:can_place_on] run data modify entity @s Item.components."minecraft:can_place_on".blocks set value ["minecraft:yellow_concrete"]
