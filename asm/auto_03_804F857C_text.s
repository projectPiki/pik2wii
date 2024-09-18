.include "macros.inc"
.file "auto_03_804F857C_text"

# 0x804F857C - 0x804F859C
.text
.balign 4

.fn fn_804F857C, global
/* 804F857C 004F3D9C  7C 87 23 78 */	mr r7, r4
/* 804F8580 004F3DA0  7C A0 2B 78 */	mr r0, r5
/* 804F8584 004F3DA4  7C C4 33 78 */	mr r4, r6
/* 804F8588 004F3DA8  7C E5 3B 78 */	mr r5, r7
/* 804F858C 004F3DAC  7C 06 03 78 */	mr r6, r0
/* 804F8590 004F3DB0  48 00 10 BC */	b fn_804F964C
.endfn fn_804F857C

.fn fn_804F8594, global
/* 804F8594 004F3DB4  38 63 00 34 */	addi r3, r3, 0x34
/* 804F8598 004F3DB8  4E 80 00 20 */	blr
.endfn fn_804F8594
