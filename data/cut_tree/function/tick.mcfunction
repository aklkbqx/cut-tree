execute as @a[predicate=cut_tree:mined_log,predicate=cut_tree:holding_axe] at @s run function cut_tree:detect

execute as @e[type=marker,tag=ct.process] at @s run function cut_tree:process_tree
