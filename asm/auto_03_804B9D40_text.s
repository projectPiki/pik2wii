.include "macros.inc"
.file "auto_03_804B9D40_text"

# 0x804B9D40 - 0x804BA424
.text
.balign 4

.fn fn_804B9D40, global
/* 804B9D40 004B5560  3C 80 80 56 */	lis r4, lbl_8055A2E0@ha
/* 804B9D44 004B5564  38 E0 00 00 */	li r7, 0x0
/* 804B9D48 004B5568  38 84 A2 E0 */	addi r4, r4, lbl_8055A2E0@l
/* 804B9D4C 004B556C  38 C0 FF FF */	li r6, -0x1
/* 804B9D50 004B5570  38 A0 00 01 */	li r5, 0x1
/* 804B9D54 004B5574  90 E3 00 28 */	stw r7, 0x28(r3)
/* 804B9D58 004B5578  38 04 00 0B */	addi r0, r4, 0xb
/* 804B9D5C 004B557C  90 E3 00 38 */	stw r7, 0x38(r3)
/* 804B9D60 004B5580  90 E3 00 48 */	stw r7, 0x48(r3)
/* 804B9D64 004B5584  90 E3 00 58 */	stw r7, 0x58(r3)
/* 804B9D68 004B5588  90 E3 00 68 */	stw r7, 0x68(r3)
/* 804B9D6C 004B558C  90 E3 00 78 */	stw r7, 0x78(r3)
/* 804B9D70 004B5590  90 E3 00 88 */	stw r7, 0x88(r3)
/* 804B9D74 004B5594  90 E3 00 A8 */	stw r7, 0xa8(r3)
/* 804B9D78 004B5598  90 E3 00 98 */	stw r7, 0x98(r3)
/* 804B9D7C 004B559C  90 E3 00 D8 */	stw r7, 0xd8(r3)
/* 804B9D80 004B55A0  90 C3 00 E8 */	stw r6, 0xe8(r3)
/* 804B9D84 004B55A4  90 C3 00 F8 */	stw r6, 0xf8(r3)
/* 804B9D88 004B55A8  90 C3 01 08 */	stw r6, 0x108(r3)
/* 804B9D8C 004B55AC  90 C3 01 18 */	stw r6, 0x118(r3)
/* 804B9D90 004B55B0  90 E3 01 28 */	stw r7, 0x128(r3)
/* 804B9D94 004B55B4  90 E3 01 68 */	stw r7, 0x168(r3)
/* 804B9D98 004B55B8  90 E3 01 78 */	stw r7, 0x178(r3)
/* 804B9D9C 004B55BC  90 E3 01 D8 */	stw r7, 0x1d8(r3)
/* 804B9DA0 004B55C0  90 E3 01 E8 */	stw r7, 0x1e8(r3)
/* 804B9DA4 004B55C4  90 E3 01 F8 */	stw r7, 0x1f8(r3)
/* 804B9DA8 004B55C8  90 A3 01 48 */	stw r5, 0x148(r3)
/* 804B9DAC 004B55CC  90 03 01 38 */	stw r0, 0x138(r3)
/* 804B9DB0 004B55D0  90 A3 01 58 */	stw r5, 0x158(r3)
/* 804B9DB4 004B55D4  90 E3 01 88 */	stw r7, 0x188(r3)
/* 804B9DB8 004B55D8  90 E3 02 58 */	stw r7, 0x258(r3)
/* 804B9DBC 004B55DC  4E 80 00 20 */	blr
.endfn fn_804B9D40

