# ตรวจสอบความสูงของต้นไม้โดยนับบล็อกไม้ในแนวตั้ง
# เพิ่ม limit เพื่อไม่ให้ recursive ไปเรื่อยๆ

execute if score @p ct.height matches ..50 if block ~ ~1 ~ #minecraft:logs run scoreboard players add @p ct.height 1
execute if score @p ct.height matches ..50 if block ~ ~1 ~ #minecraft:logs positioned ~ ~1 ~ run function tree_cut:check_tree_height
