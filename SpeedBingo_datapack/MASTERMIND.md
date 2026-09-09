# Module Mastermind

Le plugin gere la combinaison, les propositions, les cinq essais et les
indications. Le datapack gere le chrono, les instances Albertos/RTT, la sortie,
le retour sur la grille et l'attribution de la case.

La teleportation selectionne un seul joueur par equipe avec le tag
`BingoModule_B4_Playing`. Tant que ce tag est present sur un membre de
l'equipe, aucun autre membre ne peut entrer dans le module Mastermind.
La case de teleportation doit donc utiliser le `gameTag` `B4`.

Marqueurs requis par instance : `Start`, `ValidationButton`, `Barrel`, `Finish`,
`Answer1` a `Answer5`, `Proposal1` a `Proposal5` et `Test1` a `Test5`.
Le retour utilise automatiquement le marqueur `B4` le plus proche sur la grille.

Les versions redécorées prêtes à coller avec les entités (`//paste -e`) sont :

- `SpeedBingo_schematics/mastermind/mastermind_redecore_Albertos_marqueurs.schem` pour Albertos ;
- `SpeedBingo_schematics/mastermind/mastermind_redecore_RTT_marqueurs.schem` pour RTT.

Initialisation :

`function sb:module/mastermind/mastermind_init {teamA:"Albertos",teamB:"RTT"}`
