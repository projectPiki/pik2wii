.include "macros.inc"
.file "auto_fn_801BD728_text"

# 0x801BD728 - 0x801BD754
.text
.balign 4

.fn fn_801BD728, global
/* 801BD728 001B8F48  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801BD72C 001B8F4C  38 00 FF FF */	li r0, -0x1
/* 801BD730 001B8F50  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801BD734 001B8F54  3C 80 80 64 */	lis r4, lbl_806389D0@ha
/* 801BD738 001B8F58  38 64 89 D0 */	addi r3, r4, lbl_806389D0@l
/* 801BD73C 001B8F5C  90 0D A0 30 */	stw r0, lbl_8066C830@sda21(r0)
/* 801BD740 001B8F60  D0 0D A0 34 */	stfs f0, lbl_8066C834@sda21(r0)
/* 801BD744 001B8F64  D0 04 89 D0 */	stfs f0, lbl_806389D0@l(r4)
/* 801BD748 001B8F68  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801BD74C 001B8F6C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801BD750 001B8F70  4E 80 00 20 */	blr
.endfn fn_801BD728

# 0x80534D50 - 0x80534D54
.section .ctors, "a"
.balign 4
	.4byte fn_801BD728
