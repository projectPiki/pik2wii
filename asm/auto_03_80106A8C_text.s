.include "macros.inc"
.file "auto_03_80106A8C_text"

# 0x80106A8C - 0x80106A9C
.text
.balign 4

.fn fn_80106A8C, global
/* 80106A8C 001022AC  7C 64 FE 70 */	srawi r4, r3, 31
/* 80106A90 001022B0  7C 80 1A 78 */	xor r0, r4, r3
/* 80106A94 001022B4  7C 64 00 50 */	subf r3, r4, r0
/* 80106A98 001022B8  4E 80 00 20 */	blr
.endfn fn_80106A8C
