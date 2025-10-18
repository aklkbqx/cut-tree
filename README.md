# 🪓 Tree Cut Datapack v2.0

🌲 Cut down entire trees in one go! All logs automatically gather at the block you mined.

For Minecraft Java Edition **1.21+** (pack_format 48-88)

---

## 🆕 New Update v2.0

### ✨ Major Features:
- 🎯 **Smart Gathering System** - All logs automatically teleport to the exact block you mined (not your player position!)
- ⏱️ **PickupDelay Protection** - Logs wait 1 second (20 ticks) before you can pick them up, preventing instant inventory clutter
- 📍 **Precise Position Display** - Debug mode shows exactly where logs are gathered with coordinates
- 🔄 **Improved Item Detection** - Uses tag-based system to track logs from the tree you cut
- 🎨 **Enhanced Debug Messages** - Beautiful color-coded messages showing item count and positions

---

## ✨ All features

- 🪓 **Easy to use** - Simply use your axe to cut a tree, and the entire tree will automatically break
- 🌳 **Supports all wood types** - Oak, Spruce, Birch, Jungle (2x2!), Acacia, Dark Oak (2x2!), Mangrove, Cherry, Crimson, Warped
- 🛡️ **100% Safe** - Advanced tree validation system with 3 criteria to prevent damage to houses/structures
- 🎯 **Accurate counting** - Displays the exact number of blocks destroyed every time
- 🔨 **Axe durability** - Reduces durability by only 10% of logs cut (configurable)
- 🪵 **Smart Gathering** - All logs teleport to the exact block you mined with 1-second pickup delay (NEW!)
- ⚙️ **Highly Customizable** - Configure debug mode, max size, durability reduction, and gathering behavior
- 🍃 **Natural leaves decay** - Leaves decay naturally (Minecraft's built-in system, default: off for manual breaking)
- ⚡ **High Performance** - Optimized with tree size limits and efficient recursive scanning
- 🎨 **Beautiful UI/UX** - Color-coded debug messages with emojis showing positions and item counts

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
# Note: If enabled, reduces durability by only 10% of the logs cut.
scoreboard players set #config.damage_axe ct.count 1

# Gather all logs at mined block (0=off, 3=mined block position - RECOMMENDED!)
# Note: All logs teleport to the exact block you mined with 1-second pickup delay
scoreboard players set #config.gather_location ct.count 3

```

Don't forget to `/reload` after editing!

### Example settings

**For Survival gameplay (Recommended):**

```
scoreboard players set #config.debug ct.count 0
scoreboard players set #config.gather_location ct.count 3
scoreboard players set #config.max_logs ct.count 200
scoreboard players set #config.damage_axe ct.count 1
```

**For very large trees:**

```
scoreboard players set #config.debug ct.count 0
scoreboard players set #config.max_logs ct.count 5000
scoreboard players set #config.gather_location ct.count 3
scoreboard players set #config.damage_axe ct.count 1
```

**For developers/testers:**

```
scoreboard players set #config.debug ct.count 2
scoreboard players set #config.max_logs ct.count 100
scoreboard players set #config.gather_location ct.count 3
```

---

## 🔧 Config Options

| Option | Default | Description |
| --- | --- | --- |
| `#config.debug` | `2` | Display debug messages (0=off, 1=on, 2=verbose) |
| `#config.max_logs` | `5000` | Maximum number of wooden blocks that can be cut at one time |
| `#config.break_leaves` | `0` | Automatically destroy leaves (0=off, 1=on) - Default: off (natural decay) |
| `#config.damage_axe` | `1` | Reduces axe durability (0=off, 1=on) - Only 10% of logs cut! |
| `#config.gather_location` | `3` | Gather logs at mined block (0=off, 3=mined position) - PickupDelay: 1 second |

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

### Q: How does the gathering system work?

A: **Smart Gathering (v2.0)** - All logs automatically teleport to the exact block you mined!

**Features:**
- 📍 **Precise Location** - Logs gather at the exact block you broke (not your player position)
- ⏱️ **PickupDelay** - Logs wait 1 second (20 ticks) before you can pick them up
- 🎯 **No Inventory Clutter** - Logs don't instantly fill your inventory
- 🔄 **Smart Tagging** - Only logs from the tree you cut are gathered

**Configuration:**
```bash
# Enable gathering (recommended!)
/scoreboard players set #config.gather_location ct.count 3

# Disable gathering (logs drop normally)
/scoreboard players set #config.gather_location ct.count 0
```

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
- **Version**: 2.0
- **Pack Format**: 48-88 (MC 1.21+)
- **Last Update**: January 12, 2025
- **Features**: Smart Gathering System, PickupDelay Protection, Precise Position Display

---

## 📄 License

This Datapack is free for personal use. Do not sell.

---

**Have fun cutting wood! 🌲⚡**