# Empeche de valider avec une arbalete apportee depuis l'exterieur.
clear @s minecraft:crossbow

$function sb:module/craft/refill_instance {instance:"$(instance)"}
function sb:timer/start
tag @s add BingoCraft_Running

title @s title {"text":"CRAFT","color":"gold","bold":true}
title @s subtitle {"text":"Fabrique une arbalete et depose-la dans le tonneau CRAFT FINI","color":"yellow"}
$title @s actionbar {"text":"Chronometre Craft lance pour $(teamName) !","color":"aqua"}
playsound minecraft:block.chest.open master @s ~ ~ ~ 0.7 1.2
