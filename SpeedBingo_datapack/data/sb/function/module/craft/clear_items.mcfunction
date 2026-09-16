# Retire les ressources Craft de l'equipe qui vient de quitter la salle.
execute if entity @s[team=RTT] as @a[gamemode=adventure,team=RTT] run clear @s *[custom_data~{BingoCraftItem:1}]
execute if entity @s[team=Albertos] as @a[gamemode=adventure,team=Albertos] run clear @s *[custom_data~{BingoCraftItem:1}]
