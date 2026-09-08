say [F19-Confort] Initialisation termine ! :mignon:

#System
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
    #Lever Airship
scoreboard objectives add BingoAirStep dummy
scoreboard objectives add BingoAirState dummy
    #Zip
function train_mymy:load
