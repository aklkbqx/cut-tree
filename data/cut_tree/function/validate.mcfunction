# ตรวจสอบความเป็นต้นไม้จริงๆ (ผ่อนปรนกว่าเดิม แต่ยังปลอดภัย)

# 1. นับจำนวนใบไม้รอบๆ บล็อกไม้ทั้งหมด
scoreboard players set @s ct.leaves 0
scoreboard players set @s ct.leaves_total 0
execute as @e[type=marker,tag=ct.mark] at @s run function cut_tree:check_leaves
execute as @e[type=marker,tag=ct.mark] at @s run function cut_tree:count_leaves

# 2. ตรวจความสูงของต้นไม้ (นับจากบล็อกล่างสุด)
scoreboard players set @s ct.height 1
execute as @e[type=marker,tag=ct.mark,sort=nearest,limit=1] at @s run function cut_tree:check_tree_height

# 3. Debug info (แสดงเฉพาะ debug mode)
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] === TREE VALIDATION ===","color":"aqua","bold":true}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Total Logs: ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Total Leaves: ","color":"gray"},{"score":{"name":"@s","objective":"ct.leaves_total"},"color":"yellow"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Tree Height: ","color":"gray"},{"score":{"name":"@s","objective":"ct.height"},"color":"yellow"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Leaves (old check): ","color":"gray"},{"score":{"name":"@s","objective":"ct.leaves"},"color":"yellow"}]

# 4. เกณฑ์การตรวจสอบ (ผ่อนปรนแล้ว):
# - มีใบไม้อย่างน้อย 3 บล็อก (ลดจาก 5)
# - ความสูงต้อง >= 2 บล็อก (ลดจาก 3) 
# - หรือ มีใบไม้เยอะพอ (>= 1 ใบต่อ 3 ท่อนไม้)

scoreboard players set @s ct.valid 0

# เงื่อนไขง่าย: มีใบไม้ >= 3 และความสูง >= 2
execute if score @s ct.leaves_total matches 3.. if score @s ct.height matches 2.. run scoreboard players set @s ct.valid 1

# หรือ ถ้ามีใบเยอะมาก (>= 10 ใบ) ก็ผ่านเลย
execute if score @s ct.leaves_total matches 10.. run scoreboard players set @s ct.valid 1

# หรือ ถ้าต้นสูงมาก (>= 5 บล็อก) และมีใบบ้าง (>= 2) ก็ผ่าน
execute if score @s ct.height matches 5.. if score @s ct.leaves_total matches 2.. run scoreboard players set @s ct.valid 1

# แสดงผลลัพธ์ (debug mode)
execute if score #config.debug ct.count matches 1.. if score @s ct.valid matches 1.. run tellraw @s {"text":"[DEBUG] ✓ Valid tree confirmed!","color":"green","bold":true}
execute if score #config.debug ct.count matches 1.. unless score @s ct.valid matches 1.. run tellraw @s [{"text":"[DEBUG] ✗ Not a valid tree! Need: (Height>=2 AND Leaves>=3) OR (Leaves>=10) OR (Height>=5 AND Leaves>=2)","color":"red"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s {"text":"[DEBUG] =========================","color":"aqua"}

# Production message ถูกลบออกแล้ว (ไม่แสดงใน production mode)
