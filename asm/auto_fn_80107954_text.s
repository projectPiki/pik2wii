.include "macros.inc"
.file "auto_fn_80107954_text"

# 0x800065D0 - 0x800065D8
.section extab, "a"
.balign 4

.obj "@etb_800065D0", local
.hidden "@etb_800065D0"
	.4byte 0x00080000
	.4byte 0x00000000
.endobj "@etb_800065D0"

# 0x80006A58 - 0x80006A64
.section extabindex, "a"
.balign 4

.obj "@eti_80006A58", local
.hidden "@eti_80006A58"
	.4byte fn_80107954
	.4byte 0x00000018
	.4byte "@etb_800065D0"
.endobj "@eti_80006A58"

# 0x80107954 - 0x8010796C
.text
.balign 4

.fn fn_80107954, global
/* 80107954 00103174  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80107958 00103178  D8 21 00 08 */	stfd f1, 0x8(r1)
/* 8010795C 0010317C  80 01 00 08 */	lwz r0, 0x8(r1)
/* 80107960 00103180  54 03 00 00 */	clrrwi r3, r0, 31
/* 80107964 00103184  38 21 00 10 */	addi r1, r1, 0x10
/* 80107968 00103188  4E 80 00 20 */	blr
.endfn fn_80107954