.fn fn_804B9DC0, global
/* 804B9DC0 004B55E0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804B9DC4 004B55E4  7C 08 02 A6 */	mflr r0
/* 804B9DC8 004B55E8  3C 80 80 5D */	lis r4, lbl_805CD490@ha
/* 804B9DCC 004B55EC  90 01 00 14 */	stw r0, 0x14(r1)
/* 804B9DD0 004B55F0  38 84 D4 90 */	addi r4, r4, lbl_805CD490@l
/* 804B9DD4 004B55F4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804B9DD8 004B55F8  93 C1 00 08 */	stw r30, 0x8(r1)
/* 804B9DDC 004B55FC  7C 7E 1B 78 */	mr r30, r3
/* 804B9DE0 004B5600  4B FE 8F 39 */	bl fn_804A2D18
/* 804B9DE4 004B5604  3C 60 80 5D */	lis r3, lbl_805CD298@ha
/* 804B9DE8 004B5608  3C A0 80 5D */	lis r5, lbl_805CD484@ha
/* 804B9DEC 004B560C  38 63 D2 98 */	addi r3, r3, lbl_805CD298@l
/* 804B9DF0 004B5610  7F C4 F3 78 */	mr r4, r30
/* 804B9DF4 004B5614  90 7E 00 00 */	stw r3, 0x0(r30)
/* 804B9DF8 004B5618  38 7E 00 1C */	addi r3, r30, 0x1c
/* 804B9DFC 004B561C  38 A5 D4 84 */	addi r5, r5, lbl_805CD484@l
/* 804B9E00 004B5620  4B FE 8F 6D */	bl fn_804A2D6C
/* 804B9E04 004B5624  3F E0 80 59 */	lis r31, lbl_80596180@ha
/* 804B9E08 004B5628  7F C4 F3 78 */	mr r4, r30
/* 804B9E0C 004B562C  3B FF 61 80 */	addi r31, r31, lbl_80596180@l
/* 804B9E10 004B5630  38 7E 00 2C */	addi r3, r30, 0x2c
/* 804B9E14 004B5634  93 FE 00 1C */	stw r31, 0x1c(r30)
/* 804B9E18 004B5638  38 AD 8F 28 */	li r5, lbl_8066B728@sda21
/* 804B9E1C 004B563C  4B FE 8F 51 */	bl fn_804A2D6C
/* 804B9E20 004B5640  3C A0 80 5D */	lis r5, lbl_805CD478@ha
/* 804B9E24 004B5644  93 FE 00 2C */	stw r31, 0x2c(r30)
/* 804B9E28 004B5648  7F C4 F3 78 */	mr r4, r30
/* 804B9E2C 004B564C  38 7E 00 3C */	addi r3, r30, 0x3c
/* 804B9E30 004B5650  38 A5 D4 78 */	addi r5, r5, lbl_805CD478@l
/* 804B9E34 004B5654  4B FE 8F 39 */	bl fn_804A2D6C
/* 804B9E38 004B5658  3C A0 80 5D */	lis r5, lbl_805CD468@ha
/* 804B9E3C 004B565C  93 FE 00 3C */	stw r31, 0x3c(r30)
/* 804B9E40 004B5660  7F C4 F3 78 */	mr r4, r30
/* 804B9E44 004B5664  38 7E 00 4C */	addi r3, r30, 0x4c
/* 804B9E48 004B5668  38 A5 D4 68 */	addi r5, r5, lbl_805CD468@l
/* 804B9E4C 004B566C  4B FE 8F 21 */	bl fn_804A2D6C
/* 804B9E50 004B5670  3C A0 80 5D */	lis r5, lbl_805CD458@ha
/* 804B9E54 004B5674  93 FE 00 4C */	stw r31, 0x4c(r30)
/* 804B9E58 004B5678  7F C4 F3 78 */	mr r4, r30
/* 804B9E5C 004B567C  38 7E 00 5C */	addi r3, r30, 0x5c
/* 804B9E60 004B5680  38 A5 D4 58 */	addi r5, r5, lbl_805CD458@l
/* 804B9E64 004B5684  4B FE 8F 09 */	bl fn_804A2D6C
/* 804B9E68 004B5688  3C A0 80 5D */	lis r5, lbl_805CD44C@ha
/* 804B9E6C 004B568C  93 FE 00 5C */	stw r31, 0x5c(r30)
/* 804B9E70 004B5690  7F C4 F3 78 */	mr r4, r30
/* 804B9E74 004B5694  38 7E 00 6C */	addi r3, r30, 0x6c
/* 804B9E78 004B5698  38 A5 D4 4C */	addi r5, r5, lbl_805CD44C@l
/* 804B9E7C 004B569C  4B FE 8E F1 */	bl fn_804A2D6C
/* 804B9E80 004B56A0  3C A0 80 5D */	lis r5, lbl_805CD43C@ha
/* 804B9E84 004B56A4  93 FE 00 6C */	stw r31, 0x6c(r30)
/* 804B9E88 004B56A8  7F C4 F3 78 */	mr r4, r30
/* 804B9E8C 004B56AC  38 7E 00 7C */	addi r3, r30, 0x7c
/* 804B9E90 004B56B0  38 A5 D4 3C */	addi r5, r5, lbl_805CD43C@l
/* 804B9E94 004B56B4  4B FE 8E D9 */	bl fn_804A2D6C
/* 804B9E98 004B56B8  3C A0 80 5D */	lis r5, lbl_805CD42C@ha
/* 804B9E9C 004B56BC  93 FE 00 7C */	stw r31, 0x7c(r30)
/* 804B9EA0 004B56C0  7F C4 F3 78 */	mr r4, r30
/* 804B9EA4 004B56C4  38 7E 00 8C */	addi r3, r30, 0x8c
/* 804B9EA8 004B56C8  38 A5 D4 2C */	addi r5, r5, lbl_805CD42C@l
/* 804B9EAC 004B56CC  4B FE 8E C1 */	bl fn_804A2D6C
/* 804B9EB0 004B56D0  3C A0 80 5D */	lis r5, lbl_805CD41C@ha
/* 804B9EB4 004B56D4  93 FE 00 8C */	stw r31, 0x8c(r30)
/* 804B9EB8 004B56D8  7F C4 F3 78 */	mr r4, r30
/* 804B9EBC 004B56DC  38 7E 00 9C */	addi r3, r30, 0x9c
/* 804B9EC0 004B56E0  38 A5 D4 1C */	addi r5, r5, lbl_805CD41C@l
/* 804B9EC4 004B56E4  4B FE 8E A9 */	bl fn_804A2D6C
/* 804B9EC8 004B56E8  3C A0 80 5D */	lis r5, lbl_805CD410@ha
/* 804B9ECC 004B56EC  93 FE 00 9C */	stw r31, 0x9c(r30)
/* 804B9ED0 004B56F0  7F C4 F3 78 */	mr r4, r30
/* 804B9ED4 004B56F4  38 7E 00 AC */	addi r3, r30, 0xac
/* 804B9ED8 004B56F8  38 A5 D4 10 */	addi r5, r5, lbl_805CD410@l
/* 804B9EDC 004B56FC  4B FE 8E 91 */	bl fn_804A2D6C
/* 804B9EE0 004B5700  3C A0 80 5D */	lis r5, lbl_805CD404@ha
/* 804B9EE4 004B5704  93 FE 00 AC */	stw r31, 0xac(r30)
/* 804B9EE8 004B5708  7F C4 F3 78 */	mr r4, r30
/* 804B9EEC 004B570C  38 7E 00 BC */	addi r3, r30, 0xbc
/* 804B9EF0 004B5710  38 A5 D4 04 */	addi r5, r5, lbl_805CD404@l
/* 804B9EF4 004B5714  4B FE 8E 79 */	bl fn_804A2D6C
/* 804B9EF8 004B5718  3C A0 80 5D */	lis r5, lbl_805CD3F8@ha
/* 804B9EFC 004B571C  93 FE 00 BC */	stw r31, 0xbc(r30)
/* 804B9F00 004B5720  7F C4 F3 78 */	mr r4, r30
/* 804B9F04 004B5724  38 7E 00 CC */	addi r3, r30, 0xcc
/* 804B9F08 004B5728  38 A5 D3 F8 */	addi r5, r5, lbl_805CD3F8@l
/* 804B9F0C 004B572C  4B FE 8E 61 */	bl fn_804A2D6C
/* 804B9F10 004B5730  3C A0 80 5D */	lis r5, lbl_805CD3EC@ha
/* 804B9F14 004B5734  93 FE 00 CC */	stw r31, 0xcc(r30)
/* 804B9F18 004B5738  7F C4 F3 78 */	mr r4, r30
/* 804B9F1C 004B573C  38 7E 00 DC */	addi r3, r30, 0xdc
/* 804B9F20 004B5740  38 A5 D3 EC */	addi r5, r5, lbl_805CD3EC@l
/* 804B9F24 004B5744  4B FE 8E 49 */	bl fn_804A2D6C
/* 804B9F28 004B5748  3C A0 80 5D */	lis r5, lbl_805CD3DC@ha
/* 804B9F2C 004B574C  93 FE 00 DC */	stw r31, 0xdc(r30)
/* 804B9F30 004B5750  7F C4 F3 78 */	mr r4, r30
/* 804B9F34 004B5754  38 7E 00 EC */	addi r3, r30, 0xec
/* 804B9F38 004B5758  38 A5 D3 DC */	addi r5, r5, lbl_805CD3DC@l
/* 804B9F3C 004B575C  4B FE 8E 31 */	bl fn_804A2D6C
/* 804B9F40 004B5760  3C A0 80 5D */	lis r5, lbl_805CD3CC@ha
/* 804B9F44 004B5764  93 FE 00 EC */	stw r31, 0xec(r30)
/* 804B9F48 004B5768  7F C4 F3 78 */	mr r4, r30
/* 804B9F4C 004B576C  38 7E 00 FC */	addi r3, r30, 0xfc
/* 804B9F50 004B5770  38 A5 D3 CC */	addi r5, r5, lbl_805CD3CC@l
/* 804B9F54 004B5774  4B FE 8E 19 */	bl fn_804A2D6C
/* 804B9F58 004B5778  3C A0 80 5D */	lis r5, lbl_805CD3BC@ha
/* 804B9F5C 004B577C  93 FE 00 FC */	stw r31, 0xfc(r30)
/* 804B9F60 004B5780  7F C4 F3 78 */	mr r4, r30
/* 804B9F64 004B5784  38 7E 01 0C */	addi r3, r30, 0x10c
/* 804B9F68 004B5788  38 A5 D3 BC */	addi r5, r5, lbl_805CD3BC@l
/* 804B9F6C 004B578C  4B FE 8E 01 */	bl fn_804A2D6C
/* 804B9F70 004B5790  3C A0 80 5D */	lis r5, lbl_805CD3AC@ha
/* 804B9F74 004B5794  93 FE 01 0C */	stw r31, 0x10c(r30)
/* 804B9F78 004B5798  7F C4 F3 78 */	mr r4, r30
/* 804B9F7C 004B579C  38 7E 01 1C */	addi r3, r30, 0x11c
/* 804B9F80 004B57A0  38 A5 D3 AC */	addi r5, r5, lbl_805CD3AC@l
/* 804B9F84 004B57A4  4B FE 8D E9 */	bl fn_804A2D6C
/* 804B9F88 004B57A8  3C A0 80 5D */	lis r5, lbl_805CD39C@ha
/* 804B9F8C 004B57AC  93 FE 01 1C */	stw r31, 0x11c(r30)
/* 804B9F90 004B57B0  7F C4 F3 78 */	mr r4, r30
/* 804B9F94 004B57B4  38 7E 01 2C */	addi r3, r30, 0x12c
/* 804B9F98 004B57B8  38 A5 D3 9C */	addi r5, r5, lbl_805CD39C@l
/* 804B9F9C 004B57BC  4B FE 8C E5 */	bl fn_804A2C80
/* 804B9FA0 004B57C0  3C A0 80 5D */	lis r5, lbl_805CD390@ha
/* 804B9FA4 004B57C4  7F C4 F3 78 */	mr r4, r30
/* 804B9FA8 004B57C8  38 7E 01 3C */	addi r3, r30, 0x13c
/* 804B9FAC 004B57CC  38 A5 D3 90 */	addi r5, r5, lbl_805CD390@l
/* 804B9FB0 004B57D0  4B FE 8D BD */	bl fn_804A2D6C
/* 804B9FB4 004B57D4  3C A0 80 5D */	lis r5, lbl_805CD380@ha
/* 804B9FB8 004B57D8  93 FE 01 3C */	stw r31, 0x13c(r30)
/* 804B9FBC 004B57DC  7F C4 F3 78 */	mr r4, r30
/* 804B9FC0 004B57E0  38 7E 01 4C */	addi r3, r30, 0x14c
/* 804B9FC4 004B57E4  38 A5 D3 80 */	addi r5, r5, lbl_805CD380@l
/* 804B9FC8 004B57E8  4B FE 8D A5 */	bl fn_804A2D6C
/* 804B9FCC 004B57EC  93 FE 01 4C */	stw r31, 0x14c(r30)
/* 804B9FD0 004B57F0  7F C4 F3 78 */	mr r4, r30
/* 804B9FD4 004B57F4  38 7E 01 5C */	addi r3, r30, 0x15c
/* 804B9FD8 004B57F8  38 AD 8F 24 */	li r5, lbl_8066B724@sda21
/* 804B9FDC 004B57FC  4B FE 8D 91 */	bl fn_804A2D6C
/* 804B9FE0 004B5800  93 FE 01 5C */	stw r31, 0x15c(r30)
/* 804B9FE4 004B5804  7F C4 F3 78 */	mr r4, r30
/* 804B9FE8 004B5808  38 7E 01 6C */	addi r3, r30, 0x16c
/* 804B9FEC 004B580C  38 AD 8F 1C */	li r5, lbl_8066B71C@sda21
/* 804B9FF0 004B5810  4B FE 8D 7D */	bl fn_804A2D6C
/* 804B9FF4 004B5814  93 FE 01 6C */	stw r31, 0x16c(r30)
/* 804B9FF8 004B5818  7F C4 F3 78 */	mr r4, r30
/* 804B9FFC 004B581C  38 7E 01 7C */	addi r3, r30, 0x17c
/* 804BA000 004B5820  38 AD 8F 14 */	li r5, lbl_8066B714@sda21
/* 804BA004 004B5824  4B FE 8D 69 */	bl fn_804A2D6C
/* 804BA008 004B5828  3C A0 80 5D */	lis r5, lbl_805CD370@ha
/* 804BA00C 004B582C  93 FE 01 7C */	stw r31, 0x17c(r30)
/* 804BA010 004B5830  7F C4 F3 78 */	mr r4, r30
/* 804BA014 004B5834  38 7E 01 8C */	addi r3, r30, 0x18c
/* 804BA018 004B5838  38 A5 D3 70 */	addi r5, r5, lbl_805CD370@l
/* 804BA01C 004B583C  4B FE 8D 51 */	bl fn_804A2D6C
/* 804BA020 004B5840  93 FE 01 8C */	stw r31, 0x18c(r30)
/* 804BA024 004B5844  7F C4 F3 78 */	mr r4, r30
/* 804BA028 004B5848  38 7E 01 9C */	addi r3, r30, 0x19c
/* 804BA02C 004B584C  38 AD 8F 0C */	li r5, lbl_8066B70C@sda21
/* 804BA030 004B5850  4B FE 8D 3D */	bl fn_804A2D6C
/* 804BA034 004B5854  93 FE 01 9C */	stw r31, 0x19c(r30)
/* 804BA038 004B5858  7F C4 F3 78 */	mr r4, r30
/* 804BA03C 004B585C  38 7E 01 AC */	addi r3, r30, 0x1ac
/* 804BA040 004B5860  38 AD 8F 08 */	li r5, lbl_8066B708@sda21
/* 804BA044 004B5864  4B FE 8D 29 */	bl fn_804A2D6C
/* 804BA048 004B5868  3C A0 80 5D */	lis r5, lbl_805CD364@ha
/* 804BA04C 004B586C  93 FE 01 AC */	stw r31, 0x1ac(r30)
/* 804BA050 004B5870  7F C4 F3 78 */	mr r4, r30
/* 804BA054 004B5874  38 7E 01 BC */	addi r3, r30, 0x1bc
/* 804BA058 004B5878  38 A5 D3 64 */	addi r5, r5, lbl_805CD364@l
/* 804BA05C 004B587C  4B FE 8D 11 */	bl fn_804A2D6C
/* 804BA060 004B5880  3C A0 80 5D */	lis r5, lbl_805CD354@ha
/* 804BA064 004B5884  93 FE 01 BC */	stw r31, 0x1bc(r30)
/* 804BA068 004B5888  7F C4 F3 78 */	mr r4, r30
/* 804BA06C 004B588C  38 7E 01 CC */	addi r3, r30, 0x1cc
/* 804BA070 004B5890  38 A5 D3 54 */	addi r5, r5, lbl_805CD354@l
/* 804BA074 004B5894  4B FE 8C F9 */	bl fn_804A2D6C
/* 804BA078 004B5898  3C A0 80 5D */	lis r5, lbl_805CD340@ha
/* 804BA07C 004B589C  93 FE 01 CC */	stw r31, 0x1cc(r30)
/* 804BA080 004B58A0  7F C4 F3 78 */	mr r4, r30
/* 804BA084 004B58A4  38 7E 01 DC */	addi r3, r30, 0x1dc
/* 804BA088 004B58A8  38 A5 D3 40 */	addi r5, r5, lbl_805CD340@l
/* 804BA08C 004B58AC  4B FE 8C E1 */	bl fn_804A2D6C
/* 804BA090 004B58B0  3C A0 80 5D */	lis r5, lbl_805CD330@ha
/* 804BA094 004B58B4  93 FE 01 DC */	stw r31, 0x1dc(r30)
/* 804BA098 004B58B8  7F C4 F3 78 */	mr r4, r30
/* 804BA09C 004B58BC  38 7E 01 EC */	addi r3, r30, 0x1ec
/* 804BA0A0 004B58C0  38 A5 D3 30 */	addi r5, r5, lbl_805CD330@l
/* 804BA0A4 004B58C4  4B FE 8C C9 */	bl fn_804A2D6C
/* 804BA0A8 004B58C8  3C A0 80 5D */	lis r5, lbl_805CD320@ha
/* 804BA0AC 004B58CC  93 FE 01 EC */	stw r31, 0x1ec(r30)
/* 804BA0B0 004B58D0  7F C4 F3 78 */	mr r4, r30
/* 804BA0B4 004B58D4  38 7E 01 FC */	addi r3, r30, 0x1fc
/* 804BA0B8 004B58D8  38 A5 D3 20 */	addi r5, r5, lbl_805CD320@l
/* 804BA0BC 004B58DC  4B FE 8C B1 */	bl fn_804A2D6C
/* 804BA0C0 004B58E0  3C A0 80 5D */	lis r5, lbl_805CD30C@ha
/* 804BA0C4 004B58E4  93 FE 01 FC */	stw r31, 0x1fc(r30)
/* 804BA0C8 004B58E8  7F C4 F3 78 */	mr r4, r30
/* 804BA0CC 004B58EC  38 7E 02 0C */	addi r3, r30, 0x20c
/* 804BA0D0 004B58F0  38 A5 D3 0C */	addi r5, r5, lbl_805CD30C@l
/* 804BA0D4 004B58F4  4B FE 8C 99 */	bl fn_804A2D6C
/* 804BA0D8 004B58F8  3C A0 80 5D */	lis r5, lbl_805CD300@ha
/* 804BA0DC 004B58FC  93 FE 02 0C */	stw r31, 0x20c(r30)
/* 804BA0E0 004B5900  7F C4 F3 78 */	mr r4, r30
/* 804BA0E4 004B5904  38 7E 02 1C */	addi r3, r30, 0x21c
/* 804BA0E8 004B5908  38 A5 D3 00 */	addi r5, r5, lbl_805CD300@l
/* 804BA0EC 004B590C  4B FE 8C 81 */	bl fn_804A2D6C
/* 804BA0F0 004B5910  3C A0 80 5D */	lis r5, lbl_805CD2F0@ha
/* 804BA0F4 004B5914  93 FE 02 1C */	stw r31, 0x21c(r30)
/* 804BA0F8 004B5918  7F C4 F3 78 */	mr r4, r30
/* 804BA0FC 004B591C  38 7E 02 2C */	addi r3, r30, 0x22c
/* 804BA100 004B5920  38 A5 D2 F0 */	addi r5, r5, lbl_805CD2F0@l
/* 804BA104 004B5924  4B FE 8C 69 */	bl fn_804A2D6C
/* 804BA108 004B5928  3C A0 80 5D */	lis r5, lbl_805CD2E0@ha
/* 804BA10C 004B592C  93 FE 02 2C */	stw r31, 0x22c(r30)
/* 804BA110 004B5930  7F C4 F3 78 */	mr r4, r30
/* 804BA114 004B5934  38 7E 02 3C */	addi r3, r30, 0x23c
/* 804BA118 004B5938  38 A5 D2 E0 */	addi r5, r5, lbl_805CD2E0@l
/* 804BA11C 004B593C  4B FE 8B 65 */	bl fn_804A2C80
/* 804BA120 004B5940  3C A0 80 5D */	lis r5, lbl_805CD2D4@ha
/* 804BA124 004B5944  7F C4 F3 78 */	mr r4, r30
/* 804BA128 004B5948  38 7E 02 4C */	addi r3, r30, 0x24c
/* 804BA12C 004B594C  38 A5 D2 D4 */	addi r5, r5, lbl_805CD2D4@l
/* 804BA130 004B5950  4B FE 8C 3D */	bl fn_804A2D6C
/* 804BA134 004B5954  3C A0 80 5D */	lis r5, lbl_805CD2BC@ha
/* 804BA138 004B5958  93 FE 02 4C */	stw r31, 0x24c(r30)
/* 804BA13C 004B595C  7F C4 F3 78 */	mr r4, r30
/* 804BA140 004B5960  38 7E 02 5C */	addi r3, r30, 0x25c
/* 804BA144 004B5964  38 A5 D2 BC */	addi r5, r5, lbl_805CD2BC@l
/* 804BA148 004B5968  4B FE 8C 25 */	bl fn_804A2D6C
/* 804BA14C 004B596C  93 FE 02 5C */	stw r31, 0x25c(r30)
/* 804BA150 004B5970  7F C4 F3 78 */	mr r4, r30
/* 804BA154 004B5974  38 7E 02 6C */	addi r3, r30, 0x26c
/* 804BA158 004B5978  38 AD 8F 00 */	li r5, lbl_8066B700@sda21
/* 804BA15C 004B597C  4B FE 8C 11 */	bl fn_804A2D6C
/* 804BA160 004B5980  3C A0 80 5D */	lis r5, lbl_805CD2A8@ha
/* 804BA164 004B5984  93 FE 02 6C */	stw r31, 0x26c(r30)
/* 804BA168 004B5988  7F C4 F3 78 */	mr r4, r30
/* 804BA16C 004B598C  38 7E 02 7C */	addi r3, r30, 0x27c
/* 804BA170 004B5990  38 A5 D2 A8 */	addi r5, r5, lbl_805CD2A8@l
/* 804BA174 004B5994  4B FE 8B F9 */	bl fn_804A2D6C
/* 804BA178 004B5998  93 FE 02 7C */	stw r31, 0x27c(r30)
/* 804BA17C 004B599C  7F C3 F3 78 */	mr r3, r30
/* 804BA180 004B59A0  4B FF FB C1 */	bl fn_804B9D40
/* 804BA184 004B59A4  3C 60 80 56 */	lis r3, lbl_8055A2E0@ha
/* 804BA188 004B59A8  38 C0 00 00 */	li r6, 0x0
/* 804BA18C 004B59AC  38 63 A2 E0 */	addi r3, r3, lbl_8055A2E0@l
/* 804BA190 004B59B0  38 A0 FF FF */	li r5, -0x1
/* 804BA194 004B59B4  38 80 00 01 */	li r4, 0x1
/* 804BA198 004B59B8  90 DE 00 28 */	stw r6, 0x28(r30)
/* 804BA19C 004B59BC  38 03 00 0B */	addi r0, r3, 0xb
/* 804BA1A0 004B59C0  7F C3 F3 78 */	mr r3, r30
/* 804BA1A4 004B59C4  90 DE 00 38 */	stw r6, 0x38(r30)
/* 804BA1A8 004B59C8  90 DE 00 48 */	stw r6, 0x48(r30)
/* 804BA1AC 004B59CC  90 DE 00 58 */	stw r6, 0x58(r30)
/* 804BA1B0 004B59D0  90 DE 00 68 */	stw r6, 0x68(r30)
/* 804BA1B4 004B59D4  90 DE 00 78 */	stw r6, 0x78(r30)
/* 804BA1B8 004B59D8  90 DE 00 88 */	stw r6, 0x88(r30)
/* 804BA1BC 004B59DC  90 DE 00 A8 */	stw r6, 0xa8(r30)
/* 804BA1C0 004B59E0  90 DE 00 98 */	stw r6, 0x98(r30)
/* 804BA1C4 004B59E4  90 DE 00 D8 */	stw r6, 0xd8(r30)
/* 804BA1C8 004B59E8  90 BE 00 E8 */	stw r5, 0xe8(r30)
/* 804BA1CC 004B59EC  90 BE 00 F8 */	stw r5, 0xf8(r30)
/* 804BA1D0 004B59F0  90 BE 01 08 */	stw r5, 0x108(r30)
/* 804BA1D4 004B59F4  90 BE 01 18 */	stw r5, 0x118(r30)
/* 804BA1D8 004B59F8  90 DE 01 28 */	stw r6, 0x128(r30)
/* 804BA1DC 004B59FC  90 DE 01 68 */	stw r6, 0x168(r30)
/* 804BA1E0 004B5A00  90 DE 01 C8 */	stw r6, 0x1c8(r30)
/* 804BA1E4 004B5A04  90 DE 01 78 */	stw r6, 0x178(r30)
/* 804BA1E8 004B5A08  90 DE 01 D8 */	stw r6, 0x1d8(r30)
/* 804BA1EC 004B5A0C  90 DE 01 E8 */	stw r6, 0x1e8(r30)
/* 804BA1F0 004B5A10  90 DE 01 F8 */	stw r6, 0x1f8(r30)
/* 804BA1F4 004B5A14  90 9E 01 48 */	stw r4, 0x148(r30)
/* 804BA1F8 004B5A18  90 1E 01 38 */	stw r0, 0x138(r30)
/* 804BA1FC 004B5A1C  90 1E 02 48 */	stw r0, 0x248(r30)
/* 804BA200 004B5A20  90 9E 01 58 */	stw r4, 0x158(r30)
/* 804BA204 004B5A24  90 DE 01 88 */	stw r6, 0x188(r30)
/* 804BA208 004B5A28  90 9E 02 08 */	stw r4, 0x208(r30)
/* 804BA20C 004B5A2C  90 DE 02 28 */	stw r6, 0x228(r30)
/* 804BA210 004B5A30  90 DE 02 38 */	stw r6, 0x238(r30)
/* 804BA214 004B5A34  90 9E 01 98 */	stw r4, 0x198(r30)
/* 804BA218 004B5A38  90 DE 01 A8 */	stw r6, 0x1a8(r30)
/* 804BA21C 004B5A3C  90 DE 01 B8 */	stw r6, 0x1b8(r30)
/* 804BA220 004B5A40  90 DE 02 18 */	stw r6, 0x218(r30)
/* 804BA224 004B5A44  90 DE 02 68 */	stw r6, 0x268(r30)
/* 804BA228 004B5A48  90 DE 02 78 */	stw r6, 0x278(r30)
/* 804BA22C 004B5A4C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804BA230 004B5A50  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 804BA234 004B5A54  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804BA238 004B5A58  7C 08 03 A6 */	mtlr r0
/* 804BA23C 004B5A5C  38 21 00 10 */	addi r1, r1, 0x10
/* 804BA240 004B5A60  4E 80 00 20 */	blr
.endfn fn_804B9DC0

