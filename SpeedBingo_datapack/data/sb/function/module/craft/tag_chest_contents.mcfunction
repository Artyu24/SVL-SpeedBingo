# Marque toutes les ressources generees dans un coffre du module Craft.
data modify block ~ ~ ~ Items[].components."minecraft:custom_data" set value {sb_module:"craft"}
