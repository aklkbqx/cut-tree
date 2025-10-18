# นับจำนวนใบไม้รอบๆ บล็อกไม้ (6 ทิศทาง + diagonal)

execute if block ~1 ~ ~ #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~-1 ~ ~ #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~ ~1 ~ #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~ ~-1 ~ #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~ ~ ~1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~ ~ ~-1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1

# เช็ค diagonal (มุม)
execute if block ~1 ~1 ~ #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~-1 ~1 ~ #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~1 ~-1 ~ #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~-1 ~-1 ~ #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~ ~1 ~1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~ ~1 ~-1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~ ~-1 ~1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~ ~-1 ~-1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~1 ~ ~1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~1 ~ ~-1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~-1 ~ ~1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
execute if block ~-1 ~ ~-1 #minecraft:leaves run scoreboard players add @p ct.leaves_total 1
