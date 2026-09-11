$execute if entity @e[type=minecraft:marker,tag=$(caseName),tag=$(teamWin)Win,limit=1] run return fail
$execute as @e[type=minecraft:marker,tag=$(caseName),limit=1] run tag @s remove $(teamLose)Win
$execute as @e[type=minecraft:marker,tag=$(caseName),limit=1] run tag @s add $(teamWin)Win
$execute as @e[type=minecraft:marker,tag=$(caseName),limit=1] at @s run fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:$(colorBlock)_concrete replace #survisland:concretes
$execute as @e[type=minecraft:block_display,tag=BingoDisplay_$(caseName)] run data modify entity @s block_state.Name set value "minecraft:$(colorBlock)_concrete"
$tellraw @a[distance=..200] ["",{color:"gray",text:"["},{color:"#fffb00",text:"S"},{color:"#fff100",text:"p"},{color:"#ffe700",text:"e"},{color:"#ffdc00",text:"e"},{color:"#ffd200",text:"d "},{color:"#ffbe00",text:"B"},{color:"#ffb400",text:"i"},{color:"#ffa900",text:"n"},{color:"#ff9f00",text:"g"},{color:"#ff9500",text:"o"},{color:"gray",text:"]"}," - ",{color:"gray",text:"["},{color:"yellow",text:"$(caseName)"},{color:"gray",text:"]"}," L'équipe ",{color:"$(colorText)",text:"$(teamWin)"}," obtient la case !"]
