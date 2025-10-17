# ตรวจสอบว่าเป็น log จริงก่อนทำลาย
execute unless block ~ ~ ~ #minecraft:logs run return fail

# สร้าง particle ตามชนิดไม้ที่ทำลาย
execute if block ~ ~ ~ minecraft:oak_log run particle minecraft:block{block_state:"minecraft:oak_log"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10
execute if block ~ ~ ~ minecraft:spruce_log run particle minecraft:block{block_state:"minecraft:spruce_log"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10
execute if block ~ ~ ~ minecraft:birch_log run particle minecraft:block{block_state:"minecraft:birch_log"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10
execute if block ~ ~ ~ minecraft:jungle_log run particle minecraft:block{block_state:"minecraft:jungle_log"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10
execute if block ~ ~ ~ minecraft:acacia_log run particle minecraft:block{block_state:"minecraft:acacia_log"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10
execute if block ~ ~ ~ minecraft:dark_oak_log run particle minecraft:block{block_state:"minecraft:dark_oak_log"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10
execute if block ~ ~ ~ minecraft:mangrove_log run particle minecraft:block{block_state:"minecraft:mangrove_log"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10
execute if block ~ ~ ~ minecraft:cherry_log run particle minecraft:block{block_state:"minecraft:cherry_log"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10
execute if block ~ ~ ~ minecraft:crimson_stem run particle minecraft:block{block_state:"minecraft:crimson_stem"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10
execute if block ~ ~ ~ minecraft:warped_stem run particle minecraft:block{block_state:"minecraft:warped_stem"} ~ ~0.5 ~ 0.3 0.3 0.3 0.1 10

# ทำลายบล็อก
setblock ~ ~ ~ air destroy
