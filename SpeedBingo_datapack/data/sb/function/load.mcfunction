say [F19-Confort] Initialisation termine ! :mignon:

#System
    # Global Score
scoreboard objectives add BingoGameScore dummy
    # Head Feedback
scoreboard objectives add BingoHead dummy
    #TP
scoreboard objectives add BingoTP dummy
    #Timer commun
scoreboard objectives add BingoTimer_Tick dummy
scoreboard objectives add BingoTimer_Second dummy
scoreboard objectives add BingoTimer_Saved dummy
# ------------------------------------------------

#Modules
    #Elytra
scoreboard objectives add BingoScore_Elytra dummy
    #Simon
scoreboard objectives add BingoSimonScore dummy
scoreboard objectives add BingoDone_Simon dummy
function sb:module/simon/game/load
    #Tetes
scoreboard objectives add BingoTetesButton minecraft.used:minecraft.stone_button
scoreboard objectives add BingoTetesWallTick dummy
scoreboard objectives add BingoTetesWallSecond dummy
    #Mastermind datapack
scoreboard objectives add BingoMMColor dummy
scoreboard objectives add BingoMMAttempt dummy
scoreboard objectives add BingoMMExact dummy
scoreboard objectives add BingoMMMatched dummy
scoreboard objectives add BingoMMMis dummy
scoreboard objectives add BingoMMWrong dummy
scoreboard objectives add BingoMMValid dummy
scoreboard objectives add BingoMMCooldown dummy
scoreboard objectives add BingoMMCalc dummy
    #Lever Airship
scoreboard objectives add BingoAirStep dummy
scoreboard objectives add BingoAirState dummy

# Migration : retire les anciens tags, qui ne servent plus au fonctionnement des modules.
tag @a remove BingoCraft_Running
tag @a remove BingoAirship_Running
    #Zip
function train_mymy:load
