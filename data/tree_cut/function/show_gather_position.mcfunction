# แสดงตำแหน่งที่รวมไม้
# Parameters: trunk_x, trunk_y, trunk_z (จาก storage tree_cut:data)

$tellraw @a [{"text":"📍 ตำแหน่ง: ","color":"gray"},{"text":"(","color":"dark_gray"},{"text":"$(trunk_x)","color":"yellow","bold":true},{"text":", ","color":"dark_gray"},{"text":"$(trunk_y)","color":"yellow","bold":true},{"text":", ","color":"dark_gray"},{"text":"$(trunk_z)","color":"yellow","bold":true},{"text":")","color":"dark_gray"}]
