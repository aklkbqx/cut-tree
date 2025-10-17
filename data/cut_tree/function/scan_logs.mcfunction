summon marker ~ ~ ~ {Tags:["ct.scanner","ct.new"]}
scoreboard players set #temp ct.count 0

execute as @e[type=marker,tag=ct.new] at @s run function cut_tree:scan_recursive

scoreboard players operation @s ct.count = #temp ct.count
kill @e[type=marker,tag=ct.scanner]

return run scoreboard players get #temp ct.count
