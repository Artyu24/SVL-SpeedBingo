scoreboard objectives add Simon2State dummy
scoreboard objectives add Simon2Timer dummy
scoreboard objectives add Simon2Phase dummy
scoreboard objectives add Simon2Color dummy
scoreboard objectives add Simon2Cooldown dummy
scoreboard objectives add Simon2Pressed dummy

function sb:module/simon/game/init
tellraw @a [{"text":"[Simon] ","color":"gold"},{"text":"Datapack charge.","color":"green"}]
