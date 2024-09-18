.include "macros.inc"
.file "auto_fn_8042EA28_text"

# 0x8042EA28 - 0x8042EA54
.text
.balign 4

.fn fn_8042EA28, global
/* 8042EA28 0042A248  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8042EA2C 0042A24C  38 00 FF FF */	li r0, -0x1
/* 8042EA30 0042A250  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8042EA34 0042A254  3C 80 80 64 */	lis r4, lbl_80639398@ha
/* 8042EA38 0042A258  38 64 93 98 */	addi r3, r4, lbl_80639398@l
/* 8042EA3C 0042A25C  90 0D A8 08 */	stw r0, lbl_8066D008@sda21(r0)
/* 8042EA40 0042A260  D0 0D A8 0C */	stfs f0, lbl_8066D00C@sda21(r0)
/* 8042EA44 0042A264  D0 04 93 98 */	stfs f0, lbl_80639398@l(r4)
/* 8042EA48 0042A268  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8042EA4C 0042A26C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8042EA50 0042A270  4E 80 00 20 */	blr
.endfn fn_8042EA28

# 0x80534F98 - 0x80534F9C
.section .ctors, "a"
.balign 4
	.4byte fn_8042EA28
