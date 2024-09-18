.include "macros.inc"
.file "auto_fn_801C140C_text"

# 0x801C140C - 0x801C1428
.text
.balign 4

.fn fn_801C140C, global
/* 801C140C 001BCC2C  3C 80 80 59 */	lis r4, lbl_8058F4D0@ha
/* 801C1410 001BCC30  3C 60 80 59 */	lis r3, lbl_8058F4DC@ha
/* 801C1414 001BCC34  38 84 F4 D0 */	addi r4, r4, lbl_8058F4D0@l
/* 801C1418 001BCC38  38 63 F4 DC */	addi r3, r3, lbl_8058F4DC@l
/* 801C141C 001BCC3C  90 8D A0 38 */	stw r4, lbl_8066C838@sda21(r0)
/* 801C1420 001BCC40  90 6D A0 3C */	stw r3, lbl_8066C83C@sda21(r0)
/* 801C1424 001BCC44  4E 80 00 20 */	blr
.endfn fn_801C140C

# 0x80534D54 - 0x80534D58
.section .ctors, "a"
.balign 4
	.4byte fn_801C140C
