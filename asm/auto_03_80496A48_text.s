.include "macros.inc"
.file "auto_03_80496A48_text"

# 0x80496A48 - 0x804973C0
.text
.balign 4

.fn fn_80496A48, global
/* 80496A48 00492268  38 63 FF E8 */	subi r3, r3, 0x18
/* 80496A4C 0049226C  4B FF FF 0C */	b fn_80496958
.endfn fn_80496A48

.fn fn_80496A50, global
/* 80496A50 00492270  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80496A54 00492274  7C 08 02 A6 */	mflr r0
/* 80496A58 00492278  90 01 00 14 */	stw r0, 0x14(r1)
/* 80496A5C 0049227C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80496A60 00492280  7C 7F 1B 78 */	mr r31, r3
/* 80496A64 00492284  48 04 26 15 */	bl fn_804D9078
/* 80496A68 00492288  3C 80 80 5D */	lis r4, lbl_805CC490@ha
/* 80496A6C 0049228C  38 A0 00 00 */	li r5, 0x0
/* 80496A70 00492290  38 84 C4 90 */	addi r4, r4, lbl_805CC490@l
/* 80496A74 00492294  C0 02 FF D0 */	lfs f0, lbl_806754B0@sda21(r0)
/* 80496A78 00492298  38 64 00 10 */	addi r3, r4, 0x10
/* 80496A7C 0049229C  90 9F 00 00 */	stw r4, 0x0(r31)
/* 80496A80 004922A0  38 00 00 02 */	li r0, 0x2
/* 80496A84 004922A4  90 7F 00 18 */	stw r3, 0x18(r31)
/* 80496A88 004922A8  7F E3 FB 78 */	mr r3, r31
/* 80496A8C 004922AC  90 BF 00 38 */	stw r5, 0x38(r31)
/* 80496A90 004922B0  90 BF 00 40 */	stw r5, 0x40(r31)
/* 80496A94 004922B4  90 BF 00 48 */	stw r5, 0x48(r31)
/* 80496A98 004922B8  90 BF 00 50 */	stw r5, 0x50(r31)
/* 80496A9C 004922BC  90 BF 00 58 */	stw r5, 0x58(r31)
/* 80496AA0 004922C0  90 BF 00 60 */	stw r5, 0x60(r31)
/* 80496AA4 004922C4  D0 1F 00 80 */	stfs f0, 0x80(r31)
/* 80496AA8 004922C8  D0 1F 00 78 */	stfs f0, 0x78(r31)
/* 80496AAC 004922CC  D0 1F 00 70 */	stfs f0, 0x70(r31)
/* 80496AB0 004922D0  D0 1F 00 68 */	stfs f0, 0x68(r31)
/* 80496AB4 004922D4  D0 1F 00 88 */	stfs f0, 0x88(r31)
/* 80496AB8 004922D8  90 BF 00 3C */	stw r5, 0x3c(r31)
/* 80496ABC 004922DC  90 BF 00 44 */	stw r5, 0x44(r31)
/* 80496AC0 004922E0  90 BF 00 4C */	stw r5, 0x4c(r31)
/* 80496AC4 004922E4  90 BF 00 54 */	stw r5, 0x54(r31)
/* 80496AC8 004922E8  90 BF 00 5C */	stw r5, 0x5c(r31)
/* 80496ACC 004922EC  90 BF 00 64 */	stw r5, 0x64(r31)
/* 80496AD0 004922F0  D0 1F 00 84 */	stfs f0, 0x84(r31)
/* 80496AD4 004922F4  D0 1F 00 7C */	stfs f0, 0x7c(r31)
/* 80496AD8 004922F8  D0 1F 00 74 */	stfs f0, 0x74(r31)
/* 80496ADC 004922FC  D0 1F 00 6C */	stfs f0, 0x6c(r31)
/* 80496AE0 00492300  D0 1F 00 8C */	stfs f0, 0x8c(r31)
/* 80496AE4 00492304  98 BF 00 90 */	stb r5, 0x90(r31)
/* 80496AE8 00492308  90 BF 00 94 */	stw r5, 0x94(r31)
/* 80496AEC 0049230C  90 1F 00 98 */	stw r0, 0x98(r31)
/* 80496AF0 00492310  98 BF 00 9C */	stb r5, 0x9c(r31)
/* 80496AF4 00492314  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80496AF8 00492318  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80496AFC 0049231C  7C 08 03 A6 */	mtlr r0
/* 80496B00 00492320  38 21 00 10 */	addi r1, r1, 0x10
/* 80496B04 00492324  4E 80 00 20 */	blr
.endfn fn_80496A50

