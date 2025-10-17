# Macro function สำหรับเซ็ตค่า damage
# รับ parameter: damage (int)

$item modify entity @s weapon.mainhand [{function:"set_components",components:{"minecraft:damage":$(damage)}}]
