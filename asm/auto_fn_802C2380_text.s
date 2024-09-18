.include "macros.inc"
.file "auto_fn_802C2380_text"

# 0x802C2380 - 0x802C23A0
.text
.balign 4

.fn fn_802C2380, global
/* 802C2380 002BDBA0  3C 60 80 67 */	lis r3, lbl_80668728@ha
/* 802C2384 002BDBA4  3C 80 80 2C */	lis r4, fn_802C23A0@ha
/* 802C2388 002BDBA8  38 63 87 28 */	addi r3, r3, lbl_80668728@l
/* 802C238C 002BDBAC  38 A0 00 00 */	li r5, 0x0
/* 802C2390 002BDBB0  38 84 23 A0 */	addi r4, r4, fn_802C23A0@l
/* 802C2394 002BDBB4  38 C0 00 28 */	li r6, 0x28
/* 802C2398 002BDBB8  38 E0 00 80 */	li r7, 0x80
/* 802C239C 002BDBBC  4B E4 1A DC */	b fn_80103E78
.endfn fn_802C2380

# 0x80534E64 - 0x80534E68
.section .ctors, "a"
.balign 4
	.4byte fn_802C2380
