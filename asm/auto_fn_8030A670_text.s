.include "macros.inc"
.file "auto_fn_8030A670_text"

# 0x8030A670 - 0x8030A69C
.text
.balign 4

.fn fn_8030A670, global
/* 8030A670 00305E90  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8030A674 00305E94  38 00 FF FF */	li r0, -0x1
/* 8030A678 00305E98  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8030A67C 00305E9C  3C 80 80 64 */	lis r4, lbl_806390D8@ha
/* 8030A680 00305EA0  38 64 90 D8 */	addi r3, r4, lbl_806390D8@l
/* 8030A684 00305EA4  90 0D A4 E8 */	stw r0, lbl_8066CCE8@sda21(r0)
/* 8030A688 00305EA8  D0 0D A4 EC */	stfs f0, lbl_8066CCEC@sda21(r0)
/* 8030A68C 00305EAC  D0 04 90 D8 */	stfs f0, lbl_806390D8@l(r4)
/* 8030A690 00305EB0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8030A694 00305EB4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8030A698 00305EB8  4E 80 00 20 */	blr
.endfn fn_8030A670

# 0x80534E90 - 0x80534E94
.section .ctors, "a"
.balign 4
	.4byte fn_8030A670
