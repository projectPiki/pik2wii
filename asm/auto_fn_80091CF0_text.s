.include "macros.inc"
.file "auto_fn_80091CF0_text"

# 0x80091CF0 - 0x80091DFC
.text
.balign 4

.fn fn_80091CF0, global
/* 80091CF0 0008D510  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80091CF4 0008D514  7C 08 02 A6 */	mflr r0
/* 80091CF8 0008D518  38 80 00 00 */	li r4, 0x0
/* 80091CFC 0008D51C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80091D00 0008D520  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80091D04 0008D524  3F E0 80 66 */	lis r31, lbl_8065FAC8@ha
/* 80091D08 0008D528  38 7F FA C8 */	addi r3, r31, lbl_8065FAC8@l
/* 80091D0C 0008D52C  4B FF 93 C9 */	bl fn_8008B0D4
/* 80091D10 0008D530  3C 80 80 09 */	lis r4, fn_80091EAC@ha
/* 80091D14 0008D534  3C A0 80 5D */	lis r5, lbl_805D56F0@ha
/* 80091D18 0008D538  38 7F FA C8 */	addi r3, r31, lbl_8065FAC8@l
/* 80091D1C 0008D53C  38 84 1E AC */	addi r4, r4, fn_80091EAC@l
/* 80091D20 0008D540  38 A5 56 F0 */	addi r5, r5, lbl_805D56F0@l
/* 80091D24 0008D544  48 07 1F 35 */	bl __register_global_object
/* 80091D28 0008D548  3C 60 80 66 */	lis r3, lbl_8065FB08@ha
/* 80091D2C 0008D54C  3C 80 80 09 */	lis r4, fn_80091E70@ha
/* 80091D30 0008D550  38 63 FB 08 */	addi r3, r3, lbl_8065FB08@l
/* 80091D34 0008D554  38 A0 00 00 */	li r5, 0x0
/* 80091D38 0008D558  38 84 1E 70 */	addi r4, r4, fn_80091E70@l
/* 80091D3C 0008D55C  38 C0 00 30 */	li r6, 0x30
/* 80091D40 0008D560  38 E0 00 04 */	li r7, 0x4
/* 80091D44 0008D564  48 07 21 35 */	bl fn_80103E78
/* 80091D48 0008D568  3C 60 80 66 */	lis r3, lbl_8065FBC8@ha
/* 80091D4C 0008D56C  3F E0 80 09 */	lis r31, fn_80091E54@ha
/* 80091D50 0008D570  38 63 FB C8 */	addi r3, r3, lbl_8065FBC8@l
/* 80091D54 0008D574  38 A0 00 00 */	li r5, 0x0
/* 80091D58 0008D578  38 9F 1E 54 */	addi r4, r31, fn_80091E54@l
/* 80091D5C 0008D57C  38 C0 00 10 */	li r6, 0x10
/* 80091D60 0008D580  38 E0 00 04 */	li r7, 0x4
/* 80091D64 0008D584  48 07 21 15 */	bl fn_80103E78
/* 80091D68 0008D588  3C 60 80 66 */	lis r3, lbl_8065FC08@ha
/* 80091D6C 0008D58C  38 9F 1E 54 */	addi r4, r31, fn_80091E54@l
/* 80091D70 0008D590  38 63 FC 08 */	addi r3, r3, lbl_8065FC08@l
/* 80091D74 0008D594  38 A0 00 00 */	li r5, 0x0
/* 80091D78 0008D598  38 C0 00 10 */	li r6, 0x10
/* 80091D7C 0008D59C  38 E0 00 04 */	li r7, 0x4
/* 80091D80 0008D5A0  48 07 20 F9 */	bl fn_80103E78
/* 80091D84 0008D5A4  3C 80 80 00 */	lis r4, 0x8000
/* 80091D88 0008D5A8  3C 60 88 89 */	lis r3, 0x8889
/* 80091D8C 0008D5AC  80 84 00 F8 */	lwz r4, 0xf8(r4)
/* 80091D90 0008D5B0  38 C3 88 89 */	subi r6, r3, 0x7777
/* 80091D94 0008D5B4  38 00 00 1E */	li r0, 0x1e
/* 80091D98 0008D5B8  38 A0 00 00 */	li r5, 0x0
/* 80091D9C 0008D5BC  54 83 F0 BE */	srwi r3, r4, 2
/* 80091DA0 0008D5C0  3F E0 80 66 */	lis r31, lbl_8065FC48@ha
/* 80091DA4 0008D5C4  7C C6 18 16 */	mulhwu r6, r6, r3
/* 80091DA8 0008D5C8  38 80 00 00 */	li r4, 0x0
/* 80091DAC 0008D5CC  38 7F FC 48 */	addi r3, r31, lbl_8065FC48@l
/* 80091DB0 0008D5D0  7C A5 01 D6 */	mullw r5, r5, r0
/* 80091DB4 0008D5D4  54 C6 D9 7E */	srwi r6, r6, 5
/* 80091DB8 0008D5D8  7C 06 00 16 */	mulhwu r0, r6, r0
/* 80091DBC 0008D5DC  1C C6 00 1E */	mulli r6, r6, 0x1e
/* 80091DC0 0008D5E0  7C 00 2A 14 */	add r0, r0, r5
/* 80091DC4 0008D5E4  90 0D 96 18 */	stw r0, lbl_8066BE18@sda21(r0)
/* 80091DC8 0008D5E8  90 CD 96 1C */	stw r6, lbl_8066BE1C@sda21(r0)
/* 80091DCC 0008D5EC  4B FF 93 09 */	bl fn_8008B0D4
/* 80091DD0 0008D5F0  3C 80 80 09 */	lis r4, fn_80091DFC@ha
/* 80091DD4 0008D5F4  3C A0 80 5D */	lis r5, lbl_805D56FC@ha
/* 80091DD8 0008D5F8  38 7F FC 48 */	addi r3, r31, lbl_8065FC48@l
/* 80091DDC 0008D5FC  38 84 1D FC */	addi r4, r4, fn_80091DFC@l
/* 80091DE0 0008D600  38 A5 56 FC */	addi r5, r5, lbl_805D56FC@l
/* 80091DE4 0008D604  48 07 1E 75 */	bl __register_global_object
/* 80091DE8 0008D608  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80091DEC 0008D60C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80091DF0 0008D610  7C 08 03 A6 */	mtlr r0
/* 80091DF4 0008D614  38 21 00 10 */	addi r1, r1, 0x10
/* 80091DF8 0008D618  4E 80 00 20 */	blr
.endfn fn_80091CF0

# 0x80534D18 - 0x80534D1C
.section .ctors, "a"
.balign 4
	.4byte fn_80091CF0