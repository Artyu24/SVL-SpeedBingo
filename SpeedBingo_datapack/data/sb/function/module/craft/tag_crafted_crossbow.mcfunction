# L'arbalete est fabriquee par la recette vanilla : marque-la lorsqu'elle arrive dans l'inventaire du joueur.
execute if items entity @s inventory.* minecraft:crossbow[!minecraft:custom_data~{BingoZipItem:1}] run data modify entity @s Inventory[{id:"minecraft:crossbow"}].components."minecraft:custom_data" set value {BingoZipItem:1}
