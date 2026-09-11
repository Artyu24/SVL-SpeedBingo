# Dans les nouvelles schematics WE, le marqueur ValidationButton se trouve
# exactement dans le bloc du bouton. Le cooldown garantit un seul essai par clic.
$execute if block ~ ~ ~ minecraft:pale_oak_button[powered=true] as @a[tag=BingoMastermind_Running,tag=!BingoMastermind_Ready,scores={BingoMMCooldown=0},distance=..8,sort=nearest,limit=1] run function sb:module/mastermind/button_press {instance:"$(instance)"}
