.include "macros.inc"
.file "auto_fn_804BEE38_text"

# 0x804BEE38 - 0x804BEE64
.text
.balign 4

.fn fn_804BEE38, global
/* 804BEE38 004BA658  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804BEE3C 004BA65C  38 00 FF FF */	li r0, -0x1
/* 804BEE40 004BA660  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804BEE44 004BA664  3C 80 80 64 */	lis r4, lbl_806395C0@ha
/* 804BEE48 004BA668  38 64 95 C0 */	addi r3, r4, lbl_806395C0@l
/* 804BEE4C 004BA66C  90 0D AA 90 */	stw r0, lbl_8066D290@sda21(r0)
/* 804BEE50 004BA670  D0 0D AA 94 */	stfs f0, lbl_8066D294@sda21(r0)
/* 804BEE54 004BA674  D0 04 95 C0 */	stfs f0, lbl_806395C0@l(r4)
/* 804BEE58 004BA678  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804BEE5C 004BA67C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804BEE60 004BA680  4E 80 00 20 */	blr
.endfn fn_804BEE38

# 0x80535058 - 0x8053505C
.section .ctors, "a"
.balign 4
	.4byte fn_804BEE38
