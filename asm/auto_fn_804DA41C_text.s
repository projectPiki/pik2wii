.include "macros.inc"
.file "auto_fn_804DA41C_text"

# 0x804DA41C - 0x804DA448
.text
.balign 4

.fn fn_804DA41C, global
/* 804DA41C 004D5C3C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804DA420 004D5C40  38 00 FF FF */	li r0, -0x1
/* 804DA424 004D5C44  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804DA428 004D5C48  3C 80 80 64 */	lis r4, lbl_8063E520@ha
/* 804DA42C 004D5C4C  38 64 E5 20 */	addi r3, r4, lbl_8063E520@l
/* 804DA430 004D5C50  90 0D AB 48 */	stw r0, lbl_8066D348@sda21(r0)
/* 804DA434 004D5C54  D0 0D AB 4C */	stfs f0, lbl_8066D34C@sda21(r0)
/* 804DA438 004D5C58  D0 04 E5 20 */	stfs f0, lbl_8063E520@l(r4)
/* 804DA43C 004D5C5C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804DA440 004D5C60  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804DA444 004D5C64  4E 80 00 20 */	blr
.endfn fn_804DA41C

# 0x80535084 - 0x80535088
.section .ctors, "a"
.balign 4
	.4byte fn_804DA41C
