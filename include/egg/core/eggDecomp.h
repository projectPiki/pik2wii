#ifndef EGG_CORE_DECOMP_H
#define EGG_CORE_DECOMP_H

#include <egg/egg_types.h>

namespace EGG {

///////////////////// DECOMP TYPES /////////////////////

/**
 * @brief Namespace-like object for decompressing files.
 *
 * @note Size: 0x0.
 */
struct Decomp {

	/**
	 * @brief Types of compression.
	 */
	enum ECompressKind {
		cCompress_None, // 0
		cCompress_SZS,  // 1
		cCompress_ASH,  // 2
		cCompress_ASR,  // 3
	};

	/**
	 * @brief Types of file trees.
	 */
	enum ETreeKind {
		cTreeLiteral, // 0
		cTreeBackRef, // 1
		cTreeMax,     // 2
	};

	/**
	 * @brief Types of nodes.
	 */
	enum ENodeFlag {
		cNodeLeft  = 1 << 14, // 0x4000
		cNodeRight = 1 << 15, // 0x8000

		cNodeIndexMask = cNodeLeft - 1, // 0x3FFF
	};

	static ECompressKind checkCompressed(u8* pData);
	static int getExpandSize(u8* pData);

	static int decodeSZS(u8* pSrc, u8* pDst);

	static int getBitsCode(u8* pData, int size, int tree);
	static int getBit1c(u8* pData, int tree);
	static int readTree9(u8* pData, u16* pLeft, u16* pRight, u16* pStack);
	static int readTree12(u8* pData, u16* pLeft, u16* pRight, u16* pStack);

	static const int cTreeStackSize = 256;
	static const int cNode9Min      = 1 << 9;
	static const int cNode12Min     = 1 << 11;

	static u8* sWorkArea;

	static int sStreamBit[cTreeMax];
	static int sNextNodeID[cTreeMax];
	static int sStreamByte[cTreeMax];
	static u32 sStreamData[cTreeMax];
};

////////////////////////////////////////////////////////

} // namespace EGG

#endif
