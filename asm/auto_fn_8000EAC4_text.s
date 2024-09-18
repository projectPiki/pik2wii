.include "macros.inc"
.file "auto_fn_8000EAC4_text"

# 0x8000EAC4 - 0x8000EAE0
.text
.balign 4

.fn fn_8000EAC4, global
/* 8000EAC4 0000A2E4  3C 60 80 00 */	lis r3, 0x8000
/* 8000EAC8 0000A2E8  38 00 00 00 */	li r0, 0x0
/* 8000EACC 0000A2EC  80 63 00 F8 */	lwz r3, 0xf8(r3)
/* 8000EAD0 0000A2F0  90 0D 90 C8 */	stw r0, lbl_8066B8C8@sda21(r0)
/* 8000EAD4 0000A2F4  54 60 F0 BE */	srwi r0, r3, 2
/* 8000EAD8 0000A2F8  90 0D 90 CC */	stw r0, lbl_8066B8CC@sda21(r0)
/* 8000EADC 0000A2FC  4E 80 00 20 */	blr
.endfn fn_8000EAC4

# 0x80534C84 - 0x80534C88
.section .ctors, "a"
.balign 4
	.4byte fn_8000EAC4
