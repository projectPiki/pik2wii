.include "macros.inc"
.file "auto_fn_804B9034_text"

# 0x804B9034 - 0x804B9060
.text
.balign 4

.fn fn_804B9034, global
/* 804B9034 004B4854  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804B9038 004B4858  38 00 FF FF */	li r0, -0x1
/* 804B903C 004B485C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804B9040 004B4860  3C 80 80 64 */	lis r4, lbl_80639560@ha
/* 804B9044 004B4864  38 64 95 60 */	addi r3, r4, lbl_80639560@l
/* 804B9048 004B4868  90 0D AA 50 */	stw r0, lbl_8066D250@sda21(r0)
/* 804B904C 004B486C  D0 0D AA 54 */	stfs f0, lbl_8066D254@sda21(r0)
/* 804B9050 004B4870  D0 04 95 60 */	stfs f0, lbl_80639560@l(r4)
/* 804B9054 004B4874  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804B9058 004B4878  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804B905C 004B487C  4E 80 00 20 */	blr
.endfn fn_804B9034

# 0x80535040 - 0x80535044
.section .ctors, "a"
.balign 4
	.4byte fn_804B9034
