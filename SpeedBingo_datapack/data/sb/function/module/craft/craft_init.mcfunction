execute as @a[tag=BingoCraft_Running] at @s run function sb:case/timer/cancel
tag @a remove BingoCraft_Running
tag @a remove BingoModule_A2
tag @a remove BingoModule_A2_Playing

function sb:module/craft/refill_instance {instance:"Albertos"}
function sb:module/craft/refill_instance {instance:"RTT"}
