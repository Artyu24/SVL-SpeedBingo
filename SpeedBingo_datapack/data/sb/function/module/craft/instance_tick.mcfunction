# Le tag _Playing est pose par la grille au moment de la teleportation.
$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Room,limit=1] as @a[gamemode=adventure,team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=!BingoTimerTick,distance=..20,sort=nearest,limit=1] run function sb:module/craft/player_start {instance:"$(instance)",teamName:"$(teamName)",caseName:"$(caseName)"}

# La recette vanilla de l'arbalete ne conserve pas les composants des ressources.
$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Room,limit=1] as @a[gamemode=adventure,team=$(teamName),tag=BingoModule_$(caseName)_Playing,distance=..20,sort=nearest,limit=1] run function sb:module/craft/tag_crafted_crossbow

# L'arbalete doit etre deposee dans le tonneau CRAFT FINI.
$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Submit,limit=1] if data block ~ ~ ~ Items[{id:"minecraft:crossbow"}] as @a[gamemode=adventure,team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTimerTick,distance=..20,sort=nearest,limit=1] run function sb:module/craft/finish {instance:"$(instance)",teamName:"$(teamName)",teamColorBlock:"$(teamColorBlock)",teamColorText:"$(teamColorText)",enemyTeam:"$(enemyTeam)",enemyColorBlock:"$(enemyColorBlock)",enemyColorText:"$(enemyColorText)",caseName:"$(caseName)"}

# Le bouton d'abandon fait revenir le joueur sans valider la case Craft.
$execute at @e[type=minecraft:marker,tag=BingoCraft_$(instance)_Abandon,limit=1] if block ~ ~ ~ minecraft:birch_button[powered=true] as @a[gamemode=adventure,team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTimerTick,distance=..5,sort=nearest,limit=1] run function sb:module/craft/abandon {instance:"$(instance)",caseName:"$(caseName)"}
