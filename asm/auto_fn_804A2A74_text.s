.include "macros.inc"
.file "auto_fn_804A2A74_text"

# 0x804A2A74 - 0x804A2AA0
.text
.balign 4

.fn fn_804A2A74, global
/* 804A2A74 0049E294  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804A2A78 0049E298  38 00 FF FF */	li r0, -0x1
/* 804A2A7C 0049E29C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804A2A80 0049E2A0  3C 80 80 64 */	lis r4, lbl_80639488@ha
/* 804A2A84 0049E2A4  38 64 94 88 */	addi r3, r4, lbl_80639488@l
/* 804A2A88 0049E2A8  90 0D A9 90 */	stw r0, lbl_8066D190@sda21(r0)
/* 804A2A8C 0049E2AC  D0 0D A9 94 */	stfs f0, lbl_8066D194@sda21(r0)
/* 804A2A90 0049E2B0  D0 04 94 88 */	stfs f0, lbl_80639488@l(r4)
/* 804A2A94 0049E2B4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804A2A98 0049E2B8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804A2A9C 0049E2BC  4E 80 00 20 */	blr
.endfn fn_804A2A74

# 0x80535010 - 0x80535014
.section .ctors, "a"
.balign 4
	.4byte fn_804A2A74
