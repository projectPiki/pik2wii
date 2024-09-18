.include "macros.inc"
.file "auto_fn_804BA698_text"

# 0x804BA698 - 0x804BA6C4
.text
.balign 4

.fn fn_804BA698, global
/* 804BA698 004B5EB8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804BA69C 004B5EBC  38 00 FF FF */	li r0, -0x1
/* 804BA6A0 004B5EC0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804BA6A4 004B5EC4  3C 80 80 64 */	lis r4, lbl_806395A0@ha
/* 804BA6A8 004B5EC8  38 64 95 A0 */	addi r3, r4, lbl_806395A0@l
/* 804BA6AC 004B5ECC  90 0D AA 70 */	stw r0, lbl_8066D270@sda21(r0)
/* 804BA6B0 004B5ED0  D0 0D AA 74 */	stfs f0, lbl_8066D274@sda21(r0)
/* 804BA6B4 004B5ED4  D0 04 95 A0 */	stfs f0, lbl_806395A0@l(r4)
/* 804BA6B8 004B5ED8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804BA6BC 004B5EDC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804BA6C0 004B5EE0  4E 80 00 20 */	blr
.endfn fn_804BA698

# 0x80535050 - 0x80535054
.section .ctors, "a"
.balign 4
	.4byte fn_804BA698
