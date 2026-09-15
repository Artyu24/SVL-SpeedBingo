# Quitte la salle sans attribuer de score, mais marque la case comme terminee.
function sb:module/craft/clear_items
$function sb:module/craft/refill_instance {instance:"$(instance)"}
$function sb:case/timer/cancel {caseName:"$(caseName)"}
$function sb:case/case_finish {caseName:"$(caseName)"}
title @s actionbar {"text":"Épreuve Craft abandonnée.","color":"yellow"}
$function sb:case/teleport/tpback {caseName:"$(caseName)"}
