execute store result score #limit ct.count run scoreboard players add #temp ct.count 1

# Debug ทุก 10 บล็อก (เฉพาะ debug mode)
execute if score #config.debug ct.count matches 1.. if score #limit ct.count matches 1 run tellraw @a [{"text":"[DEBUG] Scanning block 1...","color":"aqua"}]
execute if score #config.debug ct.count matches 1.. if score #limit ct.count matches 10 run tellraw @a [{"text":"[DEBUG] Scanned 10 blocks...","color":"aqua"}]
execute if score #config.debug ct.count matches 1.. if score #limit ct.count matches 20 run tellraw @a [{"text":"[DEBUG] Scanned 20 blocks...","color":"aqua"}]

execute if score #limit ct.count > #config.max_logs ct.count run return fail

execute unless block ~ ~ ~ #minecraft:logs run return fail
execute if entity @e[type=marker,tag=ct.mark,distance=..0.1] run return fail

summon marker ~ ~ ~ {Tags:["ct.mark"]}

execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~ ~ run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~ ~ run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~1 ~ run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~-1 ~ run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~ ~1 run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~ ~-1 run function cut_tree:scan_recursive

execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~1 ~ run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~1 ~ run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~-1 ~ run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~-1 ~ run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~1 ~1 run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~1 ~-1 run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~-1 ~1 run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~ ~-1 ~-1 run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~ ~1 run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~1 ~ ~-1 run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~ ~1 run function cut_tree:scan_recursive
execute if score #limit ct.count <= #config.max_logs ct.count positioned ~-1 ~ ~-1 run function cut_tree:scan_recursive
