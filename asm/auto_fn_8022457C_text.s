.include "macros.inc"
.file "auto_fn_8022457C_text"

# 0x8022457C - 0x802245A8
.text
.balign 4

.fn fn_8022457C, global
/* 8022457C 0021FD9C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80224580 0021FDA0  38 00 FF FF */	li r0, -0x1
/* 80224584 0021FDA4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80224588 0021FDA8  3C 80 80 64 */	lis r4, lbl_80638AD0@ha
/* 8022458C 0021FDAC  38 64 8A D0 */	addi r3, r4, lbl_80638AD0@l
/* 80224590 0021FDB0  90 0D A1 50 */	stw r0, lbl_8066C950@sda21(r0)
/* 80224594 0021FDB4  D0 0D A1 54 */	stfs f0, lbl_8066C954@sda21(r0)
/* 80224598 0021FDB8  D0 04 8A D0 */	stfs f0, lbl_80638AD0@l(r4)
/* 8022459C 0021FDBC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802245A0 0021FDC0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802245A4 0021FDC4  4E 80 00 20 */	blr
.endfn fn_8022457C

# 0x80534D94 - 0x80534D98
.section .ctors, "a"
.balign 4
	.4byte fn_8022457C
