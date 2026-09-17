# Les resultats des recettes vanilla ne conservent pas le custom_data des
# ingredients. Ils sont donc marques des qu'ils entrent dans l'inventaire.
$execute as @a[gamemode=adventure,tag=BingoModule_$(caseName)_Playing] run function sb:module/craft/mark_crafted_items

# Une instance porte directement le nom de son equipe.
$function sb:module/craft/instance_tick {instance:"Albertos",teamName:"$(teamA)",teamColorBlock:"light_blue",teamColorText:"aqua",enemyTeam:"$(teamB)",enemyColorBlock:"lime",enemyColorText:"green",caseName:"$(caseName)"}
$function sb:module/craft/instance_tick {instance:"RTT",teamName:"$(teamB)",teamColorBlock:"lime",teamColorText:"green",enemyTeam:"$(teamA)",enemyColorBlock:"light_blue",enemyColorText:"aqua",caseName:"$(caseName)"}
