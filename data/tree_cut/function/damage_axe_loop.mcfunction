# Loop สำหรับลด durability ทีละ 1 โดยตรง
# ใช้ #axe_damage ct.count เป็นตัวนับ

# ตรวจสอบว่ายังต้องลดต่อไหม
execute unless score #axe_damage ct.count matches 1.. run return fail

# อ่านค่า damage ปัจจุบัน (ถ้าไม่มีให้เป็น 0)
execute store result score #current_damage ct.count run data get entity @s SelectedItem.components."minecraft:damage" 1

# เพิ่ม damage 1 จุด (ลด durability 1 จุด)
scoreboard players add #current_damage ct.count 1

# เซ็ตค่ากลับไปที่ item ผ่าน storage และ macro function
execute store result storage tree_cut:temp damage int 1 run scoreboard players get #current_damage ct.count
function tree_cut:damage_axe_apply with storage tree_cut:temp

# ลดตัวนับ
scoreboard players remove #axe_damage ct.count 1

# เรียกตัวเองต่อถ้ายังเหลือ
execute if score #axe_damage ct.count matches 1.. run function tree_cut:damage_axe_loop
