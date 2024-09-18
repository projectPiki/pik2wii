.include "macros.inc"
.file "auto_fn_8030D7FC_text"

# 0x8030D7FC - 0x8030D828
.text
.balign 4

.fn fn_8030D7FC, global
/* 8030D7FC 0030901C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8030D800 00309020  38 00 FF FF */	li r0, -0x1
/* 8030D804 00309024  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8030D808 00309028  3C 80 80 64 */	lis r4, lbl_806390E8@ha
/* 8030D80C 0030902C  38 64 90 E8 */	addi r3, r4, lbl_806390E8@l
/* 8030D810 00309030  90 0D A4 F0 */	stw r0, lbl_8066CCF0@sda21(r0)
/* 8030D814 00309034  D0 0D A4 F4 */	stfs f0, lbl_8066CCF4@sda21(r0)
/* 8030D818 00309038  D0 04 90 E8 */	stfs f0, lbl_806390E8@l(r4)
/* 8030D81C 0030903C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8030D820 00309040  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8030D824 00309044  4E 80 00 20 */	blr
.endfn fn_8030D7FC

# 0x80534E94 - 0x80534E98
.section .ctors, "a"
.balign 4
	.4byte fn_8030D7FC
