scoreboard objectives add ct.mined_oak minecraft.mined:minecraft.oak_log
scoreboard objectives add ct.mined_spruce minecraft.mined:minecraft.spruce_log
scoreboard objectives add ct.mined_birch minecraft.mined:minecraft.birch_log
scoreboard objectives add ct.mined_jungle minecraft.mined:minecraft.jungle_log
scoreboard objectives add ct.mined_acacia minecraft.mined:minecraft.acacia_log
scoreboard objectives add ct.mined_dark_oak minecraft.mined:minecraft.dark_oak_log
scoreboard objectives add ct.mined_mangrove minecraft.mined:minecraft.mangrove_log
scoreboard objectives add ct.mined_cherry minecraft.mined:minecraft.cherry_log
scoreboard objectives add ct.mined_crimson minecraft.mined:minecraft.crimson_stem
scoreboard objectives add ct.mined_warped minecraft.mined:minecraft.warped_stem

scoreboard objectives add ct.count dummy
scoreboard objectives add ct.valid dummy
scoreboard objectives add ct.leaves dummy
scoreboard objectives add ct.height dummy
scoreboard objectives add ct.leaves_total dummy
scoreboard objectives add ct.leaves_broken dummy

function tree_cut:config

# แสดงข้อความ banner สวยงาม
tellraw @a {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_green","bold":true}
tellraw @a [{"text":"  🪓 Tree Cut Datapack ","color":"green","bold":true},{"text":"v1.0","color":"yellow"}]
tellraw @a {"text":"  Automatically cut entire trees!","color":"gray","italic":true}
tellraw @a {"text":""}
tellraw @a [{"text":"  Developer: ","color":"gray"},{"text":"Akalak Kruaboon","color":"aqua","bold":true}]
tellraw @a [{"text":"  Instagram: ","color":"gray"},{"text":"akl.kbqx","color":"light_purple","clickEvent":{"action":"open_url","value":"https://instagram.com/akl.kbqx"},"hoverEvent":{"action":"show_text","contents":"Click to open Instagram"}}]
tellraw @a [{"text":"  GitHub: ","color":"gray"},{"text":"aklkbqx","color":"white","clickEvent":{"action":"open_url","value":"https://github.com/aklkbqx"},"hoverEvent":{"action":"show_text","contents":"Click to open GitHub"}}]
tellraw @a {"text":""}
tellraw @a [{"text":"  Status: ","color":"gray"},{"text":"✓ Loaded Successfully","color":"green"}]
tellraw @a {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_green","bold":true}
