# Dans les nouvelles schematics WE, le marqueur ValidationButton se trouve
# exactement dans le bloc du bouton. Le cooldown garantit un seul essai par clic.
$execute if block ~ ~ ~ minecraft:pale_oak_button[powered=true] as @a[tag=BingoModule_$(caseName)_Playing,scores={BingoMMCooldown=0,BingoMMState=1},distance=..8,sort=nearest,limit=1] run function sb:module/mastermind/button_press {instance:"$(instance)"}
