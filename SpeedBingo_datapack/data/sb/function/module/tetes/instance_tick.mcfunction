# Le chrono commun est deja lance par la case C2 lors de la teleportation.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Start,limit=1] as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=!BingoTetes_Running,distance=..4] run function sb:module/tetes/player_start {instance:"$(instance)",teamName:"$(teamName)"}

# Detecte directement le clic du joueur, meme si le marqueur du bouton est legerement decale.
$execute as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTetes_Running,scores={BingoTetesButton=1..},limit=1] run function sb:module/tetes/button_pressed {instance:"$(instance)"}

# Garde aussi la detection du bloc alimente comme securite.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Button,limit=1] if block ~ ~ ~ minecraft:stone_button[powered=true] run function sb:module/tetes/wall_capture {instance:"$(instance)",block:"minecraft:air"}

# Controle automatiquement le papier des qu'il a ete renomme et repose dans le baril.
$execute at @e[type=minecraft:marker,tag=BingoTetes_$(instance)_Barrel,limit=1] if data block ~ ~ ~ Items[{id:"minecraft:paper"}].components."minecraft:custom_name" as @a[team=$(teamName),tag=BingoModule_$(caseName)_Playing,tag=BingoTetes_Running,distance=..20,sort=nearest,limit=1] run function sb:module/tetes/check_answer {instance:"$(instance)",teamName:"$(teamName)",teamColorBlock:"$(teamColorBlock)",teamColorText:"$(teamColorText)",enemyTeam:"$(enemyTeam)",enemyColorBlock:"$(enemyColorBlock)",enemyColorText:"$(enemyColorText)",caseName:"$(caseName)",answer:"$(answer)"}
