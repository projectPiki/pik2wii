.include "macros.inc"
.file "auto_StringWrite_text"

# 0x80006610 - 0x80006618
.section extab, "a"
.balign 4

.obj "@etb_80006610", local
.hidden "@etb_80006610"
	.4byte 0x10080000
	.4byte 0x00000000
.endobj "@etb_80006610"

# 0x80006AB8 - 0x80006AC4
.section extabindex, "a"
.balign 4

.obj "@eti_80006AB8", local
.hidden "@eti_80006AB8"
	.4byte __StringWrite
	.4byte 0x0000006C
	.4byte "@etb_80006610"
.endobj "@eti_80006AB8"

# 0x80109A34 - 0x80109AA0
.text
.balign 4

.fn __StringWrite, global
/* 80109A34 00105254  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80109A38 00105258  7C 08 02 A6 */	mflr r0
/* 80109A3C 0010525C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80109A40 00105260  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80109A44 00105264  93 C1 00 08 */	stw r30, 0x8(r1)
/* 80109A48 00105268  7C 7E 1B 78 */	mr r30, r3
/* 80109A4C 0010526C  80 C3 00 08 */	lwz r6, 0x8(r3)
/* 80109A50 00105270  80 E3 00 04 */	lwz r7, 0x4(r3)
/* 80109A54 00105274  7C 06 2A 14 */	add r0, r6, r5
/* 80109A58 00105278  7C 00 38 40 */	cmplw r0, r7
/* 80109A5C 0010527C  7F E6 38 50 */	subf r31, r6, r7
/* 80109A60 00105280  41 81 00 08 */	bgt .L_80109A68
/* 80109A64 00105284  7C BF 2B 78 */	mr r31, r5
.L_80109A68:
/* 80109A68 00105288  80 03 00 00 */	lwz r0, 0x0(r3)
/* 80109A6C 0010528C  7F E5 FB 78 */	mr r5, r31
/* 80109A70 00105290  7C 60 32 14 */	add r3, r0, r6
/* 80109A74 00105294  4B EF C5 41 */	bl memcpy
/* 80109A78 00105298  80 1E 00 08 */	lwz r0, 0x8(r30)
/* 80109A7C 0010529C  38 60 00 01 */	li r3, 0x1
/* 80109A80 001052A0  7C 00 FA 14 */	add r0, r0, r31
/* 80109A84 001052A4  90 1E 00 08 */	stw r0, 0x8(r30)
/* 80109A88 001052A8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80109A8C 001052AC  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 80109A90 001052B0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80109A94 001052B4  7C 08 03 A6 */	mtlr r0
/* 80109A98 001052B8  38 21 00 10 */	addi r1, r1, 0x10
/* 80109A9C 001052BC  4E 80 00 20 */	blr
.endfn __StringWrite
