.include "macros.inc"
.file "auto_fn_800231E4_text"

# 0x800231E4 - 0x80023294
.text
.balign 4

.fn fn_800231E4, global
/* 800231E4 0001EA04  3C 60 80 66 */	lis r3, lbl_8065F420@ha
/* 800231E8 0001EA08  3D 00 80 53 */	lis r8, lbl_80537F90@ha
/* 800231EC 0001EA0C  38 63 F4 20 */	addi r3, r3, lbl_8065F420@l
/* 800231F0 0001EA10  38 00 FF FF */	li r0, -0x1
/* 800231F4 0001EA14  88 83 00 3B */	lbz r4, 0x3b(r3)
/* 800231F8 0001EA18  39 60 00 00 */	li r11, 0x0
/* 800231FC 0001EA1C  90 03 00 B4 */	stw r0, 0xb4(r3)
/* 80023200 0001EA20  39 20 00 01 */	li r9, 0x1
/* 80023204 0001EA24  C0 02 83 08 */	lfs f0, lbl_8066D7E8@sda21(r0)
/* 80023208 0001EA28  39 08 7F 90 */	addi r8, r8, lbl_80537F90@l
/* 8002320C 0001EA2C  54 8C 07 BC */	rlwinm r12, r4, 0, 30, 30
/* 80023210 0001EA30  88 03 00 7B */	lbz r0, 0x7b(r3)
/* 80023214 0001EA34  38 E0 02 60 */	li r7, 0x260
/* 80023218 0001EA38  38 C0 01 C8 */	li r6, 0x1c8
/* 8002321C 0001EA3C  54 0A 07 BC */	rlwinm r10, r0, 0, 30, 30
/* 80023220 0001EA40  38 00 00 FF */	li r0, 0xff
/* 80023224 0001EA44  3C 80 80 02 */	lis r4, fn_80023294@ha
/* 80023228 0001EA48  3C A0 80 5D */	lis r5, lbl_805D1C98@ha
/* 8002322C 0001EA4C  99 83 00 3B */	stb r12, 0x3b(r3)
/* 80023230 0001EA50  38 84 32 94 */	addi r4, r4, fn_80023294@l
/* 80023234 0001EA54  38 A5 1C 98 */	addi r5, r5, lbl_805D1C98@l
/* 80023238 0001EA58  91 63 00 28 */	stw r11, 0x28(r3)
/* 8002323C 0001EA5C  91 63 00 20 */	stw r11, 0x20(r3)
/* 80023240 0001EA60  99 43 00 7B */	stb r10, 0x7b(r3)
/* 80023244 0001EA64  91 63 00 68 */	stw r11, 0x68(r3)
/* 80023248 0001EA68  91 63 00 60 */	stw r11, 0x60(r3)
/* 8002324C 0001EA6C  D0 03 00 88 */	stfs f0, 0x88(r3)
/* 80023250 0001EA70  99 23 00 8C */	stb r9, 0x8c(r3)
/* 80023254 0001EA74  D0 03 00 90 */	stfs f0, 0x90(r3)
/* 80023258 0001EA78  99 23 00 94 */	stb r9, 0x94(r3)
/* 8002325C 0001EA7C  91 63 00 9C */	stw r11, 0x9c(r3)
/* 80023260 0001EA80  91 03 00 A0 */	stw r8, 0xa0(r3)
/* 80023264 0001EA84  91 03 00 A4 */	stw r8, 0xa4(r3)
/* 80023268 0001EA88  90 E3 00 A8 */	stw r7, 0xa8(r3)
/* 8002326C 0001EA8C  90 C3 00 AC */	stw r6, 0xac(r3)
/* 80023270 0001EA90  99 63 00 B0 */	stb r11, 0xb0(r3)
/* 80023274 0001EA94  99 23 00 B1 */	stb r9, 0xb1(r3)
/* 80023278 0001EA98  91 63 00 B8 */	stw r11, 0xb8(r3)
/* 8002327C 0001EA9C  99 63 00 B4 */	stb r11, 0xb4(r3)
/* 80023280 0001EAA0  99 63 00 B5 */	stb r11, 0xb5(r3)
/* 80023284 0001EAA4  99 63 00 B6 */	stb r11, 0xb6(r3)
/* 80023288 0001EAA8  98 03 00 B7 */	stb r0, 0xb7(r3)
/* 8002328C 0001EAAC  91 63 00 80 */	stw r11, 0x80(r3)
/* 80023290 0001EAB0  48 0E 09 C8 */	b __register_global_object
.endfn fn_800231E4

# 0x80534C98 - 0x80534C9C
.section .ctors, "a"
.balign 4
	.4byte fn_800231E4