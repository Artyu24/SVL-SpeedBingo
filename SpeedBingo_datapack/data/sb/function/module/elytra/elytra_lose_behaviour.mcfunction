$execute as @a[distance=..50,gamemode=adventure,tag=BingoModule_$(caseName)_Playing,nbt={OnGround:1b}] at @s if block ~ ~-1 ~ minecraft:barrier run tag @s add BingoModule_ElytraLose
$execute as @e[distance=..50,type=minecraft:marker,tag=$(caseName),sort=nearest,limit=1] at @s run tp @a[distance=..50,gamemode=adventure,tag=BingoModule_ElytraLose] ~ ~2 ~
$tag @a[distance=..50,gamemode=adventure,tag=BingoModule_ElytraLose] remove BingoModule_$(caseName)_Playing
$tag @a[distance=..50,gamemode=adventure,tag=BingoModule_ElytraLose] add BingoModule_$(caseName)
tag @a[distance=..50,gamemode=adventure,tag=BingoModule_ElytraLose] remove BingoModule_ElytraLose