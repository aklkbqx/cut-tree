# 🪓 Cut Tree Datapack v1.1

**ตัดไม้ทั้งต้นได้ในคลิกเดียว! พร้อมระบบนับบล็อกที่แม่นยำ และประหยัดขวาน**

สำหรับ Minecraft Java Edition **1.21+** (pack_format 48-88)

---

## 🆕 อัปเดตใหม่ v1.1 (จาก v1.0)

### ✨ ฟีเจอร์ใหม่:
- 🎯 **ระบบนับบล็อกแม่นยำ 100%** - นับทุกบล็อกที่ทำลาย รวมบล็อกแรกที่ผู้เล่นตัด
- 📊 **แสดงจำนวนบล็อกทุกครั้ง** - ทั้ง debug mode และ normal mode
- 🔨 **ระบบลด Durability 10%** - ขวานเสียเพียง 10% จากจำนวนไม้ (ประหยัด 90%!)
- 🎨 **Debug Messages สวยงาม** - ใช้ emoji, สี, และจัดรูปแบบชัดเจน
- ✅ **การตรวจสอบที่เข้มงวด** - ตรวจสอบว่าเป็นไม้จริงก่อนนับและทำลายทุกครั้ง
- 🌲 **Particle Effects** - แสดง particle ตามชนิดไม้ที่ทำลาย

### 🔧 การปรับปรุง:
- เพิ่มความแม่นยำในการสแกนและนับบล็อก
- ลด durability เพียง 10% แทนที่จะเป็น 100% (ตัดได้นานขึ้น 10 เท่า!)
- Debug mode แสดงข้อมูลครบถ้วนพร้อมสรุปสวยงาม
- Normal mode แสดงจำนวนบล็อกที่ตัดได้แบบกระชับ
- ปรับปรุง UI/UX ของข้อความแจ้งเตือน

### 📈 ตัวเลขเปรียบเทียบ:
**Durability System (10% vs 100%):**
- ตัดไม้ 100 บล็อก: เสีย **10 จุด** (แทนที่จะเป็น 100 จุด!)
- ขวาน Netherite: ตัดได้ **~20,000 บล็อก** (แทนที่จะเป็น ~2,000 บล็อก!)

---

## ✨ ฟีเจอร์ทั้งหมด

- 🪓 **ใช้งานง่าย** - แค่ใช้ขวานตัดไม้ ต้นไม้ทั้งต้นจะหักอัตโนมัติ
- 🌳 **รองรับไม้ทุกชนิด** - Oak, Spruce, Birch, Jungle (2x2!), Acacia, Dark Oak (2x2!), Mangrove, Cherry, Crimson, Warped
- 🛡️ **ปลอดภัย 100%** - ระบบตรวจสอบต้นไม้จริง 3 เกณฑ์ ป้องกันทำลายบ้าน/โครงสร้าง
- 🎯 **นับบล็อกแม่นยำ** - แสดงจำนวนบล็อกที่ทำลายจริงทุกครั้ง
- 🔨 **ประหยัดขวาน** - ลด durability เพียง 10% จากจำนวนไม้
- ⚙️ **ปรับแต่งได้** - ตั้งค่า debug mode, ขนาดสูงสุด, durability, และทำลายใบไม้
- 🍃 **ทำลายใบไม้อัตโนมัติ** - เปิด/ปิดได้ตามต้องการ (default: ปิด)
- ⚡ **ประสิทธิภาพดี** - จำกัดขนาดต้นไม้ + ระบบ recursive scanning
- 🎨 **UI/UX สวยงาม** - Debug messages มี emoji และสีสัน อ่านง่าย

---

## 📥 การติดตั้ง

### การติดตั้ง Datapack
1. ดาวน์โหลด datapack นี้
2. วางโฟลเดอร์ `cut-tree` ใน:
   ```
   .minecraft/saves/[ชื่อ world ของคุณ]/datapacks/
   ```
3. เปิดเกมแล้วใช้คำสั่ง `/reload`
4. เสร็จสิ้น! 🎉

