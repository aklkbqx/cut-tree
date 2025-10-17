execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Breaking ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"},{"text":" logs...","color":"gray"}]

# รีเซ็ตตัวนับใบไม้
scoreboard players set @s ct.leaves_broken 0

execute as @e[type=marker,tag=ct.mark] at @s run function cut_tree:break_log

# ทำลายใบไม้รอบๆ บล็อกไม้แต่ละอัน (รัศมี 3 บล็อก เฉพาะต้นตัวเอง + drop ของ)
execute if score #config.break_leaves ct.count matches 1.. run execute as @e[type=marker,tag=ct.mark] at @s run function cut_tree:break_leaves_around

execute if score #config.debug ct.count matches 1.. if score #config.break_leaves ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Destroyed leaves around each log","color":"gray"}]

# Message - แสดงเฉพาะ debug mode
execute if score #config.debug ct.count matches 1.. if score #config.break_leaves ct.count matches 1.. if score @s ct.leaves_broken matches 1.. run tellraw @s [{"text":"✓ Cut down ","color":"green"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"},{"text":" logs","color":"green"},{"text":" + ","color":"gray"},{"score":{"name":"@s","objective":"ct.leaves_broken"},"color":"yellow"},{"text":" leaves!","color":"green"}]
execute if score #config.debug ct.count matches 1.. if score #config.break_leaves ct.count matches 1.. unless score @s ct.leaves_broken matches 1.. run tellraw @s [{"text":"✓ Cut down ","color":"green"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"},{"text":" logs!","color":"green"}]
execute if score #config.debug ct.count matches 1.. unless score #config.break_leaves ct.count matches 1.. run tellraw @s [{"text":"✓ Cut down ","color":"green"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"},{"text":" logs!","color":"green"}]

kill @e[type=marker,tag=ct.mark]
