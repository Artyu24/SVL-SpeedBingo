$function sb:module/mastermind/clear_proposal {instance:"$(instance)"}
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test1,limit=1] at @s run function sb:module/mastermind/clear_test_row {instance:"$(instance)"}
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test2,limit=1] at @s run function sb:module/mastermind/clear_test_row {instance:"$(instance)"}
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test3,limit=1] at @s run function sb:module/mastermind/clear_test_row {instance:"$(instance)"}
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test4,limit=1] at @s run function sb:module/mastermind/clear_test_row {instance:"$(instance)"}
$execute as @e[type=minecraft:marker,tag=BingoMastermind_$(instance)_Test5,limit=1] at @s run function sb:module/mastermind/clear_test_row {instance:"$(instance)"}
