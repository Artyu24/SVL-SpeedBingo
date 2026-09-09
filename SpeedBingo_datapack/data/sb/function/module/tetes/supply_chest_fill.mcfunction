# Le baril de reponse n'est jamais concerne par cette fonction.
data remove block ~ ~ ~ Items[{id:"minecraft:paper"}]
data remove block ~ ~ ~ Items[{id:"minecraft:experience_bottle"}]
item replace block ~ ~ ~ container.0 with minecraft:paper 1
item replace block ~ ~ ~ container.1 with minecraft:experience_bottle 1
