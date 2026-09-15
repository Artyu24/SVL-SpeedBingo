# L'arbalete est fabriquee par la recette vanilla : marque-la lorsqu'elle arrive dans l'inventaire du joueur.
execute if items entity @s inventory.* minecraft:crossbow[!minecraft:custom_data~{sb_module:"craft"}] run data modify entity @s Inventory[{id:"minecraft:crossbow"}].components."minecraft:custom_data" set value {sb_module:"craft"}
