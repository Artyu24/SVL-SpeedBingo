# Retire seulement une arbalete eventuellement conservee d'une precedente partie.
clear @s minecraft:crossbow[custom_data~{BingoZipItem:1}]

$function sb:module/craft/refill_instance {instance:"$(instance)"}
$execute at @s run function sb:case/timer/start {gameTag:"$(caseName)",teamName:"$(teamName)"}

playsound minecraft:block.chest.open master @s ~ ~ ~ 0.7 1.2
