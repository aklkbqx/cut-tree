# ตรวจสอบว่าพบไม้หรือไม่
execute if score #config.debug ct.count matches 1.. unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] No logs found!","color":"red"}
execute unless score @s ct.count matches 1.. run return 0

# แสดงจำนวนไม้ที่พบ (debug mode)
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] ===== LOG COUNT =====","color":"gold","bold":true}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Total logs found: ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow","bold":true},{"text":" blocks","color":"gray"}]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Max allowed: ","color":"gray"},{"score":{"name":"#config.max_logs","objective":"ct.count"},"color":"green"},{"text":" blocks","color":"gray"}]

# เช็คว่าเกินขนาดสูงสุดหรือไม่ (แสดง warning ทุก mode)
execute if score @s ct.count > #config.max_logs ct.count run tellraw @s [{"text":"⚠ ต้นไม้ใหญ่เกินไป! ","color":"red","bold":true},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"},{"text":"/","color":"gray"},{"score":{"name":"#config.max_logs","objective":"ct.count"},"color":"yellow"},{"text":" บล็อก","color":"gray"}]
execute if score @s ct.count > #config.max_logs ct.count run tellraw @s [{"text":"💡 เพิ่มค่า max_logs ใน config.mcfunction","color":"gold","italic":true}]
execute if score @s ct.count > #config.max_logs ct.count run return 0

function tree_cut:validate
