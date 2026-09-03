# Le tag _Playing est pose par la grille au moment de la teleportation.
$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Room,limit=1] unless entity @a[tag=BingoCraft_Running,distance=..20] as @a[team=$(teamName),tag=BingoModule_Craft_Playing,tag=!BingoCraft_Running,distance=..20,sort=nearest,limit=1] run function sb:module/craft/player_start {instance:"$(instance)",teamName:"$(teamName)"}

# L'arbalete doit etre deposee dans le tonneau CRAFT FINI.
$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Submit,limit=1] if data block ~ ~ ~ Items[{id:"minecraft:crossbow"}] as @a[team=$(teamName),tag=BingoModule_Craft_Playing,tag=BingoCraft_Running,distance=..20,sort=nearest,limit=1] run function sb:module/craft/finish {instance:"$(instance)",teamName:"$(teamName)",teamColorBlock:"$(teamColorBlock)",teamColorText:"$(teamColorText)",enemyTeam:"$(enemyTeam)",enemyColorBlock:"$(enemyColorBlock)",enemyColorText:"$(enemyColorText)",caseName:"$(caseName)"}
