# Empeche de valider avec une arbalete apportee depuis l'exterieur.
clear @s minecraft:crossbow

$function sb:module/craft/refill_instance {instance:"$(instance)"}
$execute at @s run function sb:case/timer/start {gameTag:"$(caseName)",teamName:"$(teamName)"}

playsound minecraft:block.chest.open master @s ~ ~ ~ 0.7 1.2
