.include "macros.inc"
.file "auto_fn_80079B60_text"

# 0x80079B60 - 0x80079D84
.text
.balign 4

.fn fn_80079B60, global
/* 80079B60 00075380  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 80079B64 00075384  7C 08 02 A6 */	mflr r0
/* 80079B68 00075388  3C A0 80 66 */	lis r5, lbl_8065F870@ha
/* 80079B6C 0007538C  90 01 00 74 */	stw r0, 0x74(r1)
/* 80079B70 00075390  BF 61 00 5C */	stmw r27, 0x5c(r1)
/* 80079B74 00075394  3F 80 80 57 */	lis r28, lbl_80568578@ha
/* 80079B78 00075398  3B 9C 85 78 */	addi r28, r28, lbl_80568578@l
/* 80079B7C 0007539C  3F A0 80 57 */	lis r29, lbl_80568650@ha
/* 80079B80 000753A0  38 9C 00 84 */	addi r4, r28, 0x84
/* 80079B84 000753A4  3F 60 80 5D */	lis r27, lbl_805D5170@ha
/* 80079B88 000753A8  38 7C 00 78 */	addi r3, r28, 0x78
/* 80079B8C 000753AC  3B BD 86 50 */	addi r29, r29, lbl_80568650@l
/* 80079B90 000753B0  3B C5 F8 70 */	addi r30, r5, lbl_8065F870@l
/* 80079B94 000753B4  3B 7B 51 70 */	addi r27, r27, lbl_805D5170@l
/* 80079B98 000753B8  3F E0 80 08 */	lis r31, fn_80079D84@ha
/* 80079B9C 000753BC  81 5C 00 84 */	lwz r10, 0x84(r28)
/* 80079BA0 000753C0  81 24 00 04 */	lwz r9, 0x4(r4)
/* 80079BA4 000753C4  81 04 00 08 */	lwz r8, 0x8(r4)
/* 80079BA8 000753C8  38 80 00 07 */	li r4, 0x7
/* 80079BAC 000753CC  80 FC 00 78 */	lwz r7, 0x78(r28)
/* 80079BB0 000753D0  80 C3 00 04 */	lwz r6, 0x4(r3)
/* 80079BB4 000753D4  80 03 00 08 */	lwz r0, 0x8(r3)
/* 80079BB8 000753D8  7F C3 F3 78 */	mr r3, r30
/* 80079BBC 000753DC  93 A5 F8 70 */	stw r29, lbl_8065F870@l(r5)
/* 80079BC0 000753E0  38 BB 00 00 */	addi r5, r27, 0x0
/* 80079BC4 000753E4  90 9E 00 04 */	stw r4, 0x4(r30)
/* 80079BC8 000753E8  38 9F 9D 84 */	addi r4, r31, fn_80079D84@l
/* 80079BCC 000753EC  91 5E 00 08 */	stw r10, 0x8(r30)
/* 80079BD0 000753F0  91 3E 00 0C */	stw r9, 0xc(r30)
/* 80079BD4 000753F4  91 1E 00 10 */	stw r8, 0x10(r30)
/* 80079BD8 000753F8  90 FE 00 14 */	stw r7, 0x14(r30)
/* 80079BDC 000753FC  90 DE 00 18 */	stw r6, 0x18(r30)
/* 80079BE0 00075400  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 80079BE4 00075404  48 08 A0 75 */	bl __register_global_object
/* 80079BE8 00075408  38 9C 00 90 */	addi r4, r28, 0x90
/* 80079BEC 0007540C  38 DC 00 9C */	addi r6, r28, 0x9c
/* 80079BF0 00075410  80 E6 00 04 */	lwz r7, 0x4(r6)
/* 80079BF4 00075414  38 00 00 06 */	li r0, 0x6
/* 80079BF8 00075418  81 7C 00 90 */	lwz r11, 0x90(r28)
/* 80079BFC 0007541C  38 7E 00 20 */	addi r3, r30, 0x20
/* 80079C00 00075420  81 44 00 04 */	lwz r10, 0x4(r4)
/* 80079C04 00075424  38 BB 00 0C */	addi r5, r27, 0xc
/* 80079C08 00075428  81 24 00 08 */	lwz r9, 0x8(r4)
/* 80079C0C 0007542C  38 9F 9D 84 */	addi r4, r31, fn_80079D84@l
/* 80079C10 00075430  81 1C 00 9C */	lwz r8, 0x9c(r28)
/* 80079C14 00075434  80 C6 00 08 */	lwz r6, 0x8(r6)
/* 80079C18 00075438  91 61 00 38 */	stw r11, 0x38(r1)
/* 80079C1C 0007543C  91 41 00 3C */	stw r10, 0x3c(r1)
/* 80079C20 00075440  91 21 00 40 */	stw r9, 0x40(r1)
/* 80079C24 00075444  91 01 00 44 */	stw r8, 0x44(r1)
/* 80079C28 00075448  90 E1 00 48 */	stw r7, 0x48(r1)
/* 80079C2C 0007544C  90 C1 00 4C */	stw r6, 0x4c(r1)
/* 80079C30 00075450  93 BE 00 20 */	stw r29, 0x20(r30)
/* 80079C34 00075454  90 1E 00 24 */	stw r0, 0x24(r30)
/* 80079C38 00075458  91 1E 00 28 */	stw r8, 0x28(r30)
/* 80079C3C 0007545C  90 FE 00 2C */	stw r7, 0x2c(r30)
/* 80079C40 00075460  90 DE 00 30 */	stw r6, 0x30(r30)
/* 80079C44 00075464  91 7E 00 34 */	stw r11, 0x34(r30)
/* 80079C48 00075468  91 5E 00 38 */	stw r10, 0x38(r30)
/* 80079C4C 0007546C  91 3E 00 3C */	stw r9, 0x3c(r30)
/* 80079C50 00075470  48 08 A0 09 */	bl __register_global_object
/* 80079C54 00075474  38 9C 00 A8 */	addi r4, r28, 0xa8
/* 80079C58 00075478  38 DC 00 B4 */	addi r6, r28, 0xb4
/* 80079C5C 0007547C  80 E6 00 04 */	lwz r7, 0x4(r6)
/* 80079C60 00075480  38 00 00 08 */	li r0, 0x8
/* 80079C64 00075484  81 7C 00 A8 */	lwz r11, 0xa8(r28)
/* 80079C68 00075488  38 7E 00 40 */	addi r3, r30, 0x40
/* 80079C6C 0007548C  81 44 00 04 */	lwz r10, 0x4(r4)
/* 80079C70 00075490  38 BB 00 18 */	addi r5, r27, 0x18
/* 80079C74 00075494  81 24 00 08 */	lwz r9, 0x8(r4)
/* 80079C78 00075498  38 9F 9D 84 */	addi r4, r31, fn_80079D84@l
/* 80079C7C 0007549C  81 1C 00 B4 */	lwz r8, 0xb4(r28)
/* 80079C80 000754A0  80 C6 00 08 */	lwz r6, 0x8(r6)
/* 80079C84 000754A4  91 61 00 20 */	stw r11, 0x20(r1)
/* 80079C88 000754A8  91 41 00 24 */	stw r10, 0x24(r1)
/* 80079C8C 000754AC  91 21 00 28 */	stw r9, 0x28(r1)
/* 80079C90 000754B0  91 01 00 2C */	stw r8, 0x2c(r1)
/* 80079C94 000754B4  90 E1 00 30 */	stw r7, 0x30(r1)
/* 80079C98 000754B8  90 C1 00 34 */	stw r6, 0x34(r1)
/* 80079C9C 000754BC  93 BE 00 40 */	stw r29, 0x40(r30)
/* 80079CA0 000754C0  90 1E 00 44 */	stw r0, 0x44(r30)
/* 80079CA4 000754C4  91 1E 00 48 */	stw r8, 0x48(r30)
/* 80079CA8 000754C8  90 FE 00 4C */	stw r7, 0x4c(r30)
/* 80079CAC 000754CC  90 DE 00 50 */	stw r6, 0x50(r30)
/* 80079CB0 000754D0  91 7E 00 54 */	stw r11, 0x54(r30)
/* 80079CB4 000754D4  91 5E 00 58 */	stw r10, 0x58(r30)
/* 80079CB8 000754D8  91 3E 00 5C */	stw r9, 0x5c(r30)
/* 80079CBC 000754DC  48 08 9F 9D */	bl __register_global_object
/* 80079CC0 000754E0  38 9C 00 C0 */	addi r4, r28, 0xc0
/* 80079CC4 000754E4  38 DC 00 CC */	addi r6, r28, 0xcc
/* 80079CC8 000754E8  80 E6 00 04 */	lwz r7, 0x4(r6)
/* 80079CCC 000754EC  38 00 00 09 */	li r0, 0x9
/* 80079CD0 000754F0  81 7C 00 C0 */	lwz r11, 0xc0(r28)
/* 80079CD4 000754F4  38 7E 00 60 */	addi r3, r30, 0x60
/* 80079CD8 000754F8  81 44 00 04 */	lwz r10, 0x4(r4)
/* 80079CDC 000754FC  38 BB 00 24 */	addi r5, r27, 0x24
/* 80079CE0 00075500  81 24 00 08 */	lwz r9, 0x8(r4)
/* 80079CE4 00075504  38 9F 9D 84 */	addi r4, r31, fn_80079D84@l
/* 80079CE8 00075508  81 1C 00 CC */	lwz r8, 0xcc(r28)
/* 80079CEC 0007550C  80 C6 00 08 */	lwz r6, 0x8(r6)
/* 80079CF0 00075510  91 61 00 08 */	stw r11, 0x8(r1)
/* 80079CF4 00075514  91 41 00 0C */	stw r10, 0xc(r1)
/* 80079CF8 00075518  91 21 00 10 */	stw r9, 0x10(r1)
/* 80079CFC 0007551C  91 01 00 14 */	stw r8, 0x14(r1)
/* 80079D00 00075520  90 E1 00 18 */	stw r7, 0x18(r1)
/* 80079D04 00075524  90 C1 00 1C */	stw r6, 0x1c(r1)
/* 80079D08 00075528  93 BE 00 60 */	stw r29, 0x60(r30)
/* 80079D0C 0007552C  90 1E 00 64 */	stw r0, 0x64(r30)
/* 80079D10 00075530  91 1E 00 68 */	stw r8, 0x68(r30)
/* 80079D14 00075534  90 FE 00 6C */	stw r7, 0x6c(r30)
/* 80079D18 00075538  90 DE 00 70 */	stw r6, 0x70(r30)
/* 80079D1C 0007553C  91 7E 00 74 */	stw r11, 0x74(r30)
/* 80079D20 00075540  91 5E 00 78 */	stw r10, 0x78(r30)
/* 80079D24 00075544  91 3E 00 7C */	stw r9, 0x7c(r30)
/* 80079D28 00075548  48 08 9F 31 */	bl __register_global_object
/* 80079D2C 0007554C  3C A0 80 54 */	lis r5, lbl_8053F218@ha
/* 80079D30 00075550  84 E5 F2 18 */	lwzu r7, lbl_8053F218@l(r5)
/* 80079D34 00075554  39 00 FF FF */	li r8, -0x1
/* 80079D38 00075558  93 BE 00 80 */	stw r29, 0x80(r30)
/* 80079D3C 0007555C  80 C5 00 04 */	lwz r6, 0x4(r5)
/* 80079D40 00075560  38 7E 00 80 */	addi r3, r30, 0x80
/* 80079D44 00075564  80 05 00 08 */	lwz r0, 0x8(r5)
/* 80079D48 00075568  38 9F 9D 84 */	addi r4, r31, fn_80079D84@l
/* 80079D4C 0007556C  91 1E 00 84 */	stw r8, 0x84(r30)
/* 80079D50 00075570  38 BB 00 30 */	addi r5, r27, 0x30
/* 80079D54 00075574  90 FE 00 88 */	stw r7, 0x88(r30)
/* 80079D58 00075578  90 DE 00 8C */	stw r6, 0x8c(r30)
/* 80079D5C 0007557C  90 1E 00 90 */	stw r0, 0x90(r30)
/* 80079D60 00075580  90 FE 00 94 */	stw r7, 0x94(r30)
/* 80079D64 00075584  90 DE 00 98 */	stw r6, 0x98(r30)
/* 80079D68 00075588  90 1E 00 9C */	stw r0, 0x9c(r30)
/* 80079D6C 0007558C  48 08 9E ED */	bl __register_global_object
/* 80079D70 00075590  BB 61 00 5C */	lmw r27, 0x5c(r1)
/* 80079D74 00075594  80 01 00 74 */	lwz r0, 0x74(r1)
/* 80079D78 00075598  7C 08 03 A6 */	mtlr r0
/* 80079D7C 0007559C  38 21 00 70 */	addi r1, r1, 0x70
/* 80079D80 000755A0  4E 80 00 20 */	blr
.endfn fn_80079B60

# 0x80534CE8 - 0x80534CEC
.section .ctors, "a"
.balign 4
	.4byte fn_80079B60