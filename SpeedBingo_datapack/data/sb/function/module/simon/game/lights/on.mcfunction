$execute if score @s Simon2Color matches 1 at @e[type=minecraft:marker,tag=Simon2_$(instance)_Bulb1,limit=1] run setblock ~ ~ ~ minecraft:waxed_copper_bulb[lit=true,powered=false]
$execute if score @s Simon2Color matches 2 at @e[type=minecraft:marker,tag=Simon2_$(instance)_Bulb2,limit=1] run setblock ~ ~ ~ minecraft:waxed_copper_bulb[lit=true,powered=false]
$execute if score @s Simon2Color matches 3 at @e[type=minecraft:marker,tag=Simon2_$(instance)_Bulb3,limit=1] run setblock ~ ~ ~ minecraft:waxed_copper_bulb[lit=true,powered=false]
$execute if score @s Simon2Color matches 4 at @e[type=minecraft:marker,tag=Simon2_$(instance)_Bulb4,limit=1] run setblock ~ ~ ~ minecraft:waxed_copper_bulb[lit=true,powered=false]

$title @a[tag=Simon2_$(instance)_Player,limit=1] times 0 8 2
$execute if score @s Simon2Color matches 1 run title @a[tag=Simon2_$(instance)_Player,limit=1] subtitle {"text":"▲ VERT ▲","color":"green","bold":true}
$execute if score @s Simon2Color matches 2 run title @a[tag=Simon2_$(instance)_Player,limit=1] subtitle {"text":"■ ROUGE ■","color":"red","bold":true}
$execute if score @s Simon2Color matches 3 run title @a[tag=Simon2_$(instance)_Player,limit=1] subtitle {"text":"◆ JAUNE ◆","color":"yellow","bold":true}
$execute if score @s Simon2Color matches 4 run title @a[tag=Simon2_$(instance)_Player,limit=1] subtitle {"text":"● BLEU ●","color":"blue","bold":true}
$title @a[tag=Simon2_$(instance)_Player,limit=1] title {"text":""}
$playsound minecraft:block.note_block.pling master @a[tag=Simon2_$(instance)_Player,limit=1] ~ ~ ~ 1 1
