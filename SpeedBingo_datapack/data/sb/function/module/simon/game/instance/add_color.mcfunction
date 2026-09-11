$execute store result storage sb:simon $(instance).new_color int 1 run random value 1..4
$data modify storage sb:simon $(instance).sequence append from storage sb:simon $(instance).new_color
