# Cut Tree Configuration
# ตั้งค่าการทำงานของ Datapack

# Debug Messages (0=ปิด, 1=เปิด) - แนะนำปิดเมื่อเล่นจริง
scoreboard players set #config.debug ct.count 0

# ขนาดสูงสุดของต้นไม้ (จำนวนบล็อกไม้) - เพิ่มเป็น 300 สำหรับต้นใหญ่
scoreboard players set #config.max_logs ct.count 5000

# ทำลายใบไม้อัตโนมัติ (0=ปิด, 1=เปิด)
scoreboard players set #config.break_leaves ct.count 1

# แสดง config summary (เฉพาะเมื่อมีคน reload)
tellraw @a {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua"}
tellraw @a {"text":"  Configuration Reloaded","color":"aqua","bold":true}
tellraw @a [{"text":"  Max Logs: ","color":"gray"},{"score":{"name":"#config.max_logs","objective":"ct.count"},"color":"yellow"}]
tellraw @a [{"text":"  Break Leaves: ","color":"gray"},{"score":{"name":"#config.break_leaves","objective":"ct.count"},"color":"yellow"}," ",{"text":"(0=Off, 1=On)","color":"dark_gray"}]
tellraw @a [{"text":"  Debug Mode: ","color":"gray"},{"score":{"name":"#config.debug","objective":"ct.count"},"color":"yellow"}," ",{"text":"(0=Off, 1=On)","color":"dark_gray"}]
tellraw @a {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua"}