.fn fn_80496B08, global
/* 80496B08 00492328  94 21 FF 50 */	stwu r1, -0xb0(r1)
/* 80496B0C 0049232C  7C 08 02 A6 */	mflr r0
/* 80496B10 00492330  90 01 00 B4 */	stw r0, 0xb4(r1)
/* 80496B14 00492334  39 61 00 B0 */	addi r11, r1, 0xb0
/* 80496B18 00492338  4B C6 D6 A9 */	bl _savegpr_17
/* 80496B1C 0049233C  3C A0 80 56 */	lis r5, lbl_80558CE0@ha
/* 80496B20 00492340  86 25 8C E0 */	lwzu r17, lbl_80558CE0@l(r5)
/* 80496B24 00492344  3F 60 80 56 */	lis r27, lbl_80558D08@ha
/* 80496B28 00492348  87 5B 8D 08 */	lwzu r26, lbl_80558D08@l(r27)
/* 80496B2C 0049234C  82 45 00 04 */	lwz r18, 0x4(r5)
/* 80496B30 00492350  7C 99 23 78 */	mr r25, r4
/* 80496B34 00492354  38 00 00 00 */	li r0, 0x0
/* 80496B38 00492358  82 65 00 08 */	lwz r19, 0x8(r5)
/* 80496B3C 0049235C  82 85 00 0C */	lwz r20, 0xc(r5)
/* 80496B40 00492360  7C 78 1B 78 */	mr r24, r3
/* 80496B44 00492364  82 A5 00 10 */	lwz r21, 0x10(r5)
/* 80496B48 00492368  83 E5 00 14 */	lwz r31, 0x14(r5)
/* 80496B4C 0049236C  83 C5 00 18 */	lwz r30, 0x18(r5)
/* 80496B50 00492370  83 A5 00 1C */	lwz r29, 0x1c(r5)
/* 80496B54 00492374  83 85 00 20 */	lwz r28, 0x20(r5)
/* 80496B58 00492378  82 FB 00 04 */	lwz r23, 0x4(r27)
/* 80496B5C 0049237C  82 DB 00 08 */	lwz r22, 0x8(r27)
/* 80496B60 00492380  81 9B 00 0C */	lwz r12, 0xc(r27)
/* 80496B64 00492384  81 7B 00 10 */	lwz r11, 0x10(r27)
/* 80496B68 00492388  81 5B 00 14 */	lwz r10, 0x14(r27)
/* 80496B6C 0049238C  81 3B 00 18 */	lwz r9, 0x18(r27)
/* 80496B70 00492390  81 1B 00 1C */	lwz r8, 0x1c(r27)
/* 80496B74 00492394  80 FB 00 20 */	lwz r7, 0x20(r27)
/* 80496B78 00492398  80 DB 00 24 */	lwz r6, 0x24(r27)
/* 80496B7C 0049239C  80 BB 00 28 */	lwz r5, 0x28(r27)
/* 80496B80 004923A0  80 9B 00 2C */	lwz r4, 0x2c(r27)
/* 80496B84 004923A4  92 21 00 40 */	stw r17, 0x40(r1)
/* 80496B88 004923A8  92 41 00 44 */	stw r18, 0x44(r1)
/* 80496B8C 004923AC  92 61 00 48 */	stw r19, 0x48(r1)
/* 80496B90 004923B0  92 81 00 4C */	stw r20, 0x4c(r1)
/* 80496B94 004923B4  92 A1 00 50 */	stw r21, 0x50(r1)
/* 80496B98 004923B8  93 E1 00 54 */	stw r31, 0x54(r1)
/* 80496B9C 004923BC  93 C1 00 58 */	stw r30, 0x58(r1)
/* 80496BA0 004923C0  93 A1 00 5C */	stw r29, 0x5c(r1)
/* 80496BA4 004923C4  93 81 00 60 */	stw r28, 0x60(r1)
/* 80496BA8 004923C8  93 41 00 10 */	stw r26, 0x10(r1)
/* 80496BAC 004923CC  92 E1 00 14 */	stw r23, 0x14(r1)
/* 80496BB0 004923D0  92 C1 00 18 */	stw r22, 0x18(r1)
/* 80496BB4 004923D4  91 81 00 1C */	stw r12, 0x1c(r1)
/* 80496BB8 004923D8  91 61 00 20 */	stw r11, 0x20(r1)
/* 80496BBC 004923DC  91 41 00 24 */	stw r10, 0x24(r1)
/* 80496BC0 004923E0  91 21 00 28 */	stw r9, 0x28(r1)
/* 80496BC4 004923E4  91 01 00 2C */	stw r8, 0x2c(r1)
/* 80496BC8 004923E8  90 E1 00 30 */	stw r7, 0x30(r1)
/* 80496BCC 004923EC  90 C1 00 34 */	stw r6, 0x34(r1)
/* 80496BD0 004923F0  90 A1 00 38 */	stw r5, 0x38(r1)
/* 80496BD4 004923F4  90 81 00 3C */	stw r4, 0x3c(r1)
/* 80496BD8 004923F8  90 01 00 08 */	stw r0, 0x8(r1)
/* 80496BDC 004923FC  90 01 00 0C */	stw r0, 0xc(r1)
/* 80496BE0 00492400  48 04 29 0D */	bl fn_804D94EC
/* 80496BE4 00492404  3C 80 4C 4F */	lis r4, 0x4c4f
/* 80496BE8 00492408  3C A0 57 49 */	lis r5, 0x5749
/* 80496BEC 0049240C  38 C4 53 45 */	addi r6, r4, 0x5345
/* 80496BF0 00492410  38 80 4B 48 */	li r4, 0x4b48
/* 80496BF4 00492414  38 A5 4E 5F */	addi r5, r5, 0x4e5f
/* 80496BF8 00492418  4B EF 16 E5 */	bl fn_803882DC
/* 80496BFC 0049241C  2C 03 00 00 */	cmpwi r3, 0x0
/* 80496C00 00492420  40 82 00 1C */	bne .L_80496C1C
/* 80496C04 00492424  3C 60 80 56 */	lis r3, lbl_80558D38@ha
/* 80496C08 00492428  38 80 00 4F */	li r4, 0x4f
/* 80496C0C 0049242C  38 63 8D 38 */	addi r3, r3, lbl_80558D38@l
/* 80496C10 00492430  38 A3 01 04 */	addi r5, r3, 0x104
/* 80496C14 00492434  4C C6 31 82 */	crclr cr1eq
/* 80496C18 00492438  4B BF 80 E9 */	bl fn_8008ED00
.L_80496C1C:
/* 80496C1C 0049243C  7F 03 C3 78 */	mr r3, r24
/* 80496C20 00492440  48 04 28 CD */	bl fn_804D94EC
/* 80496C24 00492444  80 03 00 08 */	lwz r0, 0x8(r3)
/* 80496C28 00492448  7C 7D 1B 78 */	mr r29, r3
/* 80496C2C 0049244C  2C 00 00 03 */	cmpwi r0, 0x3
/* 80496C30 00492450  41 82 00 50 */	beq .L_80496C80
/* 80496C34 00492454  40 80 00 14 */	bge .L_80496C48
/* 80496C38 00492458  2C 00 00 01 */	cmpwi r0, 0x1
/* 80496C3C 0049245C  41 82 00 1C */	beq .L_80496C58
/* 80496C40 00492460  40 80 00 2C */	bge .L_80496C6C
/* 80496C44 00492464  48 00 00 74 */	b .L_80496CB8
.L_80496C48:
/* 80496C48 00492468  2C 00 00 05 */	cmpwi r0, 0x5
/* 80496C4C 0049246C  41 82 00 60 */	beq .L_80496CAC
/* 80496C50 00492470  40 80 00 68 */	bge .L_80496CB8
/* 80496C54 00492474  48 00 00 3C */	b .L_80496C90
.L_80496C58:
/* 80496C58 00492478  38 60 00 00 */	li r3, 0x0
/* 80496C5C 0049247C  38 00 00 01 */	li r0, 0x1
/* 80496C60 00492480  90 61 00 08 */	stw r3, 0x8(r1)
/* 80496C64 00492484  90 01 00 0C */	stw r0, 0xc(r1)
/* 80496C68 00492488  48 00 00 50 */	b .L_80496CB8
.L_80496C6C:
/* 80496C6C 0049248C  38 60 00 01 */	li r3, 0x1
/* 80496C70 00492490  38 00 00 00 */	li r0, 0x0
/* 80496C74 00492494  90 61 00 08 */	stw r3, 0x8(r1)
/* 80496C78 00492498  90 01 00 0C */	stw r0, 0xc(r1)
/* 80496C7C 0049249C  48 00 00 3C */	b .L_80496CB8
.L_80496C80:
/* 80496C80 004924A0  38 00 00 03 */	li r0, 0x3
/* 80496C84 004924A4  90 01 00 08 */	stw r0, 0x8(r1)
/* 80496C88 004924A8  90 01 00 0C */	stw r0, 0xc(r1)
/* 80496C8C 004924AC  48 00 00 2C */	b .L_80496CB8
.L_80496C90:
/* 80496C90 004924B0  38 00 00 02 */	li r0, 0x2
/* 80496C94 004924B4  38 60 FF FF */	li r3, -0x1
/* 80496C98 004924B8  90 01 00 08 */	stw r0, 0x8(r1)
/* 80496C9C 004924BC  38 00 00 01 */	li r0, 0x1
/* 80496CA0 004924C0  90 61 00 0C */	stw r3, 0xc(r1)
/* 80496CA4 004924C4  90 18 00 98 */	stw r0, 0x98(r24)
/* 80496CA8 004924C8  48 00 00 10 */	b .L_80496CB8
.L_80496CAC:
/* 80496CAC 004924CC  38 00 00 02 */	li r0, 0x2
/* 80496CB0 004924D0  90 01 00 08 */	stw r0, 0x8(r1)
/* 80496CB4 004924D4  90 01 00 0C */	stw r0, 0xc(r1)
.L_80496CB8:
/* 80496CB8 004924D8  7F 1C C3 78 */	mr r28, r24
/* 80496CBC 004924DC  3B 61 00 08 */	addi r27, r1, 0x8
/* 80496CC0 004924E0  3B C1 00 40 */	addi r30, r1, 0x40
/* 80496CC4 004924E4  3A C1 00 10 */	addi r22, r1, 0x10
/* 80496CC8 004924E8  3B 40 00 00 */	li r26, 0x0
/* 80496CCC 004924EC  3B E0 00 01 */	li r31, 0x1
/* 80496CD0 004924F0  3E E0 52 4F */	lis r23, 0x524f
/* 80496CD4 004924F4  48 00 01 B4 */	b .L_80496E88
.L_80496CD8:
/* 80496CD8 004924F8  80 1D 00 08 */	lwz r0, 0x8(r29)
/* 80496CDC 004924FC  2C 00 00 03 */	cmpwi r0, 0x3
/* 80496CE0 00492500  41 82 00 A8 */	beq .L_80496D88
/* 80496CE4 00492504  38 60 01 40 */	li r3, 0x140
/* 80496CE8 00492508  4B BF 1C 61 */	bl fn_80088948
/* 80496CEC 0049250C  2C 03 00 00 */	cmpwi r3, 0x0
/* 80496CF0 00492510  41 82 00 08 */	beq .L_80496CF8
/* 80496CF4 00492514  48 02 5A F5 */	bl fn_804BC7E8
.L_80496CF8:
/* 80496CF8 00492518  90 7C 00 38 */	stw r3, 0x38(r28)
/* 80496CFC 0049251C  7F 26 CB 78 */	mr r6, r25
/* 80496D00 00492520  3C A0 00 04 */	lis r5, 0x4
/* 80496D04 00492524  80 1B 00 00 */	lwz r0, 0x0(r27)
/* 80496D08 00492528  1C 00 00 0C */	mulli r0, r0, 0xc
/* 80496D0C 0049252C  7C 9E 00 2E */	lwzx r4, r30, r0
/* 80496D10 00492530  4B C0 BA 19 */	bl fn_800A2728
/* 80496D14 00492534  80 1B 00 00 */	lwz r0, 0x0(r27)
/* 80496D18 00492538  7F 24 CB 78 */	mr r4, r25
/* 80496D1C 0049253C  1C 00 00 0C */	mulli r0, r0, 0xc
/* 80496D20 00492540  7C 7E 02 14 */	add r3, r30, r0
/* 80496D24 00492544  80 63 00 04 */	lwz r3, 0x4(r3)
/* 80496D28 00492548  4B BF 08 75 */	bl fn_8008759C
/* 80496D2C 0049254C  4B C1 3B 45 */	bl fn_800AA870
/* 80496D30 00492550  90 7C 00 48 */	stw r3, 0x48(r28)
/* 80496D34 00492554  7F 24 CB 78 */	mr r4, r25
/* 80496D38 00492558  80 1B 00 00 */	lwz r0, 0x0(r27)
/* 80496D3C 0049255C  1C 00 00 0C */	mulli r0, r0, 0xc
/* 80496D40 00492560  7C 7E 02 14 */	add r3, r30, r0
/* 80496D44 00492564  80 63 00 08 */	lwz r3, 0x8(r3)
/* 80496D48 00492568  4B BF 08 55 */	bl fn_8008759C
/* 80496D4C 0049256C  4B C1 3B 25 */	bl fn_800AA870
/* 80496D50 00492570  90 7C 00 58 */	stw r3, 0x58(r28)
/* 80496D54 00492574  80 7C 00 38 */	lwz r3, 0x38(r28)
/* 80496D58 00492578  80 9C 00 48 */	lwz r4, 0x48(r28)
/* 80496D5C 0049257C  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80496D60 00492580  81 8C 00 60 */	lwz r12, 0x60(r12)
/* 80496D64 00492584  7D 89 03 A6 */	mtctr r12
/* 80496D68 00492588  4E 80 04 21 */	bctrl
/* 80496D6C 0049258C  80 7C 00 38 */	lwz r3, 0x38(r28)
/* 80496D70 00492590  80 9C 00 58 */	lwz r4, 0x58(r28)
/* 80496D74 00492594  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80496D78 00492598  81 8C 00 64 */	lwz r12, 0x64(r12)
/* 80496D7C 0049259C  7D 89 03 A6 */	mtctr r12
/* 80496D80 004925A0  4E 80 04 21 */	bctrl
/* 80496D84 004925A4  48 00 00 08 */	b .L_80496D8C
.L_80496D88:
/* 80496D88 004925A8  9B F8 00 90 */	stb r31, 0x90(r24)
.L_80496D8C:
/* 80496D8C 004925AC  38 60 01 40 */	li r3, 0x140
/* 80496D90 004925B0  4B BF 1B B9 */	bl fn_80088948
/* 80496D94 004925B4  2C 03 00 00 */	cmpwi r3, 0x0
/* 80496D98 004925B8  41 82 00 08 */	beq .L_80496DA0
/* 80496D9C 004925BC  48 02 5A 4D */	bl fn_804BC7E8
.L_80496DA0:
/* 80496DA0 004925C0  90 7C 00 40 */	stw r3, 0x40(r28)
/* 80496DA4 004925C4  7F 26 CB 78 */	mr r6, r25
/* 80496DA8 004925C8  3C A0 00 04 */	lis r5, 0x4
/* 80496DAC 004925CC  80 1B 00 00 */	lwz r0, 0x0(r27)
/* 80496DB0 004925D0  1C 00 00 0C */	mulli r0, r0, 0xc
/* 80496DB4 004925D4  7C 96 00 2E */	lwzx r4, r22, r0
/* 80496DB8 004925D8  4B C0 B9 71 */	bl fn_800A2728
/* 80496DBC 004925DC  80 1B 00 00 */	lwz r0, 0x0(r27)
/* 80496DC0 004925E0  7F 24 CB 78 */	mr r4, r25
/* 80496DC4 004925E4  1C 00 00 0C */	mulli r0, r0, 0xc
/* 80496DC8 004925E8  7C 76 02 14 */	add r3, r22, r0
/* 80496DCC 004925EC  80 63 00 04 */	lwz r3, 0x4(r3)
/* 80496DD0 004925F0  4B BF 07 CD */	bl fn_8008759C
/* 80496DD4 004925F4  4B C1 3A 9D */	bl fn_800AA870
/* 80496DD8 004925F8  90 7C 00 50 */	stw r3, 0x50(r28)
/* 80496DDC 004925FC  7F 24 CB 78 */	mr r4, r25
/* 80496DE0 00492600  80 1B 00 00 */	lwz r0, 0x0(r27)
/* 80496DE4 00492604  1C 00 00 0C */	mulli r0, r0, 0xc
/* 80496DE8 00492608  7C 76 02 14 */	add r3, r22, r0
/* 80496DEC 0049260C  80 63 00 08 */	lwz r3, 0x8(r3)
/* 80496DF0 00492610  4B BF 07 AD */	bl fn_8008759C
/* 80496DF4 00492614  4B C1 3A 7D */	bl fn_800AA870
/* 80496DF8 00492618  90 7C 00 60 */	stw r3, 0x60(r28)
/* 80496DFC 0049261C  80 7C 00 40 */	lwz r3, 0x40(r28)
/* 80496E00 00492620  80 9C 00 50 */	lwz r4, 0x50(r28)
/* 80496E04 00492624  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80496E08 00492628  81 8C 00 60 */	lwz r12, 0x60(r12)
/* 80496E0C 0049262C  7D 89 03 A6 */	mtctr r12
/* 80496E10 00492630  4E 80 04 21 */	bctrl
/* 80496E14 00492634  80 7C 00 40 */	lwz r3, 0x40(r28)
/* 80496E18 00492638  80 9C 00 60 */	lwz r4, 0x60(r28)
/* 80496E1C 0049263C  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80496E20 00492640  81 8C 00 64 */	lwz r12, 0x64(r12)
/* 80496E24 00492644  7D 89 03 A6 */	mtctr r12
/* 80496E28 00492648  4E 80 04 21 */	bctrl
/* 80496E2C 0049264C  80 7C 00 40 */	lwz r3, 0x40(r28)
/* 80496E30 00492650  38 D7 4F 54 */	addi r6, r23, 0x4f54
/* 80496E34 00492654  38 A0 00 00 */	li r5, 0x0
/* 80496E38 00492658  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80496E3C 0049265C  81 8C 00 3C */	lwz r12, 0x3c(r12)
/* 80496E40 00492660  7D 89 03 A6 */	mtctr r12
/* 80496E44 00492664  4E 80 04 21 */	bctrl
/* 80496E48 00492668  4B FF A1 7D */	bl fn_80490FC4
/* 80496E4C 0049266C  80 7C 00 40 */	lwz r3, 0x40(r28)
/* 80496E50 00492670  38 D7 4F 54 */	addi r6, r23, 0x4f54
/* 80496E54 00492674  38 A0 00 00 */	li r5, 0x0
/* 80496E58 00492678  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80496E5C 0049267C  81 8C 00 3C */	lwz r12, 0x3c(r12)
/* 80496E60 00492680  7D 89 03 A6 */	mtctr r12
/* 80496E64 00492684  4E 80 04 21 */	bctrl
/* 80496E68 00492688  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80496E6C 0049268C  88 98 00 9C */	lbz r4, 0x9c(r24)
/* 80496E70 00492690  81 8C 00 24 */	lwz r12, 0x24(r12)
/* 80496E74 00492694  7D 89 03 A6 */	mtctr r12
/* 80496E78 00492698  4E 80 04 21 */	bctrl
/* 80496E7C 0049269C  3B 9C 00 04 */	addi r28, r28, 0x4
/* 80496E80 004926A0  3B 7B 00 04 */	addi r27, r27, 0x4
/* 80496E84 004926A4  3B 5A 00 01 */	addi r26, r26, 0x1
.L_80496E88:
/* 80496E88 004926A8  80 18 00 98 */	lwz r0, 0x98(r24)
/* 80496E8C 004926AC  7C 1A 00 00 */	cmpw r26, r0
/* 80496E90 004926B0  41 80 FE 48 */	blt .L_80496CD8
/* 80496E94 004926B4  2C 00 00 02 */	cmpwi r0, 0x2
/* 80496E98 004926B8  40 82 00 1C */	bne .L_80496EB4
/* 80496E9C 004926BC  3C 60 80 67 */	lis r3, lbl_8066A2CC@ha
/* 80496EA0 004926C0  38 63 A2 CC */	addi r3, r3, lbl_8066A2CC@l
/* 80496EA4 004926C4  C0 03 00 04 */	lfs f0, 0x4(r3)
/* 80496EA8 004926C8  D0 18 00 88 */	stfs f0, 0x88(r24)
/* 80496EAC 004926CC  C0 03 00 08 */	lfs f0, 0x8(r3)
/* 80496EB0 004926D0  D0 18 00 8C */	stfs f0, 0x8c(r24)
.L_80496EB4:
/* 80496EB4 004926D4  81 98 00 00 */	lwz r12, 0x0(r24)
/* 80496EB8 004926D8  7F 03 C3 78 */	mr r3, r24
/* 80496EBC 004926DC  81 8C 00 30 */	lwz r12, 0x30(r12)
/* 80496EC0 004926E0  7D 89 03 A6 */	mtctr r12
/* 80496EC4 004926E4  4E 80 04 21 */	bctrl
/* 80496EC8 004926E8  38 80 00 00 */	li r4, 0x0
/* 80496ECC 004926EC  38 A0 00 00 */	li r5, 0x0
/* 80496ED0 004926F0  38 C0 00 00 */	li r6, 0x0
/* 80496ED4 004926F4  38 E0 00 A0 */	li r7, 0xa0
/* 80496ED8 004926F8  48 04 09 CD */	bl fn_804D78A4
/* 80496EDC 004926FC  80 1D 00 08 */	lwz r0, 0x8(r29)
/* 80496EE0 00492700  2C 00 00 06 */	cmpwi r0, 0x6
/* 80496EE4 00492704  40 80 00 14 */	bge .L_80496EF8
/* 80496EE8 00492708  2C 00 00 04 */	cmpwi r0, 0x4
/* 80496EEC 0049270C  40 80 00 08 */	bge .L_80496EF4
/* 80496EF0 00492710  48 00 00 08 */	b .L_80496EF8
.L_80496EF4:
/* 80496EF4 00492714  48 05 A3 D5 */	bl fn_804F12C8
.L_80496EF8:
/* 80496EF8 00492718  39 61 00 B0 */	addi r11, r1, 0xb0
/* 80496EFC 0049271C  4B C6 D3 11 */	bl _restgpr_17
/* 80496F00 00492720  80 01 00 B4 */	lwz r0, 0xb4(r1)
/* 80496F04 00492724  7C 08 03 A6 */	mtlr r0
/* 80496F08 00492728  38 21 00 B0 */	addi r1, r1, 0xb0
/* 80496F0C 0049272C  4E 80 00 20 */	blr
.endfn fn_80496B08

