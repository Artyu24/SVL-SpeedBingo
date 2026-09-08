# Chronometre commun des cases

Le chronometre commun utilise `BingoTimer_Tick`, `BingoTimer_Second` et
`BingoTimer_Saved`. Le tick global appelle `sb:case/timer/tick`.

Le bloc en chaine conditionnel de chaque case lance le chrono uniquement apres
une teleportation reussie :

`function sb:case/timer/start {gameTag:"<case>",teamName:"<equipe>"}`

Une reussite appelle `sb:case/timer/valid` avec l'equipe gagnante, l'equipe
adverse, le nom de la case et les couleurs. Un echec definitif ou un abandon
appelle `sb:case/timer/cancel` depuis la position du joueur.

Correspondances des modules :

- Simon : `D1`
- Craft : `A2`
- Tetes : `C2`
- Leviers : `A3`
- Mastermind : `B4`

Simon conserve une regle speciale : la serie la plus longue gagne. Le temps le
plus court ne sert qu'a departager une egalite de series.
