.include "macros.inc"
.file "auto_fn_8033CFE4_text"

# 0x8033CFE4 - 0x8033D010
.text
.balign 4

.fn fn_8033CFE4, global
/* 8033CFE4 00338804  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8033CFE8 00338808  38 00 FF FF */	li r0, -0x1
/* 8033CFEC 0033880C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8033CFF0 00338810  3C 80 80 64 */	lis r4, lbl_80639158@ha
/* 8033CFF4 00338814  38 64 91 58 */	addi r3, r4, lbl_80639158@l
/* 8033CFF8 00338818  90 0D A5 30 */	stw r0, lbl_8066CD30@sda21(r0)
/* 8033CFFC 0033881C  D0 0D A5 34 */	stfs f0, lbl_8066CD34@sda21(r0)
/* 8033D000 00338820  D0 04 91 58 */	stfs f0, lbl_80639158@l(r4)
/* 8033D004 00338824  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8033D008 00338828  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8033D00C 0033882C  4E 80 00 20 */	blr
.endfn fn_8033CFE4

# 0x80534EB0 - 0x80534EB4
.section .ctors, "a"
.balign 4
	.4byte fn_8033CFE4
