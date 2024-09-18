.include "macros.inc"
.file "auto_03_804F9AC0_text"

# 0x804F9AC0 - 0x804F9AD4
.text
.balign 4

.fn fn_804F9AC0, global
/* 804F9AC0 004F52E0  D0 23 00 50 */	stfs f1, 0x50(r3)
/* 804F9AC4 004F52E4  D0 43 00 54 */	stfs f2, 0x54(r3)
/* 804F9AC8 004F52E8  D0 63 00 58 */	stfs f3, 0x58(r3)
/* 804F9ACC 004F52EC  D0 83 00 5C */	stfs f4, 0x5c(r3)
/* 804F9AD0 004F52F0  4E 80 00 20 */	blr
.endfn fn_804F9AC0
