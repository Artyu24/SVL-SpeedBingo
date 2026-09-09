$execute store result storage simon2:games $(instance).new_color int 1 run random value 1..4
$data modify storage simon2:games $(instance).sequence append from storage simon2:games $(instance).new_color