.fn fn_80496F10, global
/* 80496F10 00492730  48 00 00 BC */	b fn_80496FCC
.endfn fn_80496F10

.fn fn_80496F14, global
/* 80496F14 00492734  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80496F18 00492738  7C 08 02 A6 */	mflr r0
/* 80496F1C 0049273C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80496F20 00492740  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80496F24 00492744  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80496F28 00492748  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80496F2C 0049274C  7C 9D 23 78 */	mr r29, r4
/* 80496F30 00492750  93 81 00 10 */	stw r28, 0x10(r1)
/* 80496F34 00492754  7C 7C 1B 78 */	mr r28, r3
/* 80496F38 00492758  38 64 00 BC */	addi r3, r4, 0xbc
/* 80496F3C 0049275C  81 84 00 BC */	lwz r12, 0xbc(r4)
/* 80496F40 00492760  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 80496F44 00492764  7D 89 03 A6 */	mtctr r12
/* 80496F48 00492768  4E 80 04 21 */	bctrl
/* 80496F4C 0049276C  7F 9F E3 78 */	mr r31, r28
/* 80496F50 00492770  3B C0 00 00 */	li r30, 0x0
/* 80496F54 00492774  48 00 00 4C */	b .L_80496FA0
.L_80496F58:
/* 80496F58 00492778  80 7F 00 38 */	lwz r3, 0x38(r31)
/* 80496F5C 0049277C  2C 03 00 00 */	cmpwi r3, 0x0
/* 80496F60 00492780  41 82 00 1C */	beq .L_80496F7C
/* 80496F64 00492784  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80496F68 00492788  7F A4 EB 78 */	mr r4, r29
/* 80496F6C 0049278C  38 BD 00 BC */	addi r5, r29, 0xbc
/* 80496F70 00492790  81 8C 00 9C */	lwz r12, 0x9c(r12)
/* 80496F74 00492794  7D 89 03 A6 */	mtctr r12
/* 80496F78 00492798  4E 80 04 21 */	bctrl
.L_80496F7C:
/* 80496F7C 0049279C  80 7F 00 40 */	lwz r3, 0x40(r31)
/* 80496F80 004927A0  7F A4 EB 78 */	mr r4, r29
/* 80496F84 004927A4  38 BD 00 BC */	addi r5, r29, 0xbc
/* 80496F88 004927A8  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80496F8C 004927AC  81 8C 00 9C */	lwz r12, 0x9c(r12)
/* 80496F90 004927B0  7D 89 03 A6 */	mtctr r12
/* 80496F94 004927B4  4E 80 04 21 */	bctrl
/* 80496F98 004927B8  3B FF 00 04 */	addi r31, r31, 0x4
/* 80496F9C 004927BC  3B DE 00 01 */	addi r30, r30, 0x1
.L_80496FA0:
/* 80496FA0 004927C0  80 1C 00 98 */	lwz r0, 0x98(r28)
/* 80496FA4 004927C4  7C 1E 00 00 */	cmpw r30, r0
/* 80496FA8 004927C8  41 80 FF B0 */	blt .L_80496F58
/* 80496FAC 004927CC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80496FB0 004927D0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80496FB4 004927D4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80496FB8 004927D8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80496FBC 004927DC  83 81 00 10 */	lwz r28, 0x10(r1)
/* 80496FC0 004927E0  7C 08 03 A6 */	mtlr r0
/* 80496FC4 004927E4  38 21 00 20 */	addi r1, r1, 0x20
/* 80496FC8 004927E8  4E 80 00 20 */	blr
.endfn fn_80496F14

