# แสดงข้อความเริ่มตัด
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[BREAK] กำลังทำลายท่อนไม้ ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow","bold":true},{"text":" บล็อก...","color":"gray"}]

# นับจำนวนบล็อกที่ทำลายจริง (ไม่รวมบล็อกที่ผู้เล่นตัด)
scoreboard players set #destroyed ct.count 0
execute as @e[type=marker,tag=ct.mark] at @s if block ~ ~ ~ #minecraft:logs run scoreboard players add #destroyed ct.count 1

# บวก +1 สำหรับบล็อกที่ผู้เล่นตัดไปแล้ว
scoreboard players add #destroyed ct.count 1

# ทำลายทุกบล็อกที่ทำ marker ไว้
execute as @e[type=marker,tag=ct.mark] at @s run function cut_tree:break_log

# แสดงผลลัพธ์ที่แม่นยำ - แสดงทั้ง debug และ normal mode
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"✓ ตัดไม้สำเร็จ!","color":"green","bold":true}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"📦 ทำลายแล้ว: ","color":"gray"},{"score":{"name":"#destroyed","objective":"ct.count"},"color":"yellow","bold":true},{"text":" บล็อกไม้","color":"gray"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green"}]

# แสดงสรุปแบบสั้นสำหรับ normal mode
execute unless score #config.debug ct.count matches 1.. run tellraw @s [{"text":"🪓 ","color":"green"},{"text":"ตัดไม้ ","color":"green"},{"score":{"name":"#destroyed","objective":"ct.count"},"color":"yellow","bold":true},{"text":" บล็อก","color":"green"}]

# ลด durability ของขวาน (10% จากจำนวนไม้)
execute if score #config.damage_axe ct.count matches 1.. run function cut_tree:damage_axe

kill @e[type=marker,tag=ct.mark]
