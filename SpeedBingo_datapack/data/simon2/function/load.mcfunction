scoreboard objectives add Simon2State dummy
scoreboard objectives add Simon2Timer dummy
scoreboard objectives add Simon2Phase dummy
scoreboard objectives add Simon2Color dummy
scoreboard objectives add Simon2Cooldown dummy
scoreboard objectives add Simon2Pressed dummy

function simon2:init
tellraw @a [{"text":"[Simon2] ","color":"gold"},{"text":"Datapack charge.","color":"green"}]
