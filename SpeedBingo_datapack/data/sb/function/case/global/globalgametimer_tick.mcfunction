execute if score Min BingoGameTimer matches 0 if score Sec BingoGameTimer matches 0 if score Ms BingoGameTimer matches 0 run return 1
scoreboard players remove Ms BingoGameTimer 1
execute if score Ms BingoGameTimer matches ..-1 run function sb:case/global/globalgametimer_decreasesecond
execute if score Sec BingoGameTimer matches ..-1 run function sb:case/global/globalgametimer_decreaseminute
