# Detect single log type and start cutting (เรียกจาก macro)
# Parameters: log_id, leaves_id
$execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:$(log_id)"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"$(log_id)",leaves:"$(leaves_id)"}
