$execute as @p[distance=..30, gamemode=adventure,tag=BingoModule_$(caseName)_Playing] run function sb:case/case_finish_behaviour {caseName:"$(caseName)"}
