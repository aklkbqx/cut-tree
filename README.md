# 🪓 Tree Cut Datapack v2.0

🌲Cut down entire trees (just wood, you know 🙂) in one go!

For Minecraft Java Edition **1.21+** (pack_format 48-88)

---

## 🆕 New Update v2.0

### ✨ New Feature:
- 🪵 **All logs gathered in one place** - Collect logs at player position or tree trunk (configurable)

---

## ✨ All features

- 🪓 **Easy to use** - Simply use your axe to cut a tree, and the entire tree will automatically break.
- 🌳 **Supports all types of wood** - Oak, Spruce, Birch, Jungle (2x2!), Acacia, Dark Oak (2x2!), Mangrove, Cherry, Crimson, Warped
- 🛡️ **100% Safe** - Real tree inspection system with 3 criteria to prevent damage to houses/structures
- 🎯 **Accurate block count** - Displays the actual number of blocks destroyed every time
- 🔨 **Axe saver** - Reduces durability by only 10% of the number of trees
- 🪵 **Item gathering** - All logs automatically gather at your position or tree trunk (NEW!)
- ⚙️ **Customizable** - Set debug mode, maximum size, durability, leaf destruction, and gather location
- 🍃 **Automatic leaf destruction** - Turn on/off as desired (default: off)
- ⚡ **High performance** - Tree size limit + recursive scanning system
- 🎨 **Beautiful UI/UX** - Debug messages with emoji and colors, easy to read

---

## 📥 How to install

### Install Datapack

1. Download this datapack
2. paste folder `tree-cut` in:
    
    ```
    .minecraft/saves/[your world name]/datapacks/
    ```
    
3. Open minecraft and type the command `/reload`
4. finish! 🎉

---

## 🎮 How to use

1. **Hold an axe** of any type (Wood, Stone, Iron, Gold, Diamond, Netherite)
2. **Mine a wooden block** (log or stem) from a tree.
3. **The entire tree will automatically break** along with the leaves!

> Note: You must hold an axe and mine a wooden block (not using commands).
> 

---

## ⚙️ Setting

### basic setting

edit file `data/tree_cut/function/config.mcfunction` or use command in minecraft:

```
# close debug messages (recommend for play normal)
scoreboard players set #config.debug ct.count 0

# Adjust the maximum tree size (default: 5000 block)
scoreboard players set #config.max_logs ct.count 5000

# Turn on/off automatic leaf destruction (0=off, 1=on)
scoreboard players set #config.break_leaves ct.count 1

# Toggles the durability of the axe on/off (0=off, 1=on, default: 1)
# Note: If open, only 10% discount will be given from the amount of wood cut.
scoreboard players set #config.damage_axe ct.count 1

# Gather all logs in one place (0=off, 1=player position, 2=tree trunk)
scoreboard players set #config.gather_location ct.count 1

```

Don't forget to `/reload` after editing!

### Example settings

**For Survival gameplay:**

```
scoreboard players set #config.debug ct.count 0
scoreboard players set #config.break_leaves ct.count 1
scoreboard players set #config.max_logs ct.count 200
```

**For very large trees:**

```
scoreboard players set #config.debug ct.count 0
scoreboard players set #config.max_logs ct.count 5000
scoreboard players set #config.break_leaves ct.count 1
```

**For developers/testers:**

```
scoreboard players set #config.debug ct.count 1
scoreboard players set #config.max_logs ct.count 100
scoreboard players set #config.break_leaves ct.count 1
```

---

## 🔧 Config Options

| Option | Default | Description |
| --- | --- | --- |
| `#config.debug` | `1` | Display debug message (0=off, 1=on) |
| `#config.max_logs` | `5000` | Maximum number of wooden blocks that can be cut at one time |
| `#config.break_leaves` | `0` | Automatically destroy leaves (0=off, 1=on) |
| `#config.damage_axe` | `1` | Reduces the durability of the axe (0=off, 1=on) - only 10% off! |
| `#config.gather_location` | `1` | Gather logs in one place (0=off, 1=player position, 2=tree trunk) |

---

## ❓ Frequently Asked Questions (FAQ)

### Q: Why doesn't the tree break?

A: Check that:

- You're holding an axe (not another tool)
- You're digging up a log/stem, not stripped wood or planks
- **The tree must meet one of the following checks**:
1. Height >= 2 blocks and have >= 3 leaves (normal trees)
2. Leaves >= 10 blocks (large trees)
3. Height >= 5 blocks and have >= 2 leaves (tall trees)
- The tree does not exceed the specified size (default: 5000 blocks)
- **Enable debug mode** to view detailed check information

### Q: Can this be used with wooden structures?

A: **Most don't!** - The datapack has checks to verify that the tree is a real tree:

- Must have the appropriate height and leaves (See criteria above.)
- Structures with no leaves or only 1-2 blocks high → Safe and cannot be destroyed
- If accidentally destroyed, adjust the config or lower the max_logs value.

### Q: Does the axe cost money?

A: **Only 10% of the cost is lost!** (v1.1)

- Cut 100 blocks of wood → The axe costs only **10 points**
- Netherite axes (2031 durability) can cut **~20,000 blocks**!
- Disable: `/scoreboard players set #config.damage_axe ct.count 0`

### Q: Does it support large jungle trees (2x2)?

A: **Yes!** The datapack will automatically detect and cut down 2x2 trees (Jungle and Dark Oak).

### Q: Can I gather all logs in one place?

A: **Yes! (v2.0)** - Configure with `#config.gather_location`:
- `0` = Off (logs drop normally)
- `1` = Player position (logs teleport to you) - **Recommended!**
- `2` = Tree trunk (logs gather at the base of the tree)

Example: `/scoreboard players set #config.gather_location ct.count 1`

### Q: Does it work in multiplayer?

A: Yes! It works in both single-player and multiplayer.

### Q: Does it support other versions?

A: This datapack is designed for Minecraft 1.21+ (pack_format 48-88, which covers 1.21.x to 1.21.10+).

### Q: What are the sounds when chopping down trees?

A: The datapack automatically uses the vanilla sounds:

- Use the `minecraft:entity.player.attack.strong` sound (the standard strike sound).
- Need a custom sound? See **`SOUND_INFO.md`** (a separate Resource Pack is required).
- Recommended: Edit `break_tree.mcfunction` to use the `minecraft:block.anvil.land` sound instead.

---

## 🐛 if found a problem?

1. open debug mode: `scoreboard players set #config.debug ct.count 1`
2. try `/reload`
3. check console/log find the warning message
4. Report the problem with details

---

## 📝 Credit and version

- Developer: Akalak Kruaboon
- **Instagram**: [@akl.kbqx](https://instagram.com/akl.kbqx)
- **GitHub**: [@aklkbqx](https://github.com/aklkbqx)
- Version: 2.0
- **Pack Format**: 48-88 (MC 1.21+)
- last update: 17 October 2025

---

## 📄 License

This Datapack is free for personal use. Do not sell.

---

**Have fun cutting wood! 🌲⚡**