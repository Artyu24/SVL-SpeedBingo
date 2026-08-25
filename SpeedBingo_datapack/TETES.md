# Module Tetes

Le module utilise deux salles independantes, A et B. Les noms des equipes sont
fournis aux fonctions et ne sont pas encodes dans les marqueurs.

Marqueurs requis par instance :

- `BingoTetes_<instance>_Start`
- `BingoTetes_<instance>_Button`
- `BingoTetes_<instance>_WallA`
- `BingoTetes_<instance>_WallB`
- `BingoTetes_<instance>_Barrel`
- `BingoTetes_<instance>_Finish`
- `BingoTetes_<instance>_Return` (a placer sur la grille finale)

Initialisation :

`function sb:module/tetes/tetes_init {teamA:"Rat",teamB:"Stagiaire"}`

La ligne d'appel dans `sb:tick` centralise les noms d'equipe, le nom de la case
et la reponse attendue. La reponse est le nom personnalise d'un papier depose
dans le tonneau.
