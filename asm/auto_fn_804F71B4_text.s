.include "macros.inc"
.file "auto_fn_804F71B4_text"

# 0x804F71B4 - 0x804F71E0
.text
.balign 4

.fn fn_804F71B4, global
/* 804F71B4 004F29D4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804F71B8 004F29D8  38 00 FF FF */	li r0, -0x1
/* 804F71BC 004F29DC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804F71C0 004F29E0  3C 80 80 64 */	lis r4, lbl_8063E550@ha
/* 804F71C4 004F29E4  38 64 E5 50 */	addi r3, r4, lbl_8063E550@l
/* 804F71C8 004F29E8  90 0D AB 98 */	stw r0, lbl_8066D398@sda21(r0)
/* 804F71CC 004F29EC  D0 0D AB 9C */	stfs f0, lbl_8066D39C@sda21(r0)
/* 804F71D0 004F29F0  D0 04 E5 50 */	stfs f0, lbl_8063E550@l(r4)
/* 804F71D4 004F29F4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804F71D8 004F29F8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804F71DC 004F29FC  4E 80 00 20 */	blr
.endfn fn_804F71B4

# 0x80535090 - 0x80535094
.section .ctors, "a"
.balign 4
	.4byte fn_804F71B4
