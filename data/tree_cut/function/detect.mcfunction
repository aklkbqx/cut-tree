execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:oak_log"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"oak_log",leaves:"oak_leaves"}
execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:spruce_log"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"spruce_log",leaves:"spruce_leaves"}
execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:birch_log"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"birch_log",leaves:"birch_leaves"}
execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:jungle_log"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"jungle_log",leaves:"jungle_leaves"}
execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:acacia_log"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"acacia_log",leaves:"acacia_leaves"}
execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:dark_oak_log"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"dark_oak_log",leaves:"dark_oak_leaves"}
execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:mangrove_log"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"mangrove_log",leaves:"mangrove_leaves"}
execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:cherry_log"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"cherry_log",leaves:"cherry_leaves"}
execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:crimson_stem"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"crimson_stem",leaves:"nether_wart_block"}
execute at @s at @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:warped_stem"},Age:0s},distance=..10] align xyz positioned ~0.5 ~0.5 ~0.5 run function tree_cut:start_cut {block:"warped_stem",leaves:"warped_wart_block"}

scoreboard players set @s ct.mined_oak 0
scoreboard players set @s ct.mined_spruce 0
scoreboard players set @s ct.mined_birch 0
scoreboard players set @s ct.mined_jungle 0
scoreboard players set @s ct.mined_acacia 0
scoreboard players set @s ct.mined_dark_oak 0
scoreboard players set @s ct.mined_mangrove 0
scoreboard players set @s ct.mined_cherry 0
scoreboard players set @s ct.mined_crimson 0
scoreboard players set @s ct.mined_warped 0
