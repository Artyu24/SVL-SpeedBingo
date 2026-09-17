# Comme Elytra, ne retire que les items des joueurs encore dans l'epreuve active.
$execute if entity @s[team=RTT] at @s run clear @a[distance=..100,gamemode=adventure,team=RTT,tag=BingoModule_$(caseName)_Playing] *[custom_data~{BingoCraftItem:1}]
$execute if entity @s[team=Albertos] at @s run clear @a[distance=..100,gamemode=adventure,team=Albertos,tag=BingoModule_$(caseName)_Playing] *[custom_data~{BingoCraftItem:1}]

# Les objets fabriques ne conservent pas le custom_data des ingredients.
clear @s minecraft:tripwire_hook
clear @s minecraft:crossbow
