.include "macros.inc"
.file "auto_fn_8038C66C_text"

# 0x8038C66C - 0x8038C698
.text
.balign 4

.fn fn_8038C66C, global
/* 8038C66C 00387E8C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8038C670 00387E90  38 00 FF FF */	li r0, -0x1
/* 8038C674 00387E94  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8038C678 00387E98  3C 80 80 64 */	lis r4, lbl_80639248@ha
/* 8038C67C 00387E9C  38 64 92 48 */	addi r3, r4, lbl_80639248@l
/* 8038C680 00387EA0  90 0D A5 E8 */	stw r0, lbl_8066CDE8@sda21(r0)
/* 8038C684 00387EA4  D0 0D A5 EC */	stfs f0, lbl_8066CDEC@sda21(r0)
/* 8038C688 00387EA8  D0 04 92 48 */	stfs f0, lbl_80639248@l(r4)
/* 8038C68C 00387EAC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8038C690 00387EB0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8038C694 00387EB4  4E 80 00 20 */	blr
.endfn fn_8038C66C

# 0x80534EF4 - 0x80534EF8
.section .ctors, "a"
.balign 4
	.4byte fn_8038C66C
