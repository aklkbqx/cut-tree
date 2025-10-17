# 🪓 Tree Cut Datapack v1.0

**ตัดไม้ทั้งต้นได้ในคลิกเดียว! ขวานไม่เสีย ตัดได้ไม่จำกัด**

สำหรับ Minecraft Java Edition **1.21+** (pack_format 48-88)

---

## ✨ ฟีเจอร์ทั้งหมด

- 🪓 **ใช้งานง่าย** - แค่ใช้ขวานตัดไม้ ต้นไม้ทั้งต้นจะหักอัตโนมัติ
- 🌳 **รองรับไม้ทุกชนิด** - Oak, Spruce, Birch, Jungle (2x2!), Acacia, Dark Oak (2x2!), Mangrove, Cherry, Crimson, Warped
- 🛡️ **ปลอดภัย 100%** - ระบบตรวจสอบต้นไม้จริง 3 เกณฑ์ ป้องกันทำลายบ้าน/โครงสร้าง
- ♾️ **ขวานไม่เสีย** - ไม่มีการลด durability ตัดได้ไม่จำกัด!
- ⚙️ **ปรับแต่งได้** - ตั้งค่า debug mode, ขนาดสูงสุด, และทำลายใบไม้
- 🍃 **ทำลายใบไม้อัตโนมัติ** - เปิด/ปิดได้ตามต้องการ
- ⚡ **ประสิทธิภาพดี** - จำกัดขนาดต้นไม้สูงสุด 5000 บล็อก
- 🎨 **Debug Messages สวยงาม** - แสดงข้อมูลครบถ้วนเมื่อเปิด debug mode

---

## 📥 การติดตั้ง

### การติดตั้ง Datapack
1. ดาวน์โหลด datapack นี้
2. วางโฟลเดอร์ `tree-cut-v1.0` ใน:
   ```
   .minecraft/saves/[ชื่อ world ของคุณ]/datapacks/
   ```
3. เปิดเกมแล้วใช้คำสั่ง `/reload`
4. เสร็จสิ้น! 🎉

---

## 🎮 วิธีใช้งาน

1. **ถือขวาน** ชนิดใดก็ได้ (ไม้, หิน, เหล็ก, ทอง, เพชร, Netherite)
2. **ขุดบล็อกไม้** (log หรือ stem) บนต้นไม้
3. **ต้นไม้ทั้งต้นจะหัก** พร้อมกับใบไม้โดยอัตโนมัติ!

> **หมายเหตุ:** ต้องถือขวานและขุดบล็อกไม้เท่านั้น (ไม่ใช่ใช้ command)

---

## ⚙️ การตั้งค่า

### ตั้งค่าพื้นฐาน

แก้ไขไฟล์ `data/tree_cut/function/config.mcfunction` หรือใช้คำสั่งในเกม:

```mcfunction
# ปิด debug messages (แนะนำสำหรับการเล่นปกติ)
scoreboard players set #config.debug ct.count 0

# ปรับขนาดต้นไม้สูงสุด (default: 5000 บล็อก)
scoreboard players set #config.max_logs ct.count 5000

# เปิด/ปิดทำลายใบไม้อัตโนมัติ (0=ปิด, 1=เปิด)
scoreboard players set #config.break_leaves ct.count 1
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
| `#config.debug` | `0` | แสดงข้อความ debug (0=ปิด, 1=เปิด) |
| `#config.max_logs` | `5000` | จำนวนบล็อกไม้สูงสุดที่สามารถตัดได้ครั้งเดียว |
| `#config.break_leaves` | `1` | ทำลายใบไม้อัตโนมัติ (0=ปิด, 1=เปิด) |

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
- ต้นไม้ไม่เกินขนาดที่กำหนด (default: 150 บล็อก)
- **Debug mode เปิดอยู่แล้ว** - จะเห็นข้อมูลการตรวจสอบทุกครั้งที่ตัดไม้

### Q: สามารถใช้กับโครงสร้างที่สร้างจากไม้ได้ไหม?
A: **ส่วนใหญ่ไม่ได้!** - datapack มีระบบตรวจสอบเพื่อยืนยันว่าเป็นต้นไม้จริง:
- ต้องมีความสูงและใบไม้เหมาะสม (ดูเกณฑ์ด้านบน)
- โครงสร้างที่ไม่มีใบหรือสูงแค่ 1-2 บล็อก → ปลอดภัย ไม่ถูกทำลาย
- ถ้าเกิดทำลายโดยไม่ตั้งใจ ให้ปรับ config หรือลดค่า max_logs

### Q: ขวานเสียหรือไม่?
A: **ไม่เสีย!** v1.0 ไม่มีระบบลด durability ตัดได้ไม่จำกัด! (ถ้าต้องการให้ขวานเสีย ใช้ v1.1 แทน)

### Q: รองรับต้น Jungle ขนาดใหญ่ (2x2) หรือไม่?
A: **รองรับ!** datapack จะตรวจจับและตัดต้นไม้ขนาด 2x2 (Jungle และ Dark Oak) ได้อัตโนมัติ

### Q: ทำงานกับ Multiplayer ได้ไหม?
A: ได้! ใช้งานได้ทั้ง Singleplayer และ Multiplayer

### Q: รองรับเวอร์ชันอื่นไหม?
A: datapack นี้ออกแบบสำหรับ Minecraft 1.21+ (pack_format 48-88 ซึ่งครอบคลุม 1.21.x ถึง 1.21.10+)

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
- **เวอร์ชัน**: 1.0
- **Pack Format**: 48-88 (MC 1.21+)
- **อัพเดตล่าสุด**: ตุลาคม 2025

### 🔄 Changelog

**v1.0** (เวอร์ชันนี้)
- ✅ ตัดไม้ทั้งต้นอัตโนมัติ
- ✅ รองรับไม้ 10 ชนิด + ต้น 2x2
- ✅ ระบบตรวจสอบต้นไม้จริง 3 เกณฑ์
- ✅ ทำลายใบไม้อัตโนมัติ (เปิด/ปิดได้)
- ✅ **ขวานไม่เสีย** - ตัดได้ไม่จำกัด
- ✅ Debug messages สวยงาม
- ✅ Config: debug, max_logs (5000), break_leaves

---

## 📄 ใบอนุญาต

Datapack นี้ฟรีสำหรับใช้ส่วนตัว ห้ามนำไปจำหน่าย

---

**สนุกกับการตัดไม้! 🌲⚡**