.fn fn_804BA244, global
/* 804BA244 004B5A64  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804BA248 004B5A68  7C 08 02 A6 */	mflr r0
/* 804BA24C 004B5A6C  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA250 004B5A70  90 01 00 14 */	stw r0, 0x14(r1)
/* 804BA254 004B5A74  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804BA258 004B5A78  7C 9F 23 78 */	mr r31, r4
/* 804BA25C 004B5A7C  93 C1 00 08 */	stw r30, 0x8(r1)
/* 804BA260 004B5A80  7C 7E 1B 78 */	mr r30, r3
/* 804BA264 004B5A84  41 82 00 20 */	beq .L_804BA284
/* 804BA268 004B5A88  41 82 00 0C */	beq .L_804BA274
/* 804BA26C 004B5A8C  38 80 00 00 */	li r4, 0x0
/* 804BA270 004B5A90  4B FD E0 8D */	bl fn_804982FC
.L_804BA274:
/* 804BA274 004B5A94  2C 1F 00 00 */	cmpwi r31, 0x0
/* 804BA278 004B5A98  40 81 00 0C */	ble .L_804BA284
/* 804BA27C 004B5A9C  7F C3 F3 78 */	mr r3, r30
/* 804BA280 004B5AA0  4B BC E8 29 */	bl fn_80088AA8
.L_804BA284:
/* 804BA284 004B5AA4  7F C3 F3 78 */	mr r3, r30
/* 804BA288 004B5AA8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804BA28C 004B5AAC  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 804BA290 004B5AB0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804BA294 004B5AB4  7C 08 03 A6 */	mtlr r0
/* 804BA298 004B5AB8  38 21 00 10 */	addi r1, r1, 0x10
/* 804BA29C 004B5ABC  4E 80 00 20 */	blr
.endfn fn_804BA244

