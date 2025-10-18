# รวมไม้ทั้งหมดไว้จุดเดียว (เฉพาะไม้จากต้นที่ตัด)
# Mode 3: ตำแหน่ง player-mined block

# Debug: เข้า function แล้ว
execute if score #config.debug ct.count matches 1.. run tellraw @a[distance=..50] [{"text":"[DEBUG] gather_items called!","color":"red","bold":true}]

# นับจำนวน items ที่จะรวม
execute store result score #item_count ct.count if entity @e[type=item,tag=ct.from_this_tree]
execute if score #config.debug ct.count matches 1.. run tellraw @a[distance=..50] [{"text":"[DEBUG] Found items with tag: ","color":"gray"},{"score":{"name":"#item_count","objective":"ct.count"},"color":"yellow"}]

# Teleport items ไปที่ตำแหน่ง player-mined block
execute as @e[type=item,tag=ct.from_this_tree] at @s run function tree_cut:gather_items_to_mined with storage tree_cut:data

# Reset PickupDelay ให้เก็บได้หลังจาก 1 วินาที
execute as @e[type=item,tag=ct.from_this_tree] run data merge entity @s {PickupDelay:20}

# ลบ tag
tag @e[type=item,tag=ct.from_this_tree] remove ct.from_this_tree

# Debug message with position (ใช้ tellraw ธรรมดาแทน macro)
execute if score #config.debug ct.count matches 1.. run tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua"}]
execute if score #config.debug ct.count matches 1.. run tellraw @a [{"text":"📦 [GATHER] ","color":"green","bold":true},{"text":"รวมไม้ ","color":"gray"},{"score":{"name":"#item_count","objective":"ct.count"},"color":"yellow","bold":true},{"text":" items","color":"gray"}]
execute if score #config.debug ct.count matches 1.. run function tree_cut:show_gather_position with storage tree_cut:data
execute if score #config.debug ct.count matches 1.. run tellraw @a [{"text":"⏱️ PickupDelay: ","color":"gray"},{"text":"20 ticks","color":"yellow"},{"text":" (1 วินาที)","color":"dark_gray"}]
execute if score #config.debug ct.count matches 1.. run tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua"}]
