.include "macros.inc"
.file "auto_03_804F95C8_text"

# 0x804F95C8 - 0x804F95EC
.text
.balign 4

.fn fn_804F95C8, global
/* 804F95C8 004F4DE8  98 A3 00 0D */	stb r5, 0xd(r3)
/* 804F95CC 004F4DEC  54 A5 06 3E */	clrlwi r5, r5, 24
/* 804F95D0 004F4DF0  98 83 00 0C */	stb r4, 0xc(r3)
/* 804F95D4 004F4DF4  7D 04 43 78 */	mr r4, r8
/* 804F95D8 004F4DF8  98 C3 00 16 */	stb r6, 0x16(r3)
/* 804F95DC 004F4DFC  54 E6 04 3E */	clrlwi r6, r7, 16
/* 804F95E0 004F4E00  B0 E3 00 14 */	sth r7, 0x14(r3)
/* 804F95E4 004F4E04  91 03 00 10 */	stw r8, 0x10(r3)
/* 804F95E8 004F4E08  4B C2 D8 B0 */	b fn_80126E98
.endfn fn_804F95C8
