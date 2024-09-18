.include "macros.inc"
.file "auto_fn_8027E01C_text"

# 0x8027E01C - 0x8027E048
.text
.balign 4

.fn fn_8027E01C, global
/* 8027E01C 0027983C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8027E020 00279840  38 00 FF FF */	li r0, -0x1
/* 8027E024 00279844  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8027E028 00279848  3C 80 80 64 */	lis r4, lbl_80638C00@ha
/* 8027E02C 0027984C  38 64 8C 00 */	addi r3, r4, lbl_80638C00@l
/* 8027E030 00279850  90 0D A2 D0 */	stw r0, lbl_8066CAD0@sda21(r0)
/* 8027E034 00279854  D0 0D A2 D4 */	stfs f0, lbl_8066CAD4@sda21(r0)
/* 8027E038 00279858  D0 04 8C 00 */	stfs f0, lbl_80638C00@l(r4)
/* 8027E03C 0027985C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8027E040 00279860  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8027E044 00279864  4E 80 00 20 */	blr
.endfn fn_8027E01C

# 0x80534DE4 - 0x80534DE8
.section .ctors, "a"
.balign 4
	.4byte fn_8027E01C
