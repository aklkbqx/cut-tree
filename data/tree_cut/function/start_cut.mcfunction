scoreboard players set @s ct.count 0
scoreboard players set @s ct.valid 0
scoreboard players set @s ct.leaves 0
scoreboard players set @s ct.height 0
scoreboard players set @s ct.leaves_total 0

$data modify storage tree_cut:data block set value "$(block)"
$data modify storage tree_cut:data leaves set value "$(leaves)"

# เก็บตำแหน่งปัจจุบัน (context position) ไม่ใช่ตำแหน่งผู้เล่น
summon marker ~ ~ ~ {Tags:["ct.position_marker"]}
execute as @e[type=marker,tag=ct.position_marker,limit=1] store result storage tree_cut:data gather_pos_x int 1 run data get entity @s Pos[0]
execute as @e[type=marker,tag=ct.position_marker,limit=1] store result storage tree_cut:data gather_pos_y int 1 run data get entity @s Pos[1]
execute as @e[type=marker,tag=ct.position_marker,limit=1] store result storage tree_cut:data gather_pos_z int 1 run data get entity @s Pos[2]
execute as @e[type=marker,tag=ct.position_marker,limit=1] store result storage tree_cut:data trunk_x int 1 run data get entity @s Pos[0]
execute as @e[type=marker,tag=ct.position_marker,limit=1] store result storage tree_cut:data trunk_y int 1 run data get entity @s Pos[1]
execute as @e[type=marker,tag=ct.position_marker,limit=1] store result storage tree_cut:data trunk_z int 1 run data get entity @s Pos[2]
kill @e[type=marker,tag=ct.position_marker]

execute if score #config.debug ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Starting tree scan...","color":"gray"}

execute if score #config.debug ct.count matches 1.. run summon marker ~ ~ ~ {Tags:["ct.pos_temp"]}
execute if score #config.debug ct.count matches 1.. as @e[type=marker,tag=ct.pos_temp,limit=1,sort=nearest] store result score #pos_x ct.count run data get entity @s Pos[0]
execute if score #config.debug ct.count matches 1.. as @e[type=marker,tag=ct.pos_temp,limit=1,sort=nearest] store result score #pos_y ct.count run data get entity @s Pos[1]
execute if score #config.debug ct.count matches 1.. as @e[type=marker,tag=ct.pos_temp,limit=1,sort=nearest] store result score #pos_z ct.count run data get entity @s Pos[2]
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"💥 [BREAK] ","color":"red","bold":true},{"text":"Position: ","color":"gray"},{"text":"(","color":"dark_gray"},{"score":{"name":"#pos_x","objective":"ct.count"},"color":"yellow","bold":true},{"text":", ","color":"dark_gray"},{"score":{"name":"#pos_y","objective":"ct.count"},"color":"yellow","bold":true},{"text":", ","color":"dark_gray"},{"score":{"name":"#pos_z","objective":"ct.count"},"color":"yellow","bold":true},{"text":")","color":"dark_gray"},{"text":" [Player-mined]","color":"aqua","italic":true}]
execute if score #config.debug ct.count matches 1.. run kill @e[type=marker,tag=ct.pos_temp]

execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Checking scan positions...","color":"gray"}]

execute if score #config.debug ct.count matches 1.. positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:logs run tellraw @s {"text":"[DEBUG] Found logs above, scanning from above","color":"yellow"}
execute positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:logs run function tree_cut:scan_from_above
execute if score #config.debug ct.count matches 1.. positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Found logs to the side (+X)","color":"yellow"}
execute positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run function tree_cut:scan_from_side

execute if score #config.debug ct.count matches 1.. positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Found logs to the side (-X)","color":"yellow"}
execute positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run function tree_cut:scan_from_side

execute if score #config.debug ct.count matches 1.. positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Found logs to the side (+Z)","color":"yellow"}
execute positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run function tree_cut:scan_from_side

execute if score #config.debug ct.count matches 1.. positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run tellraw @s {"text":"[DEBUG] Found logs to the side (-Z)","color":"yellow"}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:logs unless score @s ct.count matches 1.. run function tree_cut:scan_from_side

# เช็คว่าเป็นต้น Jungle/Dark Oak 2x2 หรือไม่
execute positioned ~1 ~ ~1 if block ~ ~ ~ #minecraft:logs if block ~-1 ~ ~ #minecraft:logs if block ~ ~ ~-1 #minecraft:logs unless score @s ct.count matches 1.. run function tree_cut:scan_from_side

execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Scan complete. Running find_logs with count: ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow"}]

# บวก +1 เพื่อนับบล็อกแรกที่ผู้เล่นตัดไปแล้ว
execute if score @s ct.count matches 1.. run scoreboard players add @s ct.count 1
execute if score #config.debug ct.count matches 1.. if score @s ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] +1 for player-mined block. Total: ","color":"gray"},{"score":{"name":"@s","objective":"ct.count"},"color":"yellow","bold":true}]

function tree_cut:find_logs

execute if score @s ct.valid matches 1 run function tree_cut:break_tree
execute unless score @s ct.valid matches 1 run kill @e[type=marker,tag=ct.mark]