.fn fn_80496FCC, global
/* 80496FCC 004927EC  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 80496FD0 004927F0  7C 08 02 A6 */	mflr r0
/* 80496FD4 004927F4  90 01 00 84 */	stw r0, 0x84(r1)
/* 80496FD8 004927F8  DB E1 00 70 */	stfd f31, 0x70(r1)
/* 80496FDC 004927FC  F3 E1 00 78 */	psq_st f31, 0x78(r1), 0, qr0
/* 80496FE0 00492800  DB C1 00 60 */	stfd f30, 0x60(r1)
/* 80496FE4 00492804  F3 C1 00 68 */	psq_st f30, 0x68(r1), 0, qr0
/* 80496FE8 00492808  DB A1 00 50 */	stfd f29, 0x50(r1)
/* 80496FEC 0049280C  F3 A1 00 58 */	psq_st f29, 0x58(r1), 0, qr0
/* 80496FF0 00492810  DB 81 00 40 */	stfd f28, 0x40(r1)
/* 80496FF4 00492814  F3 81 00 48 */	psq_st f28, 0x48(r1), 0, qr0
/* 80496FF8 00492818  39 61 00 40 */	addi r11, r1, 0x40
/* 80496FFC 0049281C  4B C6 D1 DD */	bl _savegpr_23
/* 80497000 00492820  3C 00 43 30 */	lis r0, 0x4330
/* 80497004 00492824  3F 60 80 67 */	lis r27, lbl_8066A2CC@ha
/* 80497008 00492828  7C 78 1B 78 */	mr r24, r3
/* 8049700C 0049282C  90 01 00 08 */	stw r0, 0x8(r1)
/* 80497010 00492830  CB A2 FF D8 */	lfd f29, lbl_806754B8@sda21(r0)
/* 80497014 00492834  7F 1A C3 78 */	mr r26, r24
/* 80497018 00492838  90 01 00 10 */	stw r0, 0x10(r1)
/* 8049701C 0049283C  3B 9B A2 CC */	addi r28, r27, lbl_8066A2CC@l
/* 80497020 00492840  C3 C2 FF D0 */	lfs f30, lbl_806754B0@sda21(r0)
/* 80497024 00492844  3B 20 00 00 */	li r25, 0x0
/* 80497028 00492848  C3 E2 FF D4 */	lfs f31, lbl_806754B4@sda21(r0)
/* 8049702C 0049284C  3B A0 00 01 */	li r29, 0x1
/* 80497030 00492850  3B C0 00 00 */	li r30, 0x0
/* 80497034 00492854  3F E0 52 4F */	lis r31, 0x524f
/* 80497038 00492858  3A E0 00 FF */	li r23, 0xff
/* 8049703C 0049285C  48 00 02 24 */	b .L_80497260
.L_80497040:
/* 80497040 00492860  80 1A 00 38 */	lwz r0, 0x38(r26)
/* 80497044 00492864  2C 00 00 00 */	cmpwi r0, 0x0
/* 80497048 00492868  41 82 00 EC */	beq .L_80497134
/* 8049704C 0049286C  C0 1A 00 68 */	lfs f0, 0x68(r26)
/* 80497050 00492870  80 7A 00 48 */	lwz r3, 0x48(r26)
/* 80497054 00492874  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80497058 00492878  C0 1A 00 78 */	lfs f0, 0x78(r26)
/* 8049705C 0049287C  80 7A 00 58 */	lwz r3, 0x58(r26)
/* 80497060 00492880  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80497064 00492884  80 7A 00 38 */	lwz r3, 0x38(r26)
/* 80497068 00492888  4B C0 C7 CD */	bl fn_800A3834
/* 8049706C 0049288C  C0 3A 00 68 */	lfs f1, 0x68(r26)
/* 80497070 00492890  C0 1B A2 CC */	lfs f0, lbl_8066A2CC@l(r27)
/* 80497074 00492894  EC 41 00 2A */	fadds f2, f1, f0
/* 80497078 00492898  D0 5A 00 68 */	stfs f2, 0x68(r26)
/* 8049707C 0049289C  C0 3A 00 78 */	lfs f1, 0x78(r26)
/* 80497080 004928A0  C0 1B A2 CC */	lfs f0, lbl_8066A2CC@l(r27)
/* 80497084 004928A4  EC 01 00 2A */	fadds f0, f1, f0
/* 80497088 004928A8  D0 1A 00 78 */	stfs f0, 0x78(r26)
/* 8049708C 004928AC  C0 1C 00 0C */	lfs f0, 0xc(r28)
/* 80497090 004928B0  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 80497094 004928B4  4C 41 13 82 */	cror eq, gt, eq
/* 80497098 004928B8  40 82 00 08 */	bne .L_804970A0
/* 8049709C 004928BC  9B B8 00 90 */	stb r29, 0x90(r24)
.L_804970A0:
/* 804970A0 004928C0  80 7A 00 48 */	lwz r3, 0x48(r26)
/* 804970A4 004928C4  C0 3A 00 68 */	lfs f1, 0x68(r26)
/* 804970A8 004928C8  A8 03 00 06 */	lha r0, 0x6(r3)
/* 804970AC 004928CC  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 804970B0 004928D0  90 01 00 0C */	stw r0, 0xc(r1)
/* 804970B4 004928D4  C8 01 00 08 */	lfd f0, 0x8(r1)
/* 804970B8 004928D8  EC 00 E8 28 */	fsubs f0, f0, f29
/* 804970BC 004928DC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 804970C0 004928E0  4C 41 13 82 */	cror eq, gt, eq
/* 804970C4 004928E4  41 82 00 2C */	beq .L_804970F0
/* 804970C8 004928E8  80 7A 00 58 */	lwz r3, 0x58(r26)
/* 804970CC 004928EC  C0 3A 00 78 */	lfs f1, 0x78(r26)
/* 804970D0 004928F0  A8 03 00 06 */	lha r0, 0x6(r3)
/* 804970D4 004928F4  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 804970D8 004928F8  90 01 00 14 */	stw r0, 0x14(r1)
/* 804970DC 004928FC  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 804970E0 00492900  EC 00 E8 28 */	fsubs f0, f0, f29
/* 804970E4 00492904  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 804970E8 00492908  4C 41 13 82 */	cror eq, gt, eq
/* 804970EC 0049290C  40 82 00 14 */	bne .L_80497100
.L_804970F0:
/* 804970F0 00492910  D3 DA 00 78 */	stfs f30, 0x78(r26)
/* 804970F4 00492914  D3 DA 00 68 */	stfs f30, 0x68(r26)
/* 804970F8 00492918  80 7A 00 38 */	lwz r3, 0x38(r26)
/* 804970FC 0049291C  9B C3 00 B0 */	stb r30, 0xb0(r3)
.L_80497100:
/* 80497100 00492920  80 7A 00 38 */	lwz r3, 0x38(r26)
/* 80497104 00492924  38 DF 4F 54 */	addi r6, r31, 0x4f54
/* 80497108 00492928  38 A0 00 00 */	li r5, 0x0
/* 8049710C 0049292C  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80497110 00492930  81 8C 00 3C */	lwz r12, 0x3c(r12)
/* 80497114 00492934  7D 89 03 A6 */	mtctr r12
/* 80497118 00492938  4E 80 04 21 */	bctrl
/* 8049711C 0049293C  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80497120 00492940  C0 22 FF D0 */	lfs f1, lbl_806754B0@sda21(r0)
/* 80497124 00492944  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 80497128 00492948  C0 5A 00 88 */	lfs f2, 0x88(r26)
/* 8049712C 0049294C  7D 89 03 A6 */	mtctr r12
/* 80497130 00492950  4E 80 04 21 */	bctrl
.L_80497134:
/* 80497134 00492954  88 18 00 90 */	lbz r0, 0x90(r24)
/* 80497138 00492958  2C 00 00 00 */	cmpwi r0, 0x0
/* 8049713C 0049295C  41 82 01 1C */	beq .L_80497258
/* 80497140 00492960  C0 1A 00 70 */	lfs f0, 0x70(r26)
/* 80497144 00492964  80 7A 00 50 */	lwz r3, 0x50(r26)
/* 80497148 00492968  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8049714C 0049296C  C0 1A 00 80 */	lfs f0, 0x80(r26)
/* 80497150 00492970  80 7A 00 60 */	lwz r3, 0x60(r26)
/* 80497154 00492974  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80497158 00492978  80 7A 00 40 */	lwz r3, 0x40(r26)
/* 8049715C 0049297C  4B C0 C6 D9 */	bl fn_800A3834
/* 80497160 00492980  C0 1A 00 70 */	lfs f0, 0x70(r26)
/* 80497164 00492984  EC 20 F8 2A */	fadds f1, f0, f31
/* 80497168 00492988  D0 3A 00 70 */	stfs f1, 0x70(r26)
/* 8049716C 0049298C  C0 1A 00 80 */	lfs f0, 0x80(r26)
/* 80497170 00492990  EC 00 F8 2A */	fadds f0, f0, f31
/* 80497174 00492994  D0 1A 00 80 */	stfs f0, 0x80(r26)
/* 80497178 00492998  80 7A 00 50 */	lwz r3, 0x50(r26)
/* 8049717C 0049299C  A8 03 00 06 */	lha r0, 0x6(r3)
/* 80497180 004929A0  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80497184 004929A4  90 01 00 0C */	stw r0, 0xc(r1)
/* 80497188 004929A8  C8 01 00 08 */	lfd f0, 0x8(r1)
/* 8049718C 004929AC  EC 00 E8 28 */	fsubs f0, f0, f29
/* 80497190 004929B0  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80497194 004929B4  4C 41 13 82 */	cror eq, gt, eq
/* 80497198 004929B8  40 82 00 08 */	bne .L_804971A0
/* 8049719C 004929BC  D3 DA 00 70 */	stfs f30, 0x70(r26)
.L_804971A0:
/* 804971A0 004929C0  80 7A 00 60 */	lwz r3, 0x60(r26)
/* 804971A4 004929C4  C0 3A 00 80 */	lfs f1, 0x80(r26)
/* 804971A8 004929C8  A8 03 00 06 */	lha r0, 0x6(r3)
/* 804971AC 004929CC  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 804971B0 004929D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 804971B4 004929D4  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 804971B8 004929D8  EC 00 E8 28 */	fsubs f0, f0, f29
/* 804971BC 004929DC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 804971C0 004929E0  4C 41 13 82 */	cror eq, gt, eq
/* 804971C4 004929E4  40 82 00 08 */	bne .L_804971CC
/* 804971C8 004929E8  D3 DA 00 80 */	stfs f30, 0x80(r26)
.L_804971CC:
/* 804971CC 004929EC  80 7A 00 40 */	lwz r3, 0x40(r26)
/* 804971D0 004929F0  38 DF 4F 54 */	addi r6, r31, 0x4f54
/* 804971D4 004929F4  C3 9A 00 88 */	lfs f28, 0x88(r26)
/* 804971D8 004929F8  38 A0 00 00 */	li r5, 0x0
/* 804971DC 004929FC  81 83 00 00 */	lwz r12, 0x0(r3)
/* 804971E0 00492A00  81 8C 00 3C */	lwz r12, 0x3c(r12)
/* 804971E4 00492A04  7D 89 03 A6 */	mtctr r12
/* 804971E8 00492A08  4E 80 04 21 */	bctrl
/* 804971EC 00492A0C  D3 C3 00 D4 */	stfs f30, 0xd4(r3)
/* 804971F0 00492A10  D3 83 00 D8 */	stfs f28, 0xd8(r3)
/* 804971F4 00492A14  81 83 00 00 */	lwz r12, 0x0(r3)
/* 804971F8 00492A18  81 8C 00 2C */	lwz r12, 0x2c(r12)
/* 804971FC 00492A1C  7D 89 03 A6 */	mtctr r12
/* 80497200 00492A20  4E 80 04 21 */	bctrl
/* 80497204 00492A24  80 7A 00 40 */	lwz r3, 0x40(r26)
/* 80497208 00492A28  38 DF 4F 54 */	addi r6, r31, 0x4f54
/* 8049720C 00492A2C  38 A0 00 00 */	li r5, 0x0
/* 80497210 00492A30  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80497214 00492A34  81 8C 00 3C */	lwz r12, 0x3c(r12)
/* 80497218 00492A38  7D 89 03 A6 */	mtctr r12
/* 8049721C 00492A3C  4E 80 04 21 */	bctrl
/* 80497220 00492A40  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80497224 00492A44  88 98 00 9C */	lbz r4, 0x9c(r24)
/* 80497228 00492A48  81 8C 00 24 */	lwz r12, 0x24(r12)
/* 8049722C 00492A4C  7D 89 03 A6 */	mtctr r12
/* 80497230 00492A50  4E 80 04 21 */	bctrl
/* 80497234 00492A54  88 9C 00 18 */	lbz r4, 0x18(r28)
/* 80497238 00492A58  88 78 00 9C */	lbz r3, 0x9c(r24)
/* 8049723C 00492A5C  20 04 00 FF */	subfic r0, r4, 0xff
/* 80497240 00492A60  7C 03 00 00 */	cmpw r3, r0
/* 80497244 00492A64  40 80 00 10 */	bge .L_80497254
/* 80497248 00492A68  7C 03 22 14 */	add r0, r3, r4
/* 8049724C 00492A6C  98 18 00 9C */	stb r0, 0x9c(r24)
/* 80497250 00492A70  48 00 00 08 */	b .L_80497258
.L_80497254:
/* 80497254 00492A74  9A F8 00 9C */	stb r23, 0x9c(r24)
.L_80497258:
/* 80497258 00492A78  3B 5A 00 04 */	addi r26, r26, 0x4
/* 8049725C 00492A7C  3B 39 00 01 */	addi r25, r25, 0x1
.L_80497260:
/* 80497260 00492A80  80 18 00 98 */	lwz r0, 0x98(r24)
/* 80497264 00492A84  7C 19 00 00 */	cmpw r25, r0
/* 80497268 00492A88  41 80 FD D8 */	blt .L_80497040
/* 8049726C 00492A8C  7F 03 C3 78 */	mr r3, r24
/* 80497270 00492A90  48 04 22 7D */	bl fn_804D94EC
/* 80497274 00492A94  3C 80 4C 4F */	lis r4, 0x4c4f
/* 80497278 00492A98  3C A0 57 49 */	lis r5, 0x5749
/* 8049727C 00492A9C  38 C4 53 45 */	addi r6, r4, 0x5345
/* 80497280 00492AA0  38 80 4B 48 */	li r4, 0x4b48
/* 80497284 00492AA4  38 A5 4E 5F */	addi r5, r5, 0x4e5f
/* 80497288 00492AA8  4B EF 10 55 */	bl fn_803882DC
/* 8049728C 00492AAC  2C 03 00 00 */	cmpwi r3, 0x0
/* 80497290 00492AB0  40 82 00 1C */	bne .L_804972AC
/* 80497294 00492AB4  3C 60 80 56 */	lis r3, lbl_80558D38@ha
/* 80497298 00492AB8  38 80 01 14 */	li r4, 0x114
/* 8049729C 00492ABC  38 63 8D 38 */	addi r3, r3, lbl_80558D38@l
/* 804972A0 00492AC0  38 A3 01 04 */	addi r5, r3, 0x104
/* 804972A4 00492AC4  4C C6 31 82 */	crclr cr1eq
/* 804972A8 00492AC8  4B BF 7A 59 */	bl fn_8008ED00
.L_804972AC:
/* 804972AC 00492ACC  7F 03 C3 78 */	mr r3, r24
/* 804972B0 00492AD0  48 04 22 3D */	bl fn_804D94EC
/* 804972B4 00492AD4  80 B8 00 94 */	lwz r5, 0x94(r24)
/* 804972B8 00492AD8  3C 80 80 67 */	lis r4, lbl_8066A2CC@ha
/* 804972BC 00492ADC  38 84 A2 CC */	addi r4, r4, lbl_8066A2CC@l
/* 804972C0 00492AE0  38 A5 00 01 */	addi r5, r5, 0x1
/* 804972C4 00492AE4  90 B8 00 94 */	stw r5, 0x94(r24)
/* 804972C8 00492AE8  80 04 00 14 */	lwz r0, 0x14(r4)
/* 804972CC 00492AEC  7C 05 00 00 */	cmpw r5, r0
/* 804972D0 00492AF0  40 81 00 18 */	ble .L_804972E8
/* 804972D4 00492AF4  38 00 00 03 */	li r0, 0x3
/* 804972D8 00492AF8  90 03 00 0C */	stw r0, 0xc(r3)
/* 804972DC 00492AFC  48 05 9A FD */	bl fn_804F0DD8
/* 804972E0 00492B00  48 05 A2 9D */	bl fn_804F157C
/* 804972E4 00492B04  48 00 00 18 */	b .L_804972FC
.L_804972E8:
/* 804972E8 00492B08  80 04 00 10 */	lwz r0, 0x10(r4)
/* 804972EC 00492B0C  7C 05 00 00 */	cmpw r5, r0
/* 804972F0 00492B10  40 81 00 0C */	ble .L_804972FC
/* 804972F4 00492B14  38 00 00 02 */	li r0, 0x2
/* 804972F8 00492B18  90 03 00 0C */	stw r0, 0xc(r3)
.L_804972FC:
/* 804972FC 00492B1C  38 60 00 00 */	li r3, 0x0
/* 80497300 00492B20  E3 E1 00 78 */	psq_l f31, 0x78(r1), 0, qr0
/* 80497304 00492B24  CB E1 00 70 */	lfd f31, 0x70(r1)
/* 80497308 00492B28  E3 C1 00 68 */	psq_l f30, 0x68(r1), 0, qr0
/* 8049730C 00492B2C  CB C1 00 60 */	lfd f30, 0x60(r1)
/* 80497310 00492B30  E3 A1 00 58 */	psq_l f29, 0x58(r1), 0, qr0
/* 80497314 00492B34  CB A1 00 50 */	lfd f29, 0x50(r1)
/* 80497318 00492B38  E3 81 00 48 */	psq_l f28, 0x48(r1), 0, qr0
/* 8049731C 00492B3C  CB 81 00 40 */	lfd f28, 0x40(r1)
/* 80497320 00492B40  39 61 00 40 */	addi r11, r1, 0x40
/* 80497324 00492B44  4B C6 CF 01 */	bl _restgpr_23
/* 80497328 00492B48  80 01 00 84 */	lwz r0, 0x84(r1)
/* 8049732C 00492B4C  7C 08 03 A6 */	mtlr r0
/* 80497330 00492B50  38 21 00 80 */	addi r1, r1, 0x80
/* 80497334 00492B54  4E 80 00 20 */	blr
.endfn fn_80496FCC

