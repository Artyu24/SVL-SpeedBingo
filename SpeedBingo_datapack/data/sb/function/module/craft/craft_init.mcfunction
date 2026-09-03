$scoreboard players set #Craft_$(teamA) BingoTime 0
$scoreboard players set #Craft_$(teamB) BingoTime 0
$scoreboard players set #$(teamA) BingoValid_Craft 0
$scoreboard players set #$(teamB) BingoValid_Craft 0
$scoreboard players set #$(teamA) BingoDone_Craft 0
$scoreboard players set #$(teamB) BingoDone_Craft 0

execute as @a[tag=BingoCraft_Running] run function sb:timer/stop
tag @a remove BingoCraft_Running
tag @a remove BingoModule_Craft
tag @a remove BingoModule_Craft_Playing

function sb:module/craft/refill_instance {instance:"Albertos"}
function sb:module/craft/refill_instance {instance:"RTT"}
