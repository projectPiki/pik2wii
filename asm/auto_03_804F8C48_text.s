.include "macros.inc"
.file "auto_03_804F8C48_text"

# 0x804F8C48 - 0x804F8C98
.text
.balign 4

.fn fn_804F8C48, global
/* 804F8C48 004F4468  80 A4 00 00 */	lwz r5, 0x0(r4)
/* 804F8C4C 004F446C  80 04 00 04 */	lwz r0, 0x4(r4)
/* 804F8C50 004F4470  90 A3 00 00 */	stw r5, 0x0(r3)
/* 804F8C54 004F4474  90 03 00 04 */	stw r0, 0x4(r3)
/* 804F8C58 004F4478  4E 80 00 20 */	blr
.endfn fn_804F8C48

.fn fn_804F8C5C, global
/* 804F8C5C 004F447C  C0 24 00 04 */	lfs f1, 0x4(r4)
/* 804F8C60 004F4480  C0 04 00 08 */	lfs f0, 0x8(r4)
/* 804F8C64 004F4484  D0 03 00 00 */	stfs f0, 0x0(r3)
/* 804F8C68 004F4488  D0 23 00 04 */	stfs f1, 0x4(r3)
/* 804F8C6C 004F448C  4E 80 00 20 */	blr
.endfn fn_804F8C5C

.fn fn_804F8C70, global
/* 804F8C70 004F4490  80 A4 00 08 */	lwz r5, 0x8(r4)
/* 804F8C74 004F4494  80 04 00 0C */	lwz r0, 0xc(r4)
/* 804F8C78 004F4498  90 A3 00 00 */	stw r5, 0x0(r3)
/* 804F8C7C 004F449C  90 03 00 04 */	stw r0, 0x4(r3)
/* 804F8C80 004F44A0  4E 80 00 20 */	blr
.endfn fn_804F8C70

.fn fn_804F8C84, global
/* 804F8C84 004F44A4  C0 24 00 0C */	lfs f1, 0xc(r4)
/* 804F8C88 004F44A8  C0 04 00 00 */	lfs f0, 0x0(r4)
/* 804F8C8C 004F44AC  D0 03 00 00 */	stfs f0, 0x0(r3)
/* 804F8C90 004F44B0  D0 23 00 04 */	stfs f1, 0x4(r3)
/* 804F8C94 004F44B4  4E 80 00 20 */	blr
.endfn fn_804F8C84
