.include "macros.inc"
.file "auto_fn_80325038_text"

# 0x80325038 - 0x80325064
.text
.balign 4

.fn fn_80325038, global
/* 80325038 00320858  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8032503C 0032085C  38 00 FF FF */	li r0, -0x1
/* 80325040 00320860  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80325044 00320864  3C 80 80 64 */	lis r4, lbl_80639118@ha
/* 80325048 00320868  38 64 91 18 */	addi r3, r4, lbl_80639118@l
/* 8032504C 0032086C  90 0D A5 08 */	stw r0, lbl_8066CD08@sda21(r0)
/* 80325050 00320870  D0 0D A5 0C */	stfs f0, lbl_8066CD0C@sda21(r0)
/* 80325054 00320874  D0 04 91 18 */	stfs f0, lbl_80639118@l(r4)
/* 80325058 00320878  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8032505C 0032087C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80325060 00320880  4E 80 00 20 */	blr
.endfn fn_80325038

# 0x80534EA0 - 0x80534EA4
.section .ctors, "a"
.balign 4
	.4byte fn_80325038
