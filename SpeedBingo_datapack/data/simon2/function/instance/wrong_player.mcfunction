# Cette fonction est executee par le joueur afin que la fin et le TP back
# conservent toujours le bon contexte d'execution.
title @s title {"text":"MAUVAISE COULEUR","color":"red","bold":true}
playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 0.8
tellraw @s [{"text":"[Simon2] Mauvaise couleur ! Score final : ","color":"red"},{"score":{"name":"@s","objective":"BingoSimonScore"},"color":"yellow"}]

function sb:module/simon/finish

tag @s remove BingoSimon_Running
$tag @s remove Simon2_$(instance)_Player