.fn fn_80497338, global
/* 80497338 00492B58  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8049733C 00492B5C  7C 08 02 A6 */	mflr r0
/* 80497340 00492B60  2C 03 00 00 */	cmpwi r3, 0x0
/* 80497344 00492B64  90 01 00 14 */	stw r0, 0x14(r1)
/* 80497348 00492B68  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8049734C 00492B6C  7C 9F 23 78 */	mr r31, r4
/* 80497350 00492B70  93 C1 00 08 */	stw r30, 0x8(r1)
/* 80497354 00492B74  7C 7E 1B 78 */	mr r30, r3
/* 80497358 00492B78  41 82 00 4C */	beq .L_804973A4
/* 8049735C 00492B7C  41 82 00 38 */	beq .L_80497394
/* 80497360 00492B80  41 82 00 34 */	beq .L_80497394
/* 80497364 00492B84  3C 80 80 5C */	lis r4, lbl_805B8478@ha
/* 80497368 00492B88  38 84 84 78 */	addi r4, r4, lbl_805B8478@l
/* 8049736C 00492B8C  38 04 00 10 */	addi r0, r4, 0x10
/* 80497370 00492B90  90 83 00 00 */	stw r4, 0x0(r3)
/* 80497374 00492B94  90 03 00 18 */	stw r0, 0x18(r3)
/* 80497378 00492B98  48 00 0F C5 */	bl fn_8049833C
/* 8049737C 00492B9C  38 7E 00 18 */	addi r3, r30, 0x18
/* 80497380 00492BA0  38 80 00 00 */	li r4, 0x0
/* 80497384 00492BA4  4B BE A6 7D */	bl fn_80081A00
/* 80497388 00492BA8  7F C3 F3 78 */	mr r3, r30
/* 8049738C 00492BAC  38 80 00 00 */	li r4, 0x0
/* 80497390 00492BB0  48 00 0F 6D */	bl fn_804982FC
.L_80497394:
/* 80497394 00492BB4  2C 1F 00 00 */	cmpwi r31, 0x0
/* 80497398 00492BB8  40 81 00 0C */	ble .L_804973A4
/* 8049739C 00492BBC  7F C3 F3 78 */	mr r3, r30
/* 804973A0 00492BC0  4B BF 17 09 */	bl fn_80088AA8
.L_804973A4:
/* 804973A4 00492BC4  7F C3 F3 78 */	mr r3, r30
/* 804973A8 00492BC8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804973AC 00492BCC  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 804973B0 00492BD0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804973B4 00492BD4  7C 08 03 A6 */	mtlr r0
/* 804973B8 00492BD8  38 21 00 10 */	addi r1, r1, 0x10
/* 804973BC 00492BDC  4E 80 00 20 */	blr
.endfn fn_80497338