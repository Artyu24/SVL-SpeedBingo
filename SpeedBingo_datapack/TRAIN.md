# Train des salles enfant

Le train fonctionne automatiquement dans deux salles indépendantes :

- instance `Albertos` ;
- instance `RTT`.

Le train apparaît lorsqu'au moins un membre de l'équipe associée se trouve dans
sa salle. Il tourne en boucle tant que la salle est occupée, puis disparaît quand
le dernier membre en sort.

Schematics à coller avec les entités (`//paste -e`) :

- `SpeedBingo_schematics/train/salle_enfant_equipe_Albertos_datapack.schem` ;
- `SpeedBingo_schematics/train/salle_enfant_equipe_RTT_datapack.schem`.

Les schematics ne contiennent plus de command blocks. Les marqueurs du circuit
et de la salle sont enregistrés automatiquement par le datapack.

Commande de nettoyage des trains actifs :

`/function train_mymy:cleanup`

Le resource pack SurvIsland doit fournir les modèles `locomotive_fast`,
`craft_wagon_empty` et `chest_wagon`.
