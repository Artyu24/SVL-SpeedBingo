$scoreboard players set $(teamName) BingoGameScore 0
$execute as @e[type=minecraft:marker, tag=$(teamName)Win] run scoreboard players add $(teamName) BingoGameScore 1

# Lignes
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"A1",case2:"A2",case3:"A3",case4:"A4"}
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"B1",case2:"B2",case3:"B3",case4:"B4"}
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"C1",case2:"C2",case3:"C3",case4:"C4"}
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"D1",case2:"D2",case3:"D3",case4:"D4"}

# Colonnes
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"A1",case2:"B1",case3:"C1",case4:"D1"}
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"A2",case2:"B2",case3:"C2",case4:"D2"}
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"A3",case2:"B3",case3:"C3",case4:"D3"}
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"A4",case2:"B4",case3:"C4",case4:"D4"}

# Diagonales
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"A1",case2:"B2",case3:"C3",case4:"D4"}
$function sb:case/globalscore/globalgamescore_bingo {teamName:"$(teamName)",case1:"A4",case2:"B3",case3:"C2",case4:"D1"}