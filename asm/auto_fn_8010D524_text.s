.include "macros.inc"
.file "auto_fn_8010D524_text"

# 0x80006680 - 0x80006688
.section extab, "a"
.balign 4

.obj "@etb_80006680", local
.hidden "@etb_80006680"
	.4byte 0x08080000
	.4byte 0x00000000
.endobj "@etb_80006680"

# 0x80006B60 - 0x80006B6C
.section extabindex, "a"
.balign 4

.obj "@eti_80006B60", local
.hidden "@eti_80006B60"
	.4byte fn_8010D524
	.4byte 0x000000C4
	.4byte "@etb_80006680"
.endobj "@eti_80006B60"

# 0x8010D524 - 0x8010D5E8
.text
.balign 4

.fn fn_8010D524, global
/* 8010D524 00108D44  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8010D528 00108D48  7C 08 02 A6 */	mflr r0
/* 8010D52C 00108D4C  3C A0 80 11 */	lis r5, fn_8010B200@ha
/* 8010D530 00108D50  90 01 00 34 */	stw r0, 0x34(r1)
/* 8010D534 00108D54  38 00 00 00 */	li r0, 0x0
/* 8010D538 00108D58  38 A5 B2 00 */	addi r5, r5, fn_8010B200@l
/* 8010D53C 00108D5C  38 C1 00 18 */	addi r6, r1, 0x18
/* 8010D540 00108D60  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 8010D544 00108D64  3F E0 80 00 */	lis r31, 0x8000
/* 8010D548 00108D68  38 9F FF FF */	subi r4, r31, 0x1
/* 8010D54C 00108D6C  38 E1 00 08 */	addi r7, r1, 0x8
/* 8010D550 00108D70  90 61 00 18 */	stw r3, 0x18(r1)
/* 8010D554 00108D74  39 01 00 0C */	addi r8, r1, 0xc
/* 8010D558 00108D78  39 21 00 10 */	addi r9, r1, 0x10
/* 8010D55C 00108D7C  38 60 00 0A */	li r3, 0xa
/* 8010D560 00108D80  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8010D564 00108D84  4B FF F5 39 */	bl fn_8010CA9C
/* 8010D568 00108D88  80 01 00 10 */	lwz r0, 0x10(r1)
/* 8010D56C 00108D8C  2C 00 00 00 */	cmpwi r0, 0x0
/* 8010D570 00108D90  40 82 00 30 */	bne .L_8010D5A0
/* 8010D574 00108D94  80 81 00 0C */	lwz r4, 0xc(r1)
/* 8010D578 00108D98  2C 04 00 00 */	cmpwi r4, 0x0
/* 8010D57C 00108D9C  40 82 00 10 */	bne .L_8010D58C
/* 8010D580 00108DA0  38 1F FF FF */	subi r0, r31, 0x1
/* 8010D584 00108DA4  7C 03 00 40 */	cmplw r3, r0
/* 8010D588 00108DA8  41 81 00 18 */	bgt .L_8010D5A0
.L_8010D58C:
/* 8010D58C 00108DAC  2C 04 00 00 */	cmpwi r4, 0x0
/* 8010D590 00108DB0  41 82 00 38 */	beq .L_8010D5C8
/* 8010D594 00108DB4  3C 00 80 00 */	lis r0, 0x8000
/* 8010D598 00108DB8  7C 03 00 40 */	cmplw r3, r0
/* 8010D59C 00108DBC  40 81 00 2C */	ble .L_8010D5C8
.L_8010D5A0:
/* 8010D5A0 00108DC0  80 A1 00 0C */	lwz r5, 0xc(r1)
/* 8010D5A4 00108DC4  38 00 00 22 */	li r0, 0x22
/* 8010D5A8 00108DC8  3C 60 80 00 */	lis r3, 0x8000
/* 8010D5AC 00108DCC  90 0D 97 58 */	stw r0, lbl_8066BF58@sda21(r0)
/* 8010D5B0 00108DD0  7C 85 00 D0 */	neg r4, r5
/* 8010D5B4 00108DD4  7C 84 2B 78 */	or r4, r4, r5
/* 8010D5B8 00108DD8  38 03 FF FF */	subi r0, r3, 0x1
/* 8010D5BC 00108DDC  54 83 0F FE */	srwi r3, r4, 31
/* 8010D5C0 00108DE0  7C 63 02 14 */	add r3, r3, r0
/* 8010D5C4 00108DE4  48 00 00 10 */	b .L_8010D5D4
.L_8010D5C8:
/* 8010D5C8 00108DE8  2C 04 00 00 */	cmpwi r4, 0x0
/* 8010D5CC 00108DEC  41 82 00 08 */	beq .L_8010D5D4
/* 8010D5D0 00108DF0  7C 63 00 D0 */	neg r3, r3
.L_8010D5D4:
/* 8010D5D4 00108DF4  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8010D5D8 00108DF8  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 8010D5DC 00108DFC  7C 08 03 A6 */	mtlr r0
/* 8010D5E0 00108E00  38 21 00 30 */	addi r1, r1, 0x30
/* 8010D5E4 00108E04  4E 80 00 20 */	blr
.endfn fn_8010D524