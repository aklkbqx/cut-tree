# ทำลายใบไม้รอบๆ บล็อกไม้นี้ในรัศมี 5 บล็อก (เฉพาะใบไม้ที่ติดกับต้นไม้ตัวนี้)
# ใช้ setblock destroy เพื่อให้ drop ไอเทม

# ทำลายใบไม้รอบๆ ในรัศมี 5x5x5
execute positioned ~-5 ~-5 ~-5 run function tree_cut:break_leaves_layer
execute positioned ~-5 ~-5 ~ run function tree_cut:break_leaves_layer
execute positioned ~-5 ~-5 ~5 run function tree_cut:break_leaves_layer
execute positioned ~-5 ~ ~-5 run function tree_cut:break_leaves_layer
execute positioned ~-5 ~ ~ run function tree_cut:break_leaves_layer
execute positioned ~-5 ~ ~5 run function tree_cut:break_leaves_layer
execute positioned ~-5 ~5 ~-5 run function tree_cut:break_leaves_layer
execute positioned ~-5 ~5 ~ run function tree_cut:break_leaves_layer
execute positioned ~-5 ~5 ~5 run function tree_cut:break_leaves_layer

execute positioned ~ ~-5 ~-5 run function tree_cut:break_leaves_layer
execute positioned ~ ~-5 ~ run function tree_cut:break_leaves_layer
execute positioned ~ ~-5 ~5 run function tree_cut:break_leaves_layer
execute positioned ~ ~ ~-5 run function tree_cut:break_leaves_layer
execute positioned ~ ~ ~ run function tree_cut:break_leaves_layer
execute positioned ~ ~ ~5 run function tree_cut:break_leaves_layer
execute positioned ~ ~5 ~-5 run function tree_cut:break_leaves_layer
execute positioned ~ ~5 ~ run function tree_cut:break_leaves_layer
execute positioned ~ ~5 ~5 run function tree_cut:break_leaves_layer

execute positioned ~5 ~-5 ~-5 run function tree_cut:break_leaves_layer
execute positioned ~5 ~-5 ~ run function tree_cut:break_leaves_layer
execute positioned ~5 ~-5 ~5 run function tree_cut:break_leaves_layer
execute positioned ~5 ~ ~-5 run function tree_cut:break_leaves_layer
execute positioned ~5 ~ ~ run function tree_cut:break_leaves_layer
execute positioned ~5 ~ ~5 run function tree_cut:break_leaves_layer
execute positioned ~5 ~5 ~-5 run function tree_cut:break_leaves_layer
execute positioned ~5 ~5 ~ run function tree_cut:break_leaves_layer
execute positioned ~5 ~5 ~5 run function tree_cut:break_leaves_layer
