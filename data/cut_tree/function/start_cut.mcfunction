scoreboard players set @s ct.count 0
scoreboard players set @s ct.valid 0
scoreboard players set @s ct.leaves 0
scoreboard players set @s ct.height 0
scoreboard players set @s ct.leaves_total 0

$data modify storage cut_tree:data block set value "$(block)"
$data modify storage cut_tree:data leaves set value "$(leaves)"

execute if score #config.debug ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Starting tree scan...","color":"gray"}
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Checking scan positions...","color":"gray"}]

execute if score #config.debug ct.count matches 1.. positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:logs run tellraw @s {"text":"[DEBUG] Found logs above, scanning from above","color":"yellow"}
execute positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:logs run function cut_tree:scan_from_above
execute if score #config.debug ct.count matches 1.. positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Found logs to the side (+X)","color":"yellow"}
execute positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run function cut_tree:scan_from_side

execute if score #config.debug ct.count matches 1.. positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Found logs to the side (-X)","color":"yellow"}
execute positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run function cut_tree:scan_from_side

execute if score #config.debug ct.count matches 1.. positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Found logs to the side (+Z)","color":"yellow"}
execute positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run function cut_tree:scan_from_side

execute if score #config.debug ct.count matches 1.. positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Found logs to the side (-Z)","color":"yellow"}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run function cut_tree:scan_from_side

# เช็คว่าเป็นต้น Jungle/Dark Oak 2x2 หรือไม่
execute positioned ~1 ~ ~1 if block ~ ~ ~ #minecraft:logs if block ~-1 ~ ~ #minecraft:logs if block ~ ~ ~-1 #minecraft:logs unless score @s ct.count matches 1.. run function cut_tree:scan_from_side

execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Scan complete. Running find_logs with count: ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"}]

# บวก +1 เพื่อนับบล็อกแรกที่ผู้เล่นตัดไปแล้ว
execute if score @s ct.count matches 1.. run scoreboard players add @s ct.count 1
execute if score #config.debug ct.count matches 1.. if score @s ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] +1 for player-mined block. Total: ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow","bold":true}]

function cut_tree:find_logs

execute if score @s ct.valid matches 1 run function cut_tree:break_tree
execute unless score @s ct.valid matches 1 run kill @e[type=marker,tag=ct.mark]