### 🔊 การตั้งค่าเสียง (Optional)
Datapack ใช้เสียง vanilla โดยอัตโนมัติ หากต้องการเสียง custom:
- **หมายเหตุ:** Custom sound ต้องอยู่ใน Resource Pack ไม่ใช่ Datapack
- ดูวิธีตั้งค่าใน **`SOUND_INFO.md`**
- แนะนำ: ใช้เสียง vanilla (`minecraft:block.anvil.land`) เพราะทำงานทันที

---

## 🎮 วิธีใช้งาน

1. **ถือขวาน** ชนิดใดก็ได้ (ไม้, หิน, เหล็ก, ทอง, เพชร, Netherite)
2. **ขุดบล็อกไม้** (log หรือ stem) บนต้นไม้
3. **ต้นไม้ทั้งต้นจะหัก** พร้อมกับใบไม้โดยอัตโนมัติ!

> **หมายเหตุ:** ต้องถือขวานและขุดบล็อกไม้เท่านั้น (ไม่ใช่ใช้ command)

---

## ⚙️ การตั้งค่า

### ตั้งค่าพื้นฐาน

แก้ไขไฟล์ `data/cut_tree/function/config.mcfunction` หรือใช้คำสั่งในเกม:

```mcfunction
# ปิด debug messages (แนะนำสำหรับการเล่นปกติ)
scoreboard players set #config.debug ct.count 0

# ปรับขนาดต้นไม้สูงสุด (default: 5000 บล็อก)
scoreboard players set #config.max_logs ct.count 5000

# เปิด/ปิดทำลายใบไม้อัตโนมัติ (0=ปิด, 1=เปิด)
scoreboard players set #config.break_leaves ct.count 1

# เปิด/ปิดลด durability ของขวาน (0=ปิด, 1=เปิด, default: 1)
# หมายเหตุ: ถ้าเปิด จะลดเพียง 10% จากจำนวนไม้ที่ตัด
scoreboard players set #config.damage_axe ct.count 1
```

**อย่าลืม `/reload` หลังแก้ไข!**

### ตัวอย่างการตั้งค่า

**สำหรับ Survival ปกติ:**
```mcfunction
scoreboard players set #config.debug ct.count 0
scoreboard players set #config.break_leaves ct.count 1
scoreboard players set #config.max_logs ct.count 200
```

**สำหรับต้นไม้ใหญ่มาก:**
```mcfunction
scoreboard players set #config.debug ct.count 0
scoreboard players set #config.max_logs ct.count 5000
scoreboard players set #config.break_leaves ct.count 1
```

**สำหรับนักพัฒนา/ทดสอบ:**
```mcfunction
scoreboard players set #config.debug ct.count 1
scoreboard players set #config.max_logs ct.count 100
scoreboard players set #config.break_leaves ct.count 1
```

---

## 🔧 Config Options

| ตัวเลือก | ค่าเริ่มต้น | คำอธิบาย |
|---------|---------|--------|
| `#config.debug` | `1` | แสดงข้อความ debug (0=ปิด, 1=เปิด) |
| `#config.max_logs` | `5000` | จำนวนบล็อกไม้สูงสุดที่สามารถตัดได้ครั้งเดียว |
| `#config.break_leaves` | `0` | ทำลายใบไม้อัตโนมัติ (0=ปิด, 1=เปิด) |
| `#config.damage_axe` | `1` | ลด durability ของขวาน (0=ปิด, 1=เปิด) - **ลดเพียง 10%!** |

---

## ❓ คำถามที่พบบ่อย (FAQ)

### Q: ทำไมต้นไม้ไม่หัก?
A: ตรวจสอบว่า:
- ถือขวานอยู่ (ไม่ใช่เครื่องมืออื่น)
- ขุดบล็อกไม้ (log/stem) ไม่ใช่ไม้ที่ถูก strip หรือ planks
- **ต้นไม้ต้องผ่านเกณฑ์ตรวจสอบอย่างใดอย่างหนึ่ง**:
  1. สูง >= 2 บล็อก และมีใบไม้ >= 3 บล็อก (ต้นไม้ทั่วไป)
  2. มีใบไม้ >= 10 บล็อก (ต้นใหญ่)
  3. สูง >= 5 บล็อก และมีใบไม้ >= 2 บล็อก (ต้นสูง)
- ต้นไม้ไม่เกินขนาดที่กำหนด (default: 5000 บล็อก)
- **เปิด debug mode** เพื่อดูข้อมูลการตรวจสอบละเอียด

