$scoreboard players set @p[distance=..150, gamemode=adventure, tag=BingoModule_$(gameTag)_Playing, team=$(teamName)] BingoTimer_Tick 0
$scoreboard players set @p[distance=..150, gamemode=adventure, tag=BingoModule_$(gameTag)_Playing, team=$(teamName)] BingoTimer_Second 0
$tag @p[distance=..150, gamemode=adventure, tag=BingoModule_$(gameTag)_Playing, team=$(teamName)] add BingoTimerTick