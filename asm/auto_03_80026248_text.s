.include "macros.inc"
.file "auto_03_80026248_text"

# 0x80026248 - 0x80026314
.text
.balign 4

.fn fn_80026248, global
/* 80026248 00021A68  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002624C 00021A6C  7C 08 02 A6 */	mflr r0
/* 80026250 00021A70  90 01 00 14 */	stw r0, 0x14(r1)
/* 80026254 00021A74  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80026258 00021A78  7C 9F 23 78 */	mr r31, r4
/* 8002625C 00021A7C  93 C1 00 08 */	stw r30, 0x8(r1)
/* 80026260 00021A80  7C 7E 1B 78 */	mr r30, r3
/* 80026264 00021A84  7F E3 FB 78 */	mr r3, r31
/* 80026268 00021A88  48 4D 48 45 */	bl fn_804FAAAC
/* 8002626C 00021A8C  38 7E 00 0C */	addi r3, r30, 0xc
/* 80026270 00021A90  7F E4 FB 78 */	mr r4, r31
/* 80026274 00021A94  48 4D 48 71 */	bl fn_804FAAE4
/* 80026278 00021A98  80 BE 00 14 */	lwz r5, 0x14(r30)
/* 8002627C 00021A9C  7F C3 F3 78 */	mr r3, r30
/* 80026280 00021AA0  7F E4 FB 78 */	mr r4, r31
/* 80026284 00021AA4  38 05 00 01 */	addi r0, r5, 0x1
/* 80026288 00021AA8  90 1E 00 14 */	stw r0, 0x14(r30)
/* 8002628C 00021AAC  81 9E 00 00 */	lwz r12, 0x0(r30)
/* 80026290 00021AB0  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 80026294 00021AB4  7D 89 03 A6 */	mtctr r12
/* 80026298 00021AB8  4E 80 04 21 */	bctrl
/* 8002629C 00021ABC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800262A0 00021AC0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800262A4 00021AC4  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 800262A8 00021AC8  7C 08 03 A6 */	mtlr r0
/* 800262AC 00021ACC  38 21 00 10 */	addi r1, r1, 0x10
/* 800262B0 00021AD0  4E 80 00 20 */	blr
.endfn fn_80026248

.fn fn_800262B4, global
/* 800262B4 00021AD4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800262B8 00021AD8  7C 08 02 A6 */	mflr r0
/* 800262BC 00021ADC  90 01 00 14 */	stw r0, 0x14(r1)
/* 800262C0 00021AE0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800262C4 00021AE4  7C 9F 23 78 */	mr r31, r4
/* 800262C8 00021AE8  93 C1 00 08 */	stw r30, 0x8(r1)
/* 800262CC 00021AEC  7C 7E 1B 78 */	mr r30, r3
/* 800262D0 00021AF0  7F E3 FB 78 */	mr r3, r31
/* 800262D4 00021AF4  48 4D 47 D9 */	bl fn_804FAAAC
/* 800262D8 00021AF8  81 9E 00 00 */	lwz r12, 0x0(r30)
/* 800262DC 00021AFC  7F C3 F3 78 */	mr r3, r30
/* 800262E0 00021B00  7F E4 FB 78 */	mr r4, r31
/* 800262E4 00021B04  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 800262E8 00021B08  7D 89 03 A6 */	mtctr r12
/* 800262EC 00021B0C  4E 80 04 21 */	bctrl
/* 800262F0 00021B10  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800262F4 00021B14  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800262F8 00021B18  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 800262FC 00021B1C  7C 08 03 A6 */	mtlr r0
/* 80026300 00021B20  38 21 00 10 */	addi r1, r1, 0x10
/* 80026304 00021B24  4E 80 00 20 */	blr
.endfn fn_800262B4

.fn fn_80026308, global
/* 80026308 00021B28  4E 80 00 20 */	blr
.endfn fn_80026308

.fn fn_8002630C, global
/* 8002630C 00021B2C  4E 80 00 20 */	blr
.endfn fn_8002630C

.fn fn_80026310, global
/* 80026310 00021B30  4E 80 00 20 */	blr
.endfn fn_80026310