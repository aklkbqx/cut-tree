# เช็คว่าเป็น log จริงๆ ก่อนนับ
execute unless block ~ ~ ~ #minecraft:logs run return 0
execute if entity @e[type=marker,tag=ct.mark,distance=..0.1] run return 0

# นับบล็อกที่ถูกต้อง
execute store result score #limit ct.count run scoreboard players add #temp ct.count 1

# Debug ทุก 10 บล็อก (เฉพาะ debug mode)
execute if score #config.debug ct.count matches 1.. if score #limit ct.count matches 1 run tellraw @a [{"text":"[DEBUG] Scanning block 1...","color":"aqua"}]
execute if score #config.debug ct.count matches 1.. if score #limit ct.count matches 10 run tellraw @a [{"text":"[DEBUG] Scanned 10 blocks...","color":"aqua"}]
execute if score #config.debug ct.count matches 1.. if score #limit ct.count matches 20 run tellraw @a [{"text":"[DEBUG] Scanned 20 blocks...","color":"aqua"}]
execute if score #config.debug ct.count matches 1.. if score #limit ct.count matches 50 run tellraw @a [{"text":"[DEBUG] Scanned 50 blocks...","color":"yellow"}]
execute if score #config.debug ct.count matches 1.. if score #limit ct.count matches 100 run tellraw @a [{"text":"[DEBUG] Scanned 100 blocks...","color":"gold"}]

# ตรวจสอบว่าเกินขนาดสูงสุดหรือไม่
execute if score #limit ct.count > #config.max_logs ct.count run return 0

# ยืนยันอีกครั้งว่าเป็น log จริง แล้วค่อยทำ marker
summon marker ~ ~ ~ {Tags:["ct.mark"]}

# Scan ทิศทาง 6 ด้าน หลัก (X, Y, Z)
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~ ~ run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~ ~ run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~1 ~ run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~-1 ~ run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~ ~1 run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~ ~-1 run function tree_cut:scan_recursive

# Scan ทิศทางเฉียง (Diagonal - 12 ทิศทาง)
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~1 ~ run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~1 ~ run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~-1 ~ run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~-1 ~ run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~1 ~1 run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~1 ~-1 run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~-1 ~1 run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~-1 ~-1 run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~ ~1 run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~ ~-1 run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~ ~1 run function tree_cut:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~ ~-1 run function tree_cut:scan_recursive
