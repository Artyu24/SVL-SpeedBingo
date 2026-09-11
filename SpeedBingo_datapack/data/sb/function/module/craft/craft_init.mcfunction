execute as @a[tag=BingoModule_A2_Playing] at @s run function sb:case/timer/cancel {caseName:"A2"}
tag @a remove BingoModule_A2

function sb:module/craft/refill_instance {instance:"Albertos"}
function sb:module/craft/refill_instance {instance:"RTT"}
