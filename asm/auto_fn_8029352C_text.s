.include "macros.inc"
.file "auto_fn_8029352C_text"

# 0x8029352C - 0x80293558
.text
.balign 4

.fn fn_8029352C, global
/* 8029352C 0028ED4C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80293530 0028ED50  38 00 FF FF */	li r0, -0x1
/* 80293534 0028ED54  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80293538 0028ED58  3C 80 80 64 */	lis r4, lbl_80638C90@ha
/* 8029353C 0028ED5C  38 64 8C 90 */	addi r3, r4, lbl_80638C90@l
/* 80293540 0028ED60  90 0D A3 60 */	stw r0, lbl_8066CB60@sda21(r0)
/* 80293544 0028ED64  D0 0D A3 64 */	stfs f0, lbl_8066CB64@sda21(r0)
/* 80293548 0028ED68  D0 04 8C 90 */	stfs f0, lbl_80638C90@l(r4)
/* 8029354C 0028ED6C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80293550 0028ED70  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80293554 0028ED74  4E 80 00 20 */	blr
.endfn fn_8029352C

# 0x80534E08 - 0x80534E0C
.section .ctors, "a"
.balign 4
	.4byte fn_8029352C
