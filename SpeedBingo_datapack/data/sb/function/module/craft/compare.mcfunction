# Les deux joueurs ont fabrique une arbalete : le meilleur temps gagne la case.
$execute if score #Craft_$(teamA) BingoTime < #Craft_$(teamB) BingoTime run function sb:case/case_validation {teamWin:"$(teamA)",teamLose:"$(teamB)",caseName:"$(caseName)",colorBlock:"$(colorBlockA)",colorText:"$(colorTextA)"}
$execute if score #Craft_$(teamB) BingoTime < #Craft_$(teamA) BingoTime run function sb:case/case_validation {teamWin:"$(teamB)",teamLose:"$(teamA)",caseName:"$(caseName)",colorBlock:"$(colorBlockB)",colorText:"$(colorTextB)"}
$execute if score #Craft_$(teamA) BingoTime = #Craft_$(teamB) BingoTime run tellraw @a {"text":"Egalite parfaite au module Craft.","color":"yellow"}
