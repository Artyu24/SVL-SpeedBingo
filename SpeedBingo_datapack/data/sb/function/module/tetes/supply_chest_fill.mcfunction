# Le coffre de materiel ne contient que ces deux objets.
data modify block ~ ~ ~ Items set value []
item replace block ~ ~ ~ container.0 with minecraft:paper[minecraft:custom_data={BingoZipItem:1}] 1
item replace block ~ ~ ~ container.1 with minecraft:experience_bottle[minecraft:custom_data={BingoZipItem:1}] 10
