# ลด durability ของขวานตามจำนวนไม้ที่ตัด (10%)
# รับค่าจาก #destroyed ct.count

# คำนวณ 10% จากจำนวนไม้ที่ตัด
scoreboard players operation #axe_damage ct.count = #destroyed ct.count
scoreboard players set #10_percent ct.count 10
scoreboard players operation #axe_damage ct.count *= #10_percent ct.count
scoreboard players set #100 ct.count 100
scoreboard players operation #axe_damage ct.count /= #100 ct.count

# ถ้าน้อยกว่า 1 ให้เป็น 1 (อย่างน้อยต้องลด 1)
execute unless score #axe_damage ct.count matches 1.. run scoreboard players set #axe_damage ct.count 1

# Debug message
execute if score #config.debug ct.count matches 1.. run tellraw @s [{"text":"[DEBUG] Durability loss: ","color":"gray"},{"score":{"name":"#axe_damage","objective":"ct.count"},"color":"red","bold":true},{"text":" (10% of ","color":"gray"},{"score":{"name":"#destroyed","objective":"ct.count"},"color":"yellow"},{"text":" logs)","color":"gray"}]

# ตรวจสอบว่าผู้เล่นถือขวานอยู่
execute unless predicate tree_cut:holding_axe run return 0

# เริ่ม loop ลด durability
function tree_cut:damage_axe_loop
