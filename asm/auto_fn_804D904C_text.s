.include "macros.inc"
.file "auto_fn_804D904C_text"

# 0x804D904C - 0x804D9078
.text
.balign 4

.fn fn_804D904C, global
/* 804D904C 004D486C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804D9050 004D4870  38 00 FF FF */	li r0, -0x1
/* 804D9054 004D4874  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804D9058 004D4878  3C 80 80 64 */	lis r4, lbl_8063E500@ha
/* 804D905C 004D487C  38 64 E5 00 */	addi r3, r4, lbl_8063E500@l
/* 804D9060 004D4880  90 0D AB 30 */	stw r0, lbl_8066D330@sda21(r0)
/* 804D9064 004D4884  D0 0D AB 34 */	stfs f0, lbl_8066D334@sda21(r0)
/* 804D9068 004D4888  D0 04 E5 00 */	stfs f0, lbl_8063E500@l(r4)
/* 804D906C 004D488C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804D9070 004D4890  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804D9074 004D4894  4E 80 00 20 */	blr
.endfn fn_804D904C

# 0x8053507C - 0x80535080
.section .ctors, "a"
.balign 4
	.4byte fn_804D904C
