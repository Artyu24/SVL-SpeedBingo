# Module Simon

Le plugin detecte automatiquement la salle autour du bouton de depart en
pierre noire polie. Chaque joueur et chaque salle ont une session independante.

Les deux schematics de salle disponibles sont :

- `SpeedBingo_schematics/simon/salle_specimen.schem` ;
- `SpeedBingo_schematics/simon/salle_specimen2.schem`.

Le plugin détectant chaque salle par sa position, aucun nom d'équipe n'est
encodé directement dans ces deux fichiers.

## Correspondance des couleurs

- `t1` : vert
- `t2` : rouge
- `t3` : jaune
- `t4` : bleu

Les noms `t1` a `t4` sont conserves par les tetes posees. En revanche, le nom
personnalise d'un bouton n'est pas conserve apres sa pose. Les boutons de jeu
sont donc associes a leur couleur grace au bloc de beton place juste dessous.

## Demarrage et timer

La teleportation du datapack selectionne un seul membre de chaque equipe avec
le tag `BingoModule_Simon_Playing`. Le plugin refuse le demarrage pour tout
joueur qui ne porte pas ce tag.

Le joueur selectionne appuie sur le bouton en pierre noire polie de sa salle.
Le plugin recherche les quatre tetes et les quatre boutons, ajoute le tag
`BingoSimon_Running`, affiche `3`, `2`, `1` dans son chat, appelle
`sb:timer/start` en tant que ce joueur, puis joue la premiere sequence.

L'objectif `BingoTime` contient un score distinct par joueur. Plusieurs salles
peuvent donc fonctionner en parallele sans melanger leurs chronometres.

Chaque tete doit avoir une waxed copper bulb directement derriere elle. Le
plugin allume et eteint ces quatre bulbs pour afficher la sequence. Aucun
`block_display` n'est utilise.

Le timer du joueur est arrete avec `sb:timer/stop` en cas d'erreur, d'arret
manuel, de deconnexion ou d'arret du plugin.
