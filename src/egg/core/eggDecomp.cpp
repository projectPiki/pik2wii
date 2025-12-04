#include "egg/core/eggDecomp.h"

namespace EGG {

/**
 * @brief TODO
 *
 */
int Decomp::decodeSZS(u8* pSrc, u8* pDst)
{
	int expandSize = pSrc[4] << 24 | pSrc[5] << 16 | pSrc[6] << 8 | pSrc[7];
	int srcIdx     = 0x10; // Skip header
	u8 bit         = 0;
	u8 chunk;

	for (int dstIdx = 0; dstIdx < expandSize; bit >>= 1) {
		// Refresh code bits
		if (bit == 0) {
			bit   = 0b10000000;
			chunk = pSrc[srcIdx++];
		}

		// Literal (chunk bit is set)
		if (chunk & bit) {
			pDst[dstIdx++] = pSrc[srcIdx++];
		}
		// Back-reference (chunk bit is not set)
		else {
			// Next bytes contain run offset, length
			int packed = pSrc[srcIdx] << 8 | pSrc[srcIdx + 1];
			srcIdx += 2;

			/**
			 * Short runs (N <= 15 + 2) use two bytes:
			 *     NF FF (N=size, F=offset)
			 * Minimum run size is 2 (overhead)
			 *
			 * Long runs (N <= 255 + 3) use three bytes:
			 *     0F FF NN (N=size, F=offset)
			 * Minimum run size is 0xF (max short run) + 3 (overhead)
			 */
			int runIdx = dstIdx - (packed & 0x0FFF);
			int runLen = (packed >> 12) == 0 ? pSrc[srcIdx++] + 0xF + 3 // Long run
			                                 : (packed >> 12) + 2;      // Short run

			for (; runLen > 0; runLen--, dstIdx++, runIdx++) {
				pDst[dstIdx] = pDst[runIdx - 1];
			}
		}
	}

	return expandSize;
}

/**
 * @brief TODO
 *
 */
Decomp::ECompressKind Decomp::checkCompressed(u8* pData)
{
	if (pData[0] == 'Y' && pData[1] == 'a' && pData[2] == 'z') {
		return cCompress_SZS;
	}

	if (pData[0] == 'A' && pData[1] == 'S' && pData[2] == 'H') {
		return cCompress_ASH;
	}

	if (pData[0] == 'A' && pData[1] == 'S' && pData[2] == 'R') {
		return cCompress_ASR;
	}

	return cCompress_None;
}

/**
 * @brief TODO
 *
 */
int Decomp::getExpandSize(u8* pData)
{
	switch (checkCompressed(pData)) {
	case cCompress_SZS: {
		return pData[4] << 24 | pData[5] << 16 | pData[6] << 8 | pData[7];
	}

	case cCompress_ASH: {
		return pData[5] << 16 | pData[6] << 8 | pData[7];
	}

	case cCompress_ASR: {
		return pData[5] << 16 | pData[6] << 8 | pData[7];
	}

	default: {
		return -1;
	}
	}
}

} // namespace EGG