### Q: สามารถใช้กับโครงสร้างที่สร้างจากไม้ได้ไหม?
A: **ส่วนใหญ่ไม่ได้!** - datapack มีระบบตรวจสอบเพื่อยืนยันว่าเป็นต้นไม้จริง:
- ต้องมีความสูงและใบไม้เหมาะสม (ดูเกณฑ์ด้านบน)
- โครงสร้างที่ไม่มีใบหรือสูงแค่ 1-2 บล็อก → ปลอดภัย ไม่ถูกทำลาย
- ถ้าเกิดทำลายโดยไม่ตั้งใจ ให้ปรับ config หรือลดค่า max_logs

### Q: ขวานเสียหรือไม่?
A: **เสีย แต่เพียง 10% เท่านั้น!** (v1.1)
- ตัดไม้ 100 บล็อก → ขวานเสียเพียง **10 จุด**
- ขวาน Netherite (2031 durability) ตัดได้ **~20,000 บล็อก**!
- ปิดระบบได้: `/scoreboard players set #config.damage_axe ct.count 0`

### Q: รองรับต้น Jungle ขนาดใหญ่ (2x2) หรือไม่?
A: **รองรับ!** datapack จะตรวจจับและตัดต้นไม้ขนาด 2x2 (Jungle และ Dark Oak) ได้อัตโนมัติ

### Q: ทำงานกับ Multiplayer ได้ไหม?
A: ได้! ใช้งานได้ทั้ง Singleplayer และ Multiplayer

### Q: รองรับเวอร์ชันอื่นไหม?
A: datapack นี้ออกแบบสำหรับ Minecraft 1.21+ (pack_format 48-88 ซึ่งครอบคลุม 1.21.x ถึง 1.21.10+)

### Q: เสียงตอนตัดต้นไม้?
A: Datapack ใช้เสียง vanilla โดยอัตโนมัติ:
- ใช้เสียง `minecraft:entity.player.attack.strong` (เสียงฟาดมาตรฐาน)
- ต้องการเสียง custom? ดู **`SOUND_INFO.md`** (ต้องสร้าง Resource Pack แยก)
- แนะนำ: แก้ไข `break_tree.mcfunction` ใช้เสียง `minecraft:block.anvil.land` แทน

---

## 🐛 เจอปัญหา?

หากเจอบั๊กหรือปัญหา:
1. เปิด debug mode: `scoreboard players set #config.debug ct.count 1`
2. ลอง `/reload`
3. ตรวจสอบ console/log หาข้อความแจ้งเตือน
4. รายงานปัญหาพร้อมรายละเอียด

---

## 📝 เครดิตและเวอร์ชัน

- **ผู้พัฒนา**: Akalak Kruaboon
- **Instagram**: [@akl.kbqx](https://instagram.com/akl.kbqx)
- **GitHub**: [@aklkbqx](https://github.com/aklkbqx)
- **เวอร์ชัน**: 1.1
- **Pack Format**: 48-88 (MC 1.21+)
- **อัพเดตล่าสุด**: ตุลาคม 2025

### 🔄 Changelog

**v1.1** (ล่าสุด)
- ✅ เพิ่มระบบนับบล็อกแม่นยำ 100% (รวมบล็อกแรกที่ผู้เล่นตัด)
- ✅ เพิ่มระบบลด durability 10% (ประหยัดขวาน 90%)
- ✅ แสดงจำนวนบล็อกที่ตัดได้ทั้ง debug และ normal mode
- ✅ ปรับปรุง debug messages ให้สวยงามและอ่านง่าย
- ✅ เพิ่ม particle effects ตามชนิดไม้

**v2.0-2.2**
- ปรับปรุงความแม่นยำในการตรวจสอบบล็อกไม้
- เพิ่มความชัดเจนในการแสดงผล

**v1.0-1.1**
- เวอร์ชันแรก
- ฟีเจอร์พื้นฐาน: ตัดต้นไม้อัตโนมัติ

---

## 📄 ใบอนุญาต

Datapack นี้ฟรีสำหรับใช้ส่วนตัว ห้ามนำไปจำหน่าย

---

**สนุกกับการตัดไม้! 🌲⚡**
