.include "macros.inc"
.file "auto_fn_8046F964_text"

# 0x8046F964 - 0x8046F990
.text
.balign 4

.fn fn_8046F964, global
/* 8046F964 0046B184  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8046F968 0046B188  38 00 FF FF */	li r0, -0x1
/* 8046F96C 0046B18C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8046F970 0046B190  3C 80 80 64 */	lis r4, lbl_80639448@ha
/* 8046F974 0046B194  38 64 94 48 */	addi r3, r4, lbl_80639448@l
/* 8046F978 0046B198  90 0D A9 30 */	stw r0, lbl_8066D130@sda21(r0)
/* 8046F97C 0046B19C  D0 0D A9 34 */	stfs f0, lbl_8066D134@sda21(r0)
/* 8046F980 0046B1A0  D0 04 94 48 */	stfs f0, lbl_80639448@l(r4)
/* 8046F984 0046B1A4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8046F988 0046B1A8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8046F98C 0046B1AC  4E 80 00 20 */	blr
.endfn fn_8046F964

# 0x80534FD8 - 0x80534FDC
.section .ctors, "a"
.balign 4
	.4byte fn_8046F964
