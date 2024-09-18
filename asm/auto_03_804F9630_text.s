.include "macros.inc"
.file "auto_03_804F9630_text"

# 0x804F9630 - 0x804F964C
.text
.balign 4

.fn fn_804F9630, global
/* 804F9630 004F4E50  88 0D AB B8 */	lbz r0, lbl_8066D3B8@sda21(r0)
/* 804F9634 004F4E54  2C 00 00 00 */	cmpwi r0, 0x0
/* 804F9638 004F4E58  41 82 00 0C */	beq .L_804F9644
/* 804F963C 004F4E5C  C0 2D 8F D0 */	lfs f1, lbl_8066B7D0@sda21(r0)
/* 804F9640 004F4E60  4E 80 00 20 */	blr
.L_804F9644:
/* 804F9644 004F4E64  C0 22 09 38 */	lfs f1, lbl_80675E18@sda21(r0)
/* 804F9648 004F4E68  4E 80 00 20 */	blr
.endfn fn_804F9630
