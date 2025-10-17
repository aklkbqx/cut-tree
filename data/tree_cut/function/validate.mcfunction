# ตรวจสอบความเป็นต้นไม้จริงๆ (ผ่อนปรนกว่าเดิม แต่ยังปลอดภัย)

# 1. นับจำนวนใบไม้รอบๆ บล็อกไม้ทั้งหมด
scoreboard players set @s ct.leaves 0
scoreboard players set @s ct.leaves_total 0
execute as @e[type=marker,tag=ct.mark] at @s run function tree_cut:check_leaves
execute as @e[type=marker,tag=ct.mark] at @s run function tree_cut:count_leaves

# 2. ตรวจความสูงของต้นไม้ (นับจากบล็อกล่างสุด)
scoreboard players set @s ct.height 1
execute as @e[type=marker,tag=ct.mark,sort=nearest,limit=1] at @s run function tree_cut:check_tree_height

# 3. Debug info (แสดงเฉพาะ debug mode)
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[VALIDATION] ตรวจสอบต้นไม้","color":"aqua","bold":true}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"📊 จำนวนท่อนไม้: ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow","bold":true},{"text":" บล็อก","color":"gray"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"🍃 จำนวนใบไม้: ","color":"gray"},{"score":{"name":"@s","objective":"ct.leaves_total"},"color":"yellow","bold":true},{"text":" บล็อก","color":"gray"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"📏 ความสูงต้นไม้: ","color":"gray"},{"score":{"name":"@s","objective":"ct.height"},"color":"yellow","bold":true},{"text":" บล็อก","color":"gray"}]

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
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua"}]
execute if score #config.debug ct.count matches 1.. if score @s ct.valid matches 1.. run tellraw @s [{"text":"✓ ยืนยัน: เป็นต้นไม้จริง!","color":"green","bold":true}]
execute if score #config.debug ct.count matches 1.. if score @s ct.valid matches 1.. run tellraw @s [{"text":"🪓 กำลังตัดไม้ ","color":"green"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow","bold":true},{"text":" บล็อก...","color":"green"}]
execute if score #config.debug ct.count matches 1.. unless score @s ct.valid matches 1.. run tellraw @s [{"text":"✗ ไม่ใช่ต้นไม้จริง!","color":"red","bold":true}]
execute if score #config.debug ct.count matches 1.. unless score @s ct.valid matches 1.. run tellraw @s [{"text":"เกณฑ์: (สูง≥2 และ ใบ≥3) หรือ (ใบ≥10) หรือ (สูง≥5 และ ใบ≥2)","color":"gray","italic":true}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua"}]

# ตรวจสอบว่าผ่านหรือไม่
execute if score @s ct.valid matches 1.. run function tree_cut:break_tree
