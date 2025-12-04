#ifndef NW4R_UT_BINARYFILEFORMAT_H
#define NW4R_UT_BINARYFILEFORMAT_H

#include <nw4r/types_nw4r.h>

namespace nw4r {
namespace ut {

///////////////////// BINARY TYPES /////////////////////

/**
 * @brief Header info for blocks of data.
 *
 * @note Size: 0x8.
 */
struct BinaryBlockHeader {
	u32 kind; // _00
	u32 size; // _04
};

/**
 * @brief Header info for binary files.
 *
 * @note Size: 0x10.
 */
struct BinaryFileHeader {
	u32 signature;  // _00
	u16 byteOrder;  // _04
	u16 version;    // _06
	u32 fileSize;   // _08
	u16 headerSize; // _0C
	u16 dataBlocks; // _0E
};

////////////////////////////////////////////////////////
/////////////////// GLOBAL FUNCTIONS ///////////////////

bool IsValidBinaryFile(const BinaryFileHeader* pHeader, u32 signature, u16 version, u16 minBlocks);

////////////////////////////////////////////////////////

} // namespace ut
} // namespace nw4r

#endif
