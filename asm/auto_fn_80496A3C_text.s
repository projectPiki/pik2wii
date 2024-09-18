.include "macros.inc"
.file "auto_fn_80496A3C_text"

# 0x80496A3C - 0x80496A48
.text
.balign 4

.fn fn_80496A3C, global
/* 80496A3C 0049225C  C0 02 FF C8 */	lfs f0, lbl_806754A8@sda21(r0)
/* 80496A40 00492260  D0 0D A9 70 */	stfs f0, lbl_8066D170@sda21(r0)
/* 80496A44 00492264  4E 80 00 20 */	blr
.endfn fn_80496A3C

# 0x80534FFC - 0x80535000
.section .ctors, "a"
.balign 4
	.4byte fn_80496A3C
