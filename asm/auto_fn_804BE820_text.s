.include "macros.inc"
.file "auto_fn_804BE820_text"

# 0x804BE820 - 0x804BE84C
.text
.balign 4

.fn fn_804BE820, global
/* 804BE820 004BA040  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804BE824 004BA044  38 00 FF FF */	li r0, -0x1
/* 804BE828 004BA048  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804BE82C 004BA04C  3C 80 80 64 */	lis r4, lbl_806395B0@ha
/* 804BE830 004BA050  38 64 95 B0 */	addi r3, r4, lbl_806395B0@l
/* 804BE834 004BA054  90 0D AA 88 */	stw r0, lbl_8066D288@sda21(r0)
/* 804BE838 004BA058  D0 0D AA 8C */	stfs f0, lbl_8066D28C@sda21(r0)
/* 804BE83C 004BA05C  D0 04 95 B0 */	stfs f0, lbl_806395B0@l(r4)
/* 804BE840 004BA060  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804BE844 004BA064  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804BE848 004BA068  4E 80 00 20 */	blr
.endfn fn_804BE820

# 0x80535054 - 0x80535058
.section .ctors, "a"
.balign 4
	.4byte fn_804BE820
