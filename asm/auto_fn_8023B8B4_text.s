.include "macros.inc"
.file "auto_fn_8023B8B4_text"

# 0x8023B8B4 - 0x8023B8E0
.text
.balign 4

.fn fn_8023B8B4, global
/* 8023B8B4 002370D4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8023B8B8 002370D8  38 00 FF FF */	li r0, -0x1
/* 8023B8BC 002370DC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8023B8C0 002370E0  3C 80 80 64 */	lis r4, lbl_80638B30@ha
/* 8023B8C4 002370E4  38 64 8B 30 */	addi r3, r4, lbl_80638B30@l
/* 8023B8C8 002370E8  90 0D A1 C8 */	stw r0, lbl_8066C9C8@sda21(r0)
/* 8023B8CC 002370EC  D0 0D A1 CC */	stfs f0, lbl_8066C9CC@sda21(r0)
/* 8023B8D0 002370F0  D0 04 8B 30 */	stfs f0, lbl_80638B30@l(r4)
/* 8023B8D4 002370F4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8023B8D8 002370F8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8023B8DC 002370FC  4E 80 00 20 */	blr
.endfn fn_8023B8B4

# 0x80534DAC - 0x80534DB0
.section .ctors, "a"
.balign 4
	.4byte fn_8023B8B4
