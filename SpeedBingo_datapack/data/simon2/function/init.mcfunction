function simon2:instance/reset {instance:"Albertos"}
function simon2:instance/reset {instance:"RTT"}

tag @a remove Simon2_Albertos_Player
tag @a remove Simon2_RTT_Player
tag @a remove BingoSimon_Running

data modify storage simon2:games Albertos.sequence set value []
data modify storage simon2:games Albertos.playback set value []
data modify storage simon2:games Albertos.input set value []
data modify storage simon2:games RTT.sequence set value []
data modify storage simon2:games RTT.playback set value []
data modify storage simon2:games RTT.input set value []
