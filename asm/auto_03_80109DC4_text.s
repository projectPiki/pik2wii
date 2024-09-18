.include "macros.inc"
.file "auto_03_80109DC4_text"

# 0x80109DC4 - 0x80109DEC
.text
.balign 4

.fn fn_80109DC4, global
/* 80109DC4 001055E4  3C 60 41 C6 */	lis r3, 0x41c6
/* 80109DC8 001055E8  80 8D 82 A0 */	lwz r4, lbl_8066AAA0@sda21(r0)
/* 80109DCC 001055EC  38 03 4E 6D */	addi r0, r3, 0x4e6d
/* 80109DD0 001055F0  7C 64 01 D6 */	mullw r3, r4, r0
/* 80109DD4 001055F4  38 03 30 39 */	addi r0, r3, 0x3039
/* 80109DD8 001055F8  90 0D 82 A0 */	stw r0, lbl_8066AAA0@sda21(r0)
/* 80109DDC 001055FC  54 03 84 7E */	extrwi r3, r0, 15, 1
/* 80109DE0 00105600  4E 80 00 20 */	blr
.endfn fn_80109DC4

.fn fn_80109DE4, global
/* 80109DE4 00105604  90 6D 82 A0 */	stw r3, lbl_8066AAA0@sda21(r0)
/* 80109DE8 00105608  4E 80 00 20 */	blr
.endfn fn_80109DE4
