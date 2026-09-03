# Module Mastermind

Le plugin gere la combinaison, les propositions, les cinq essais et les
indications. Le datapack gere le chrono, les instances Albertos/RTT, la sortie,
le retour sur la grille et l'attribution de la case.

La teleportation selectionne un seul joueur par equipe avec le tag
`BingoModule_Mastermind_Playing`. Tant que ce tag est present sur un membre de
l'equipe, aucun autre membre ne peut entrer dans le module Mastermind.

Marqueurs requis par instance : `Start`, `ValidationButton`, `Barrel`, `Finish`,
`Answer1` a `Answer5`, `Proposal1` a `Proposal5`, `Test1` a `Test5` et `Return`.
Tous sont inclus dans les schematics sauf `BingoMastermind_Albertos_Return` et
`BingoMastermind_RTT_Return`, qui doivent etre places sur la grille finale.

Les versions redécorées prêtes à coller avec les entités (`//paste -e`) sont :

- `SpeedBingo_schematics/mastermind/mastermind_redecore_Albertos_marqueurs.schem` pour Albertos ;
- `SpeedBingo_schematics/mastermind/mastermind_redecore_RTT_marqueurs.schem` pour RTT.

Initialisation :

`function sb:module/mastermind/mastermind_init {teamA:"Albertos",teamB:"RTT"}`
