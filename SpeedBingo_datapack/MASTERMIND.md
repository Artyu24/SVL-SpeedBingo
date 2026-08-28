# Module Mastermind

Le plugin gere la combinaison, les propositions, les cinq essais et les
indications. Le datapack gere le chrono, les instances A/B, la sortie, le retour
sur la grille et l'attribution de la case.

La teleportation selectionne un seul joueur par equipe avec le tag
`BingoModule_Mastermind_Playing`. Tant que ce tag est present sur un membre de
l'equipe, aucun autre membre ne peut entrer dans le module Mastermind.

Marqueurs requis par instance : `Start`, `ValidationButton`, `Barrel`, `Finish`,
`Answer1` a `Answer5`, `Proposal1` a `Proposal5`, `Test1` a `Test5` et `Return`.
Tous sont inclus dans les schematics sauf `Return`, qui doit etre place sur la
grille finale.

Initialisation :

`function sb:module/mastermind/mastermind_init {teamA:"Rat",teamB:"Stagiaire"}`
