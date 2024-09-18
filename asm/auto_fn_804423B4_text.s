.include "macros.inc"
.file "auto_fn_804423B4_text"

# 0x804423B4 - 0x804423E0
.text
.balign 4

.fn fn_804423B4, global
/* 804423B4 0043DBD4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804423B8 0043DBD8  38 00 FF FF */	li r0, -0x1
/* 804423BC 0043DBDC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804423C0 0043DBE0  3C 80 80 64 */	lis r4, lbl_806393F8@ha
/* 804423C4 0043DBE4  38 64 93 F8 */	addi r3, r4, lbl_806393F8@l
/* 804423C8 0043DBE8  90 0D A8 60 */	stw r0, lbl_8066D060@sda21(r0)
/* 804423CC 0043DBEC  D0 0D A8 64 */	stfs f0, lbl_8066D064@sda21(r0)
/* 804423D0 0043DBF0  D0 04 93 F8 */	stfs f0, lbl_806393F8@l(r4)
/* 804423D4 0043DBF4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804423D8 0043DBF8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804423DC 0043DBFC  4E 80 00 20 */	blr
.endfn fn_804423B4

# 0x80534FB0 - 0x80534FB4
.section .ctors, "a"
.balign 4
	.4byte fn_804423B4
