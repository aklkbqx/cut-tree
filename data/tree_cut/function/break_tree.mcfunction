# แสดงข้อความเริ่มตัด
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[BREAK] กำลังทำลายท่อนไม้ ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow","bold":true},{"text":" บล็อก...","color":"gray"}]

# ทำลายทุกบล็อกที่ทำ marker ไว้
execute as @e[type=marker,tag=ct.mark] at @s run function tree_cut:break_log

# นับจำนวนรวม (เอาจำนวนที่สแกนได้)
scoreboard players operation #destroyed ct.count = @s ct.count

# แสดงผลลัพธ์ที่แม่นยำ - แสดงทั้ง debug และ normal mode
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"✓ ตัดไม้สำเร็จ!","color":"green","bold":true}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"📦 ทำลายแล้ว: ","color":"gray"},{"score":{"name":"#destroyed","objective":"ct.count"},"color":"yellow","bold":true},{"text":" บล็อกไม้","color":"gray"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green"}]

# แสดงสรุปแบบสั้นสำหรับ normal mode
execute unless score #config.debug ct.count matches 1.. run tellraw @s [{"text":"🪓 ","color":"green"},{"text":"ตัดไม้ ","color":"green"},{"score":{"name":"#destroyed","objective":"ct.count"},"color":"yellow","bold":true},{"text":" บล็อก","color":"green"}]

# รวมไม้ทั้งหมดไว้จุดเดียว (ถ้าเปิดใช้งาน) - delay 3t ให้ items drop ครบก่อน
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Config gather_location = ","color":"gray"},{"score":{"name":"#config.gather_location","objective":"ct.count"},"color":"yellow"}]
execute if score #config.gather_location ct.count matches 3 run schedule function tree_cut:gather_items 3t
execute if score #config.debug ct.count matches 1.. if score #config.gather_location ct.count matches 3 run tellraw @s [{"text":"[DEBUG] Scheduled gather_items in 3 ticks","color":"aqua"}]

# ลด durability ของขวาน (10% จากจำนวนไม้)
execute if score #config.damage_axe ct.count matches 1.. run function tree_cut:damage_axe

kill @e[type=marker,tag=ct.mark]