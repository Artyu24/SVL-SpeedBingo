# Chronometre global

Tous les modules utilisent l'objectif `BingoTime`. Le tick global incremente
automatiquement les joueurs qui portent le tag `BingoTimer_Running`.

Au demarrage d'un module, executer la fonction en tant que joueur :

`function sb:timer/start`

A la fin ou lors d'une reinitialisation, l'executer de la meme facon :

`function sb:timer/stop`

Le score du joueur reste disponible dans `BingoTime` apres l'arret. Lorsqu'un
module conserve un resultat d'equipe, son faux joueur doit inclure le nom du
module (par exemple `#Tetes_RTT`) afin que deux modules ne s'ecrasent pas.
