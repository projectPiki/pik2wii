.include "macros.inc"
.file "auto_fn_80218CDC_text"

# 0x80218CDC - 0x80218D08
.text
.balign 4

.fn fn_80218CDC, global
/* 80218CDC 002144FC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80218CE0 00214500  38 00 FF FF */	li r0, -0x1
/* 80218CE4 00214504  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80218CE8 00214508  3C 80 80 64 */	lis r4, lbl_80638AB0@ha
/* 80218CEC 0021450C  38 64 8A B0 */	addi r3, r4, lbl_80638AB0@l
/* 80218CF0 00214510  90 0D A1 40 */	stw r0, lbl_8066C940@sda21(r0)
/* 80218CF4 00214514  D0 0D A1 44 */	stfs f0, lbl_8066C944@sda21(r0)
/* 80218CF8 00214518  D0 04 8A B0 */	stfs f0, lbl_80638AB0@l(r4)
/* 80218CFC 0021451C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80218D00 00214520  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80218D04 00214524  4E 80 00 20 */	blr
.endfn fn_80218CDC

# 0x80534D8C - 0x80534D90
.section .ctors, "a"
.balign 4
	.4byte fn_80218CDC
