# Module Airship

Le joueur arrive directement sur l'echelle, puis doit lever les sept leviers
dans l'ordre `1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7`.

Un levier actionne hors ordre, ou un ancien levier rabaisse, remet
immediatement toute la sequence a zero, replace les sept leviers dans leur etat
initial et reteleporte le joueur sur l'echelle. Apres le levier 7, le joueur
est teleporte au marqueur de sortie situe hors de la piece.

## Schematics

Deux versions pretes a coller se trouvent dans
`SpeedBingo_schematics/airship` :

- `salle_airship_Albertos_marqueurs.schem`
- `salle_airship_RTT_marqueurs.schem`

Les entites doivent etre collees avec la structure (`//paste -e` avec
WorldEdit). Les marqueurs permettent au datapack de retrouver les leviers,
l'echelle et la sortie meme si la salle est deplacee, tournee ou mise en
miroir. Eloigner les centres des copies Albertos et RTT d'au moins 80 blocs.

## Mise en route

Apres `/reload`, executer :

`/function sb:module/airship/init`

Pour tester sans la grille, executer en tant que joueur :

- Albertos : `/function sb:module/airship/enter_albertos`
- RTT : `/function sb:module/airship/enter_rtt`

Avec le teleporteur de la grille, utiliser le tag de jeu `Airship`. Quand le
joueur portant `BingoModule_Airship_Playing` arrive a proximite de sa salle,
le datapack le place automatiquement sur l'echelle et lance la partie.
