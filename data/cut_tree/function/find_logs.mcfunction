execute if score #config.debug ct.count matches 1.. unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] No logs found!","color":"red"}
execute unless score @s ct.count matches 1.. run return fail

execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Found ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"},{"text":" logs","color":"gray"}]

# เช็คว่าเกินขนาดสูงสุดหรือไม่ (แสดง warning ทุก mode)
execute if score @s ct.count > #config.max_logs ct.count run tellraw @s [{"text":"⚠ Tree too large! ","color":"red"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"},{"text":"/","color":"gray"},{"score":{"name":"#config.max_logs","objective":"ct.count"},"color":"yellow"},{"text":" logs","color":"gray"}]
execute if score @s ct.count > #config.max_logs ct.count run return fail

function cut_tree:validate
