# Une seule reponse correcte : cette equipe gagne.
$execute if score #$(teamA) BingoValid_Tetes matches 1 if score #$(teamB) BingoValid_Tetes matches 0 run function sb:case/case_validation {teamWin:"$(teamA)",teamLose:"$(teamB)",caseName:"$(caseName)",color:"$(colorA)"}
$execute if score #$(teamB) BingoValid_Tetes matches 1 if score #$(teamA) BingoValid_Tetes matches 0 run function sb:case/case_validation {teamWin:"$(teamB)",teamLose:"$(teamA)",caseName:"$(caseName)",color:"$(colorB)"}

# Deux bonnes reponses : le temps le plus court gagne.
$execute if score #$(teamA) BingoValid_Tetes matches 1 if score #$(teamB) BingoValid_Tetes matches 1 if score #Tetes_$(teamA) BingoTime < #Tetes_$(teamB) BingoTime run function sb:case/case_validation {teamWin:"$(teamA)",teamLose:"$(teamB)",caseName:"$(caseName)",color:"$(colorA)"}
$execute if score #$(teamA) BingoValid_Tetes matches 1 if score #$(teamB) BingoValid_Tetes matches 1 if score #Tetes_$(teamB) BingoTime < #Tetes_$(teamA) BingoTime run function sb:case/case_validation {teamWin:"$(teamB)",teamLose:"$(teamA)",caseName:"$(caseName)",color:"$(colorB)"}

# Egalite exacte ou deux mauvaises reponses : aucune equipe ne gagne la case.
$execute if score #$(teamA) BingoValid_Tetes matches 1 if score #$(teamB) BingoValid_Tetes matches 1 if score #Tetes_$(teamA) BingoTime = #Tetes_$(teamB) BingoTime run tellraw @a {"text":"Egalite parfaite au module Tetes.","color":"yellow"}
$execute if score #$(teamA) BingoValid_Tetes matches 0 if score #$(teamB) BingoValid_Tetes matches 0 run tellraw @a {"text":"Aucune equipe n'a donne la bonne reponse au module Tetes.","color":"red"}
