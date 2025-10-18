# ตรวจสอบว่าเป็น log จริงก่อนทำลาย
execute unless block ~ ~ ~ #minecraft:logs run return 0

# สร้าง particle effect
particle minecraft:poof ~ ~0.5 ~ 0.3 0.3 0.3 0.05 15
particle minecraft:cloud ~ ~0.5 ~ 0.2 0.2 0.2 0.01 5

# ทำลายบล็อก (ให้ drop item ตามปกติ)
setblock ~ ~ ~ air destroy

# Tag items ที่เพิ่ง drop
execute as @e[type=item,distance=..2,nbt={Age:0s}] run tag @s add ct.from_this_tree
execute as @e[type=item,tag=ct.from_this_tree,distance=..2] run data merge entity @s {PickupDelay:10}
