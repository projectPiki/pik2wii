.include "macros.inc"
.file "auto_fn_800E99F8_text"

# 0x800E99F8 - 0x800E9A18
.text
.balign 4

.fn fn_800E99F8, global
/* 800E99F8 000E5218  80 8D 82 40 */	lwz r4, lbl_8066AA40@sda21(r0)
/* 800E99FC 000E521C  80 6D 82 38 */	lwz r3, lbl_8066AA38@sda21(r0)
/* 800E9A00 000E5220  80 0D 82 3C */	lwz r0, lbl_8066AA3C@sda21(r0)
/* 800E9A04 000E5224  7C 63 22 14 */	add r3, r3, r4
/* 800E9A08 000E5228  7C 00 1A 14 */	add r0, r0, r3
/* 800E9A0C 000E522C  90 6D 96 C0 */	stw r3, lbl_8066BEC0@sda21(r0)
/* 800E9A10 000E5230  90 0D 96 C4 */	stw r0, lbl_8066BEC4@sda21(r0)
/* 800E9A14 000E5234  4E 80 00 20 */	blr
.endfn fn_800E99F8

# 0x80534D2C - 0x80534D30
.section .ctors, "a"
.balign 4
	.4byte fn_800E99F8
