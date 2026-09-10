$function sb:case/case_finish {caseName:"$(caseName)"}
$function sb:case/teleport/tpback {caseName:"$(caseName)"}

tag @s remove BingoTetes_Running
scoreboard players reset @s BingoTetesButton
$function sb:module/tetes/instance_reset {instance:"$(instance)"}
