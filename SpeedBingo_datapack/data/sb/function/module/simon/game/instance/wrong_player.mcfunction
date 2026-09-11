# Cette fonction est executee par le joueur afin que la fin et le TP back
# conservent toujours le bon contexte d'execution.
function sb:module/simon/finish

tag @s remove BingoSimon_Running
$tag @s remove Simon2_$(instance)_Player
scoreboard players reset @s BingoSimonScore
$function sb:module/simon/game/instance/reset {instance:"$(instance)"}