.fn fn_804BA2A0, global
/* 804BA2A0 004B5AC0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804BA2A4 004B5AC4  7C 08 02 A6 */	mflr r0
/* 804BA2A8 004B5AC8  3C 60 80 67 */	lis r3, lbl_8066A350@ha
/* 804BA2AC 004B5ACC  90 01 00 14 */	stw r0, 0x14(r1)
/* 804BA2B0 004B5AD0  38 63 A3 50 */	addi r3, r3, lbl_8066A350@l
/* 804BA2B4 004B5AD4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804BA2B8 004B5AD8  3F E0 80 56 */	lis r31, lbl_8055A2E0@ha
/* 804BA2BC 004B5ADC  3B FF A2 E0 */	addi r31, r31, lbl_8055A2E0@l
/* 804BA2C0 004B5AE0  93 C1 00 08 */	stw r30, 0x8(r1)
/* 804BA2C4 004B5AE4  38 9F 00 0C */	addi r4, r31, 0xc
/* 804BA2C8 004B5AE8  83 C3 02 48 */	lwz r30, 0x248(r3)
/* 804BA2CC 004B5AEC  7F C3 F3 78 */	mr r3, r30
/* 804BA2D0 004B5AF0  4B C5 12 05 */	bl fn_8010B4D4
/* 804BA2D4 004B5AF4  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA2D8 004B5AF8  40 82 00 14 */	bne .L_804BA2EC
/* 804BA2DC 004B5AFC  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 804BA2E0 004B5B00  38 80 00 00 */	li r4, 0x0
/* 804BA2E4 004B5B04  4B FE E0 CD */	bl fn_804A83B0
/* 804BA2E8 004B5B08  48 00 01 20 */	b .L_804BA408
.L_804BA2EC:
/* 804BA2EC 004B5B0C  7F C3 F3 78 */	mr r3, r30
/* 804BA2F0 004B5B10  38 9F 00 12 */	addi r4, r31, 0x12
/* 804BA2F4 004B5B14  4B C5 11 E1 */	bl fn_8010B4D4
/* 804BA2F8 004B5B18  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA2FC 004B5B1C  40 82 00 14 */	bne .L_804BA310
/* 804BA300 004B5B20  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 804BA304 004B5B24  38 80 00 01 */	li r4, 0x1
/* 804BA308 004B5B28  4B FE E0 A9 */	bl fn_804A83B0
/* 804BA30C 004B5B2C  48 00 00 FC */	b .L_804BA408
.L_804BA310:
/* 804BA310 004B5B30  7F C3 F3 78 */	mr r3, r30
/* 804BA314 004B5B34  38 9F 00 18 */	addi r4, r31, 0x18
/* 804BA318 004B5B38  4B C5 11 BD */	bl fn_8010B4D4
/* 804BA31C 004B5B3C  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA320 004B5B40  40 82 00 14 */	bne .L_804BA334
/* 804BA324 004B5B44  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 804BA328 004B5B48  38 80 00 02 */	li r4, 0x2
/* 804BA32C 004B5B4C  4B FE E0 85 */	bl fn_804A83B0
/* 804BA330 004B5B50  48 00 00 D8 */	b .L_804BA408
.L_804BA334:
/* 804BA334 004B5B54  7F C3 F3 78 */	mr r3, r30
/* 804BA338 004B5B58  38 9F 00 1E */	addi r4, r31, 0x1e
/* 804BA33C 004B5B5C  4B C5 11 99 */	bl fn_8010B4D4
/* 804BA340 004B5B60  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA344 004B5B64  40 82 00 14 */	bne .L_804BA358
/* 804BA348 004B5B68  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 804BA34C 004B5B6C  38 80 00 04 */	li r4, 0x4
/* 804BA350 004B5B70  4B FE E0 61 */	bl fn_804A83B0
/* 804BA354 004B5B74  48 00 00 B4 */	b .L_804BA408
.L_804BA358:
/* 804BA358 004B5B78  7F C3 F3 78 */	mr r3, r30
/* 804BA35C 004B5B7C  38 9F 00 24 */	addi r4, r31, 0x24
/* 804BA360 004B5B80  4B C5 11 75 */	bl fn_8010B4D4
/* 804BA364 004B5B84  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA368 004B5B88  40 82 00 14 */	bne .L_804BA37C
/* 804BA36C 004B5B8C  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 804BA370 004B5B90  38 80 00 05 */	li r4, 0x5
/* 804BA374 004B5B94  4B FE E0 3D */	bl fn_804A83B0
/* 804BA378 004B5B98  48 00 00 90 */	b .L_804BA408
.L_804BA37C:
/* 804BA37C 004B5B9C  7F C3 F3 78 */	mr r3, r30
/* 804BA380 004B5BA0  38 9F 00 28 */	addi r4, r31, 0x28
/* 804BA384 004B5BA4  4B C5 11 51 */	bl fn_8010B4D4
/* 804BA388 004B5BA8  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA38C 004B5BAC  40 82 00 14 */	bne .L_804BA3A0
/* 804BA390 004B5BB0  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 804BA394 004B5BB4  38 80 00 06 */	li r4, 0x6
/* 804BA398 004B5BB8  4B FE E0 19 */	bl fn_804A83B0
/* 804BA39C 004B5BBC  48 00 00 6C */	b .L_804BA408
.L_804BA3A0:
/* 804BA3A0 004B5BC0  7F C3 F3 78 */	mr r3, r30
/* 804BA3A4 004B5BC4  38 9F 00 2E */	addi r4, r31, 0x2e
/* 804BA3A8 004B5BC8  4B C5 11 2D */	bl fn_8010B4D4
/* 804BA3AC 004B5BCC  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA3B0 004B5BD0  40 82 00 14 */	bne .L_804BA3C4
/* 804BA3B4 004B5BD4  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 804BA3B8 004B5BD8  38 80 00 06 */	li r4, 0x6
/* 804BA3BC 004B5BDC  4B FE DF F5 */	bl fn_804A83B0
/* 804BA3C0 004B5BE0  48 00 00 48 */	b .L_804BA408
.L_804BA3C4:
/* 804BA3C4 004B5BE4  7F C3 F3 78 */	mr r3, r30
/* 804BA3C8 004B5BE8  38 9F 00 34 */	addi r4, r31, 0x34
/* 804BA3CC 004B5BEC  4B C5 11 09 */	bl fn_8010B4D4
/* 804BA3D0 004B5BF0  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA3D4 004B5BF4  40 82 00 14 */	bne .L_804BA3E8
/* 804BA3D8 004B5BF8  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 804BA3DC 004B5BFC  38 80 00 06 */	li r4, 0x6
/* 804BA3E0 004B5C00  4B FE DF D1 */	bl fn_804A83B0
/* 804BA3E4 004B5C04  48 00 00 24 */	b .L_804BA408
.L_804BA3E8:
/* 804BA3E8 004B5C08  7F C3 F3 78 */	mr r3, r30
/* 804BA3EC 004B5C0C  38 9F 00 3A */	addi r4, r31, 0x3a
/* 804BA3F0 004B5C10  4B C5 10 E5 */	bl fn_8010B4D4
/* 804BA3F4 004B5C14  2C 03 00 00 */	cmpwi r3, 0x0
/* 804BA3F8 004B5C18  40 82 00 10 */	bne .L_804BA408
/* 804BA3FC 004B5C1C  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 804BA400 004B5C20  38 80 00 06 */	li r4, 0x6
/* 804BA404 004B5C24  4B FE DF AD */	bl fn_804A83B0
.L_804BA408:
/* 804BA408 004B5C28  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804BA40C 004B5C2C  38 60 00 00 */	li r3, 0x0
/* 804BA410 004B5C30  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 804BA414 004B5C34  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804BA418 004B5C38  7C 08 03 A6 */	mtlr r0
/* 804BA41C 004B5C3C  38 21 00 10 */	addi r1, r1, 0x10
/* 804BA420 004B5C40  4E 80 00 20 */	blr
.endfn fn_804BA2A0