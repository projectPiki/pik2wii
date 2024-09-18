.include "macros.inc"
.file "auto_fn_802BD320_text"

# 0x802BD320 - 0x802BD34C
.text
.balign 4

.fn fn_802BD320, global
/* 802BD320 002B8B40  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802BD324 002B8B44  38 00 FF FF */	li r0, -0x1
/* 802BD328 002B8B48  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802BD32C 002B8B4C  3C 80 80 64 */	lis r4, lbl_80638DA8@ha
/* 802BD330 002B8B50  38 64 8D A8 */	addi r3, r4, lbl_80638DA8@l
/* 802BD334 002B8B54  90 0D A4 30 */	stw r0, lbl_8066CC30@sda21(r0)
/* 802BD338 002B8B58  D0 0D A4 34 */	stfs f0, lbl_8066CC34@sda21(r0)
/* 802BD33C 002B8B5C  D0 04 8D A8 */	stfs f0, lbl_80638DA8@l(r4)
/* 802BD340 002B8B60  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802BD344 002B8B64  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802BD348 002B8B68  4E 80 00 20 */	blr
.endfn fn_802BD320

# 0x80534E50 - 0x80534E54
.section .ctors, "a"
.balign 4
	.4byte fn_802BD320
