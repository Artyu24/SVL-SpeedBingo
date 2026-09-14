# Ne retire que les objets fournis par les mini-jeux avant un retour a la grille.
execute if entity @s[tag=BingoModule_A2_Playing] run function sb:module/craft/clear_items
execute if entity @s[tag=BingoModule_B4_Playing] run function sb:module/mastermind/clear_items
execute if entity @s[tag=BingoModule_B1_Playing] run function sb:module/tetes/clear_items
