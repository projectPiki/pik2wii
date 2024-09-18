.include "macros.inc"
.file "auto_fn_804C6614_text"

# 0x804C6614 - 0x804C6640
.text
.balign 4

.fn fn_804C6614, global
/* 804C6614 004C1E34  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804C6618 004C1E38  38 00 FF FF */	li r0, -0x1
/* 804C661C 004C1E3C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804C6620 004C1E40  3C 80 80 64 */	lis r4, lbl_80639738@ha
/* 804C6624 004C1E44  38 64 97 38 */	addi r3, r4, lbl_80639738@l
/* 804C6628 004C1E48  90 0D AA C0 */	stw r0, lbl_8066D2C0@sda21(r0)
/* 804C662C 004C1E4C  D0 0D AA C4 */	stfs f0, lbl_8066D2C4@sda21(r0)
/* 804C6630 004C1E50  D0 04 97 38 */	stfs f0, lbl_80639738@l(r4)
/* 804C6634 004C1E54  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804C6638 004C1E58  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804C663C 004C1E5C  4E 80 00 20 */	blr
.endfn fn_804C6614

# 0x8053506C - 0x80535070
.section .ctors, "a"
.balign 4
	.4byte fn_804C6614
