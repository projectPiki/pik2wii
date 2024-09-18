.include "macros.inc"
.file "auto_fn_8009C440_text"

# 0x8009C440 - 0x8009C460
.text
.balign 4

.fn fn_8009C440, global
/* 8009C440 00097C60  3C 80 80 66 */	lis r4, lbl_80665CA0@ha
/* 8009C444 00097C64  C0 02 8A E8 */	lfs f0, lbl_8066DFC8@sda21(r0)
/* 8009C448 00097C68  38 64 5C A0 */	addi r3, r4, lbl_80665CA0@l
/* 8009C44C 00097C6C  D0 04 5C A0 */	stfs f0, lbl_80665CA0@l(r4)
/* 8009C450 00097C70  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8009C454 00097C74  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8009C458 00097C78  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 8009C45C 00097C7C  4E 80 00 20 */	blr
.endfn fn_8009C440

# 0x80534D20 - 0x80534D24
.section .ctors, "a"
.balign 4
	.4byte fn_8009C440
