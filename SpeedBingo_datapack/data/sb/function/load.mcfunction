say [F19-Confort] Initialisation termine ! :mignon:

#System
    # Head Feedback
scoreboard objectives add BingoHead dummy
    #TP
scoreboard objectives add BingoTP dummy
    #Timer MyMy
scoreboard objectives add BingoTime dummy
    #Timer Artyu
scoreboard objectives add BingoTimer_Tick dummy
scoreboard objectives add BingoTimer_Second dummy
scoreboard objectives add BingoTimer_Saved dummy
# ------------------------------------------------

#Modules
    #Elytra
scoreboard objectives add BingoScore_Elytra dummy
    #Tetes
scoreboard objectives add BingoValid_Tetes dummy
scoreboard objectives add BingoDone_Tetes dummy
    #Mastermind
scoreboard objectives add BingoValid_MM dummy
scoreboard objectives add BingoDone_MM dummy
    #Craft
scoreboard objectives add BingoValid_Craft dummy
scoreboard objectives add BingoDone_Craft dummy
    #Simon
scoreboard objectives add BingoSimonScore dummy
    #Lever Airship
scoreboard objectives add BingoAirStep dummy
scoreboard objectives add BingoAirState dummy
    #Zip
function train_mymy:load