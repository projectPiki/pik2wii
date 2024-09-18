.include "macros.inc"
.file "auto_fn_80263828_text"

# 0x80263828 - 0x80263854
.text
.balign 4

.fn fn_80263828, global
/* 80263828 0025F048  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8026382C 0025F04C  38 00 FF FF */	li r0, -0x1
/* 80263830 0025F050  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80263834 0025F054  3C 80 80 64 */	lis r4, lbl_80638BB0@ha
/* 80263838 0025F058  38 64 8B B0 */	addi r3, r4, lbl_80638BB0@l
/* 8026383C 0025F05C  90 0D A2 60 */	stw r0, lbl_8066CA60@sda21(r0)
/* 80263840 0025F060  D0 0D A2 64 */	stfs f0, lbl_8066CA64@sda21(r0)
/* 80263844 0025F064  D0 04 8B B0 */	stfs f0, lbl_80638BB0@l(r4)
/* 80263848 0025F068  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8026384C 0025F06C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80263850 0025F070  4E 80 00 20 */	blr
.endfn fn_80263828

# 0x80534DD0 - 0x80534DD4
.section .ctors, "a"
.balign 4
	.4byte fn_80263828
