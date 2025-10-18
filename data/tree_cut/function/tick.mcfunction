execute as @a[predicate=tree_cut:mined_log,predicate=tree_cut:holding_axe] at @s run function tree_cut:detect

execute as @e[type=marker,tag=ct.process] at @s run function tree_cut:process_tree
