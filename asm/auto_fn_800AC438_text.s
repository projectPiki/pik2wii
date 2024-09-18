.include "macros.inc"
.file "auto_fn_800AC438_text"

# 0x800AC438 - 0x800AC458
.text
.balign 4

.fn fn_800AC438, global
/* 800AC438 000A7C58  38 00 00 00 */	li r0, 0x0
/* 800AC43C 000A7C5C  3C 80 80 0B */	lis r4, fn_800AC374@ha
/* 800AC440 000A7C60  3C A0 80 5D */	lis r5, lbl_805D5708@ha
/* 800AC444 000A7C64  90 0D 96 80 */	stw r0, lbl_8066BE80@sda21(r0)
/* 800AC448 000A7C68  38 84 C3 74 */	addi r4, r4, fn_800AC374@l
/* 800AC44C 000A7C6C  38 6D 96 80 */	li r3, lbl_8066BE80@sda21
/* 800AC450 000A7C70  38 A5 57 08 */	addi r5, r5, lbl_805D5708@l
/* 800AC454 000A7C74  48 05 78 04 */	b __register_global_object
.endfn fn_800AC438

# 0x80534D24 - 0x80534D28
.section .ctors, "a"
.balign 4
	.4byte fn_800AC438
