#ifndef EGG_DECOMP_H
#define EGG_DECOMP_H

#include "egg/egg_types.h"

namespace EGG {

struct Decomp {
    enum ECompressKind {
        cCompress_None,
        cCompress_SZS,
        cCompress_ASH,
        cCompress_ASR
    };

    static ECompressKind checkCompressed(u8* pData);
    static int getExpandSize(u8* pData);


    static int decodeSZS(u8* pSrc, u8* pDst);



    enum ETreeKind { cTreeLiteral, cTreeBackRef, cTreeMax };

    enum ENodeFlag {
        cNodeLeft = 1 << 14,
        cNodeRight = 1 << 15,
        cNodeIndexMask = cNodeLeft - 1
    };

    static const int cTreeStackSize = 256;
    static const int cNode9Min = 1 << 9;
    static const int cNode12Min = 1 << 11;


    static int getBitsCode(u8* pData, int size, int tree);
    static int getBit1c(u8* pData, int tree);
    static int readTree9(u8* pData, u16* pLeft, u16* pRight, u16* pStack);
    static int readTree12(u8* pData, u16* pLeft, u16* pRight, u16* pStack);


    static u8* sWorkArea;

    static int sStreamBit[cTreeMax];
    static int sNextNodeID[cTreeMax];
    static int sStreamByte[cTreeMax];
    static u32 sStreamData[cTreeMax];
};

} // namespace EGG

#endif