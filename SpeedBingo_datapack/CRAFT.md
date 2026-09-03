# Module Craft

Le module utilise deux salles independantes. A chaque teleportation, les huit
coffres sont entierement remplis et le tonneau `CRAFT FINI` est vide. Le joueur
doit retrouver les composants, fabriquer une arbalete puis la deposer dans le
tonneau pour etre teleporte vers la grille.

Schematics pretes a coller avec les entites (`//paste -e`) :

- `SpeedBingo_schematics/craft/salle_craft_A_marqueurs.schem` pour Albertos ;
- `SpeedBingo_schematics/craft/salle_craft_B_marqueurs.schem` pour RTT.

Les marqueurs `Room`, `Submit` et `Chest1` a `Chest8` sont inclus. Seul le
marqueur `BingoCraft_<instance>_Return` doit etre place sur la grille finale.

La case de teleportation doit utiliser le `gameTag` `Craft`. Un seul membre de
chaque equipe peut jouer a la fois.

Initialisation :

`function sb:module/craft/craft_init {teamA:"Albertos",teamB:"RTT"}`
