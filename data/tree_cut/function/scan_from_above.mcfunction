execute if score #config.debug ct.count matches 1.. run tellraw @a {"text":"[DEBUG] scan_from_above started","color":"light_purple"}

summon marker ~ ~ ~ {Tags:["ct.scanner","ct.new"]}
scoreboard players set #temp ct.count 0

execute if score #config.debug ct.count matches 1.. run tellraw @a {"text":"[DEBUG] Starting recursive scan...","color":"light_purple"}
execute as @e[type=marker,tag=ct.new] at @s run function tree_cut:scan_recursive

scoreboard players operation @p ct.count = #temp ct.count
kill @e[type=marker,tag=ct.scanner]
tag @e[type=marker,tag=ct.new] remove ct.new
