$execute if entity @e[type=marker,tag=!$(teamName)Win,tag=$(case1)] run tag @e[type=marker,tag=$(bingo)] remove $(teamName)Bingo
$execute if entity @e[type=marker,tag=!$(teamName)Win,tag=$(case1)] run return 1
$execute if entity @e[type=marker,tag=!$(teamName)Win,tag=$(case2)] run tag @e[type=marker,tag=$(bingo)] remove $(teamName)Bingo
$execute if entity @e[type=marker,tag=!$(teamName)Win,tag=$(case2)] run return 1
$execute if entity @e[type=marker,tag=!$(teamName)Win,tag=$(case3)] run tag @e[type=marker,tag=$(bingo)] remove $(teamName)Bingo
$execute if entity @e[type=marker,tag=!$(teamName)Win,tag=$(case3)] run return 1
$execute if entity @e[type=marker,tag=!$(teamName)Win,tag=$(case4)] run tag @e[type=marker,tag=$(bingo)] remove $(teamName)Bingo
$execute if entity @e[type=marker,tag=!$(teamName)Win,tag=$(case4)] run return 1

$execute if entity @e[type=marker,tag=$(bingo),tag=!$(teamName)Bingo,limit=1] run tellraw @a[distance=..200] [{color:"gray",text:"["},{color:"#fffb00",text:"S"},{color:"#fff100",text:"p"},{color:"#ffe700",text:"e"},{color:"#ffdc00",text:"e"},{color:"#ffd200",text:"d "},{color:"#ffbe00",text:"B"},{color:"#ffb400",text:"i"},{color:"#ffa900",text:"n"},{color:"#ff9f00",text:"g"},{color:"#ff9500",text:"o"},{color:"gray",text:"]"}," - ","L'équipe ",{color:"$(colorText)",text:"$(teamName)"}," réalise un BINGO sur ",{color:"gold",text:"$(bingo)"}," !"]

$execute if entity @e[type=marker,tag=$(teamName)Win,tag=$(case1)] if entity @e[type=marker,tag=$(teamName)Win,tag=$(case2)] if entity @e[type=marker,tag=$(teamName)Win,tag=$(case3)] if entity @e[type=marker,tag=$(teamName)Win,tag=$(case4)] run tag @e[type=marker,tag=$(bingo)] add $(teamName)Bingo
$execute if entity @e[type=marker,tag=$(teamName)Win,tag=$(case1)] if entity @e[type=marker,tag=$(teamName)Win,tag=$(case2)] if entity @e[type=marker,tag=$(teamName)Win,tag=$(case3)] if entity @e[type=marker,tag=$(teamName)Win,tag=$(case4)] run scoreboard players add $(teamName) BingoGameScore 2