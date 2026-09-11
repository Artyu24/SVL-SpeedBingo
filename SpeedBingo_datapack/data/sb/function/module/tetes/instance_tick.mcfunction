# Le chrono commun est deja lance par la case C2 lors de la teleportation.
# La zone large permet de deplacer le marqueur Start dans la salle sans casser l'initialisation.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Start,limit=1] as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=!BingoTetes_Running,distance=..40,sort=nearest,limit=1] run function sb:module/tetes/player_start {instance:"$(instance)",teamName:"$(teamName)",caseName:"$(caseName)"}

# Detecte directement le clic du joueur, meme si le marqueur du bouton est legerement decale.
$scoreboard players set @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTetes_Running,tag=BingoTetesWallOpen] BingoTetesButton 0
$execute as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTetes_Running,tag=!BingoTetesWallOpen,scores={BingoTetesButton=1..},limit=1] run function sb:module/tetes/button_pressed {instance:"$(instance)"}

# Garde aussi la detection du bloc alimente comme securite.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Button,limit=1] if block ~ ~ ~ minecraft:stone_button[powered=true] as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTetes_Running,tag=!BingoTetesWallOpen,distance=..20,sort=nearest,limit=1] run function sb:module/tetes/wall_start {instance:"$(instance)"}

# Referme automatiquement le mur trente secondes apres son ouverture.
$execute as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTetes_Running,tag=BingoTetesWallOpen,limit=1] run function sb:module/tetes/wall_timer_tick {instance:"$(instance)"}

# Controle automatiquement le papier des qu'il a ete renomme et repose dans le baril.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] if data block ~ ~ ~ Items[{id:"minecraft:paper"}].components."minecraft:custom_name" as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTetes_Running,distance=..20,sort=nearest,limit=1] run function sb:module/tetes/check_answer {instance:"$(instance)",teamName:"$(teamName)",teamColorBlock:"$(teamColorBlock)",teamColorText:"$(teamColorText)",enemyTeam:"$(enemyTeam)",enemyColorBlock:"$(enemyColorBlock)",enemyColorText:"$(enemyColorText)",caseName:"$(caseName)",answer:"$(answer)"}
