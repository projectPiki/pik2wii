.include "macros.inc"
.file "auto_fn_80425C14_text"

# 0x80425C14 - 0x80425C40
.text
.balign 4

.fn fn_80425C14, global
/* 80425C14 00421434  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80425C18 00421438  38 00 FF FF */	li r0, -0x1
/* 80425C1C 0042143C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80425C20 00421440  3C 80 80 64 */	lis r4, lbl_80639378@ha
/* 80425C24 00421444  38 64 93 78 */	addi r3, r4, lbl_80639378@l
/* 80425C28 00421448  90 0D A7 F0 */	stw r0, lbl_8066CFF0@sda21(r0)
/* 80425C2C 0042144C  D0 0D A7 F4 */	stfs f0, lbl_8066CFF4@sda21(r0)
/* 80425C30 00421450  D0 04 93 78 */	stfs f0, lbl_80639378@l(r4)
/* 80425C34 00421454  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80425C38 00421458  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80425C3C 0042145C  4E 80 00 20 */	blr
.endfn fn_80425C14

# 0x80534F90 - 0x80534F94
.section .ctors, "a"
.balign 4
	.4byte fn_80425C14
