.include "macros.inc"
.file "auto_fn_804FB28C_text"

# 0x80006918 - 0x80006920
.section extab, "a"
.balign 4

.obj "@etb_80006918", local
.hidden "@etb_80006918"
	.4byte 0x100A0000
	.4byte 0x00000000
.endobj "@etb_80006918"

# 0x80006D7C - 0x80006D88
.section extabindex, "a"
.balign 4

.obj "@eti_80006D7C", local
.hidden "@eti_80006D7C"
	.4byte fn_804FB28C
	.4byte 0x00000130
	.4byte "@etb_80006918"
.endobj "@eti_80006D7C"

# 0x804FB28C - 0x804FB3BC
.text
.balign 4

.fn fn_804FB28C, global
/* 804FB28C 004F6AAC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804FB290 004F6AB0  7C 08 02 A6 */	mflr r0
/* 804FB294 004F6AB4  C0 02 09 98 */	lfs f0, lbl_80675E78@sda21(r0)
/* 804FB298 004F6AB8  38 AD AB C8 */	li r5, lbl_8066D3C8@sda21
/* 804FB29C 004F6ABC  90 01 00 14 */	stw r0, 0x14(r1)
/* 804FB2A0 004F6AC0  38 6D AB C8 */	li r3, lbl_8066D3C8@sda21
/* 804FB2A4 004F6AC4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804FB2A8 004F6AC8  3F E0 80 01 */	lis r31, fn_80009A74@ha
/* 804FB2AC 004F6ACC  38 9F 9A 74 */	addi r4, r31, fn_80009A74@l
/* 804FB2B0 004F6AD0  93 C1 00 08 */	stw r30, 0x8(r1)
/* 804FB2B4 004F6AD4  3F C0 80 64 */	lis r30, lbl_80640DB0@ha
/* 804FB2B8 004F6AD8  3B DE 0D B0 */	addi r30, r30, lbl_80640DB0@l
/* 804FB2BC 004F6ADC  D0 05 00 04 */	stfs f0, 0x4(r5)
/* 804FB2C0 004F6AE0  38 BE 00 00 */	addi r5, r30, 0x0
/* 804FB2C4 004F6AE4  D0 0D AB C8 */	stfs f0, lbl_8066D3C8@sda21(r0)
/* 804FB2C8 004F6AE8  4B C0 89 91 */	bl __register_global_object
/* 804FB2CC 004F6AEC  C0 22 09 9C */	lfs f1, lbl_80675E7C@sda21(r0)
/* 804FB2D0 004F6AF0  38 CD AB D0 */	li r6, lbl_8066D3D0@sda21
/* 804FB2D4 004F6AF4  C0 02 09 98 */	lfs f0, lbl_80675E78@sda21(r0)
/* 804FB2D8 004F6AF8  38 9F 9A 74 */	addi r4, r31, fn_80009A74@l
/* 804FB2DC 004F6AFC  D0 2D AB D0 */	stfs f1, lbl_8066D3D0@sda21(r0)
/* 804FB2E0 004F6B00  38 BE 00 0C */	addi r5, r30, 0xc
/* 804FB2E4 004F6B04  38 6D AB D0 */	li r3, lbl_8066D3D0@sda21
/* 804FB2E8 004F6B08  D0 06 00 04 */	stfs f0, 0x4(r6)
/* 804FB2EC 004F6B0C  4B C0 89 6D */	bl __register_global_object
/* 804FB2F0 004F6B10  C0 22 09 98 */	lfs f1, lbl_80675E78@sda21(r0)
/* 804FB2F4 004F6B14  38 CD AB D8 */	li r6, lbl_8066D3D8@sda21
/* 804FB2F8 004F6B18  C0 02 09 9C */	lfs f0, lbl_80675E7C@sda21(r0)
/* 804FB2FC 004F6B1C  38 9F 9A 74 */	addi r4, r31, fn_80009A74@l
/* 804FB300 004F6B20  D0 2D AB D8 */	stfs f1, lbl_8066D3D8@sda21(r0)
/* 804FB304 004F6B24  38 BE 00 18 */	addi r5, r30, 0x18
/* 804FB308 004F6B28  38 6D AB D8 */	li r3, lbl_8066D3D8@sda21
/* 804FB30C 004F6B2C  D0 06 00 04 */	stfs f0, 0x4(r6)
/* 804FB310 004F6B30  4B C0 89 49 */	bl __register_global_object
/* 804FB314 004F6B34  C0 02 09 98 */	lfs f0, lbl_80675E78@sda21(r0)
/* 804FB318 004F6B38  38 7E 00 30 */	addi r3, r30, 0x30
/* 804FB31C 004F6B3C  3F E0 80 01 */	lis r31, fn_8000A4F4@ha
/* 804FB320 004F6B40  38 BE 00 24 */	addi r5, r30, 0x24
/* 804FB324 004F6B44  D0 1E 00 30 */	stfs f0, 0x30(r30)
/* 804FB328 004F6B48  38 9F A4 F4 */	addi r4, r31, fn_8000A4F4@l
/* 804FB32C 004F6B4C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804FB330 004F6B50  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804FB334 004F6B54  4B C0 89 25 */	bl __register_global_object
/* 804FB338 004F6B58  C0 22 09 9C */	lfs f1, lbl_80675E7C@sda21(r0)
/* 804FB33C 004F6B5C  38 7E 00 48 */	addi r3, r30, 0x48
/* 804FB340 004F6B60  C0 02 09 98 */	lfs f0, lbl_80675E78@sda21(r0)
/* 804FB344 004F6B64  38 9F A4 F4 */	addi r4, r31, fn_8000A4F4@l
/* 804FB348 004F6B68  D0 3E 00 48 */	stfs f1, 0x48(r30)
/* 804FB34C 004F6B6C  38 BE 00 3C */	addi r5, r30, 0x3c
/* 804FB350 004F6B70  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804FB354 004F6B74  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804FB358 004F6B78  4B C0 89 01 */	bl __register_global_object
/* 804FB35C 004F6B7C  C0 22 09 98 */	lfs f1, lbl_80675E78@sda21(r0)
/* 804FB360 004F6B80  38 7E 00 60 */	addi r3, r30, 0x60
/* 804FB364 004F6B84  C0 02 09 9C */	lfs f0, lbl_80675E7C@sda21(r0)
/* 804FB368 004F6B88  38 9F A4 F4 */	addi r4, r31, fn_8000A4F4@l
/* 804FB36C 004F6B8C  D0 3E 00 60 */	stfs f1, 0x60(r30)
/* 804FB370 004F6B90  38 BE 00 54 */	addi r5, r30, 0x54
/* 804FB374 004F6B94  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804FB378 004F6B98  D0 23 00 08 */	stfs f1, 0x8(r3)
/* 804FB37C 004F6B9C  4B C0 88 DD */	bl __register_global_object
/* 804FB380 004F6BA0  C0 22 09 98 */	lfs f1, lbl_80675E78@sda21(r0)
/* 804FB384 004F6BA4  38 7E 00 78 */	addi r3, r30, 0x78
/* 804FB388 004F6BA8  C0 02 09 9C */	lfs f0, lbl_80675E7C@sda21(r0)
/* 804FB38C 004F6BAC  38 9F A4 F4 */	addi r4, r31, fn_8000A4F4@l
/* 804FB390 004F6BB0  D0 3E 00 78 */	stfs f1, 0x78(r30)
/* 804FB394 004F6BB4  38 BE 00 6C */	addi r5, r30, 0x6c
/* 804FB398 004F6BB8  D0 23 00 04 */	stfs f1, 0x4(r3)
/* 804FB39C 004F6BBC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804FB3A0 004F6BC0  4B C0 88 B9 */	bl __register_global_object
/* 804FB3A4 004F6BC4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804FB3A8 004F6BC8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804FB3AC 004F6BCC  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 804FB3B0 004F6BD0  7C 08 03 A6 */	mtlr r0
/* 804FB3B4 004F6BD4  38 21 00 10 */	addi r1, r1, 0x10
/* 804FB3B8 004F6BD8  4E 80 00 20 */	blr
.endfn fn_804FB28C

# 0x805350A0 - 0x805350A4
.section .ctors, "a"
.balign 4
	.4byte fn_804FB28C
