# Quitte la salle sans attribuer de score, mais bloque tout nouvel acces a la case.
function sb:module/craft/clear_items
$function sb:module/craft/refill_instance {instance:"$(instance)"}
tag @s remove BingoTimerTick
tag @s remove BingoPlaying
$tag @s add BingoModule_$(caseName)
$tag @s remove BingoModule_$(caseName)_Playing
title @s actionbar {"text":"Épreuve Craft abandonnée.","color":"yellow"}
$function sb:case/teleport/tpback {caseName:"$(caseName)"}
