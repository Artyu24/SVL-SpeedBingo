# Module Tetes

Le module utilise deux salles independantes nommees Albertos et RTT. Les noms
des equipes sont encodes directement dans les marqueurs.

Schematics prêtes à coller avec les entités (`//paste -e`) :

- `SpeedBingo_schematics/tetes/schem_salle_tetes_Albertos_marqueurs.schem` pour Albertos ;
- `SpeedBingo_schematics/tetes/schem_salle_tetes_RTT_marqueurs.schem` pour RTT.

La teleportation selectionne un seul joueur par equipe avec le tag
`BingoModule_Tetes_Playing`. Tant que ce tag est present sur un membre de
l'equipe, aucun autre membre ne peut entrer dans le module Tetes.

Marqueurs requis pour `<equipe>` egal a `Albertos` ou `RTT` :

- `BingoTetes_<equipe>_Start`
- `BingoTetes_<equipe>_Button`
- `BingoTetes_<equipe>_Wall1`
- `BingoTetes_<equipe>_Wall2`
- `BingoTetes_<equipe>_Barrel`
- `BingoTetes_<equipe>_Finish`
- `BingoTetes_<equipe>_Return` (a placer sur la grille finale)

Initialisation :

`function sb:module/tetes/tetes_init {teamA:"Albertos",teamB:"RTT"}`

La ligne d'appel dans `sb:tick` centralise les noms d'equipe, le nom de la case
et la reponse attendue. La reponse est le nom personnalise d'un papier depose
dans le tonneau.
