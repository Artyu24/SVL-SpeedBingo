function sb:module/simon/game/instance/reset {instance:"Albertos"}
function sb:module/simon/game/instance/reset {instance:"RTT"}

tag @a remove Simon2_Albertos_Player
tag @a remove Simon2_RTT_Player
tag @a remove BingoSimon_Running

data modify storage sb:simon Albertos.sequence set value []
data modify storage sb:simon Albertos.playback set value []
data modify storage sb:simon Albertos.input set value []
data modify storage sb:simon RTT.sequence set value []
data modify storage sb:simon RTT.playback set value []
data modify storage sb:simon RTT.input set value []
