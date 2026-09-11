# Empeche de valider avec une arbalete apportee depuis l'exterieur.
clear @s minecraft:crossbow

$function sb:module/craft/refill_instance {instance:"$(instance)"}
$execute at @s run function sb:case/timer/start {gameTag:"$(caseName)",teamName:"$(teamName)"}

title @s times 10 120 20
title @s title {"text":"CRAFT","color":"gold","bold":true}
title @s subtitle {"text":"Fabrique l'item et dépose-le dans le tonneau CRAFT FINI","color":"yellow"}
playsound minecraft:block.chest.open master @s ~ ~ ~ 0.7 1.2
