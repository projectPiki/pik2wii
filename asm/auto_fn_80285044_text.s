.include "macros.inc"
.file "auto_fn_80285044_text"

# 0x80285044 - 0x80285070
.text
.balign 4

.fn fn_80285044, global
/* 80285044 00280864  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80285048 00280868  38 00 FF FF */	li r0, -0x1
/* 8028504C 0028086C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80285050 00280870  3C 80 80 64 */	lis r4, lbl_80638C30@ha
/* 80285054 00280874  38 64 8C 30 */	addi r3, r4, lbl_80638C30@l
/* 80285058 00280878  90 0D A3 10 */	stw r0, lbl_8066CB10@sda21(r0)
/* 8028505C 0028087C  D0 0D A3 14 */	stfs f0, lbl_8066CB14@sda21(r0)
/* 80285060 00280880  D0 04 8C 30 */	stfs f0, lbl_80638C30@l(r4)
/* 80285064 00280884  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80285068 00280888  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8028506C 0028088C  4E 80 00 20 */	blr
.endfn fn_80285044

# 0x80534DF0 - 0x80534DF4
.section .ctors, "a"
.balign 4
	.4byte fn_80285044
