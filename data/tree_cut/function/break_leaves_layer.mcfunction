# ทำลายใบไม้ทีละบล็อกด้วย setblock destroy เพื่อให้ drop ของ

execute if block ~ ~ ~ #minecraft:leaves run setblock ~ ~ ~ air destroy
execute if block ~ ~ ~ air run scoreboard players add @p[predicate=tree_cut:holding_axe] ct.leaves_broken 1
