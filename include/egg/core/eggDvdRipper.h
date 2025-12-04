#ifndef EGG_CORE_DVDRIPPER_H
#define EGG_CORE_DVDRIPPER_H

#include <egg/egg_types.h>

namespace EGG {

////////////////////// DVD RIPPER //////////////////////

/**
 * @brief Namespace-like class for loading data from the DVD.
 *
 * @note Size: 0x0.
 */
class DvdRipper {
public:
	/**
	 * @brief Heap allocation end.
	 */
	enum EAllocDirection {
		ALLOC_DIR_TAIL, // 0
		ALLOC_DIR_HEAD, // 1
	};

public:
	static u8* loadToMainRAM(const char* pPath, u8* pBuffer, Heap* pHeap, EAllocDirection allocDir, u32 offset, u32* pRead, u32* pSize);

	static u8* loadToMainRAM(DvdFile* pFile, u8* pBuffer, Heap* pHeap, EAllocDirection allocDir, u32 offset, u32* pRead, u32* pSize);

private:
	static bool sErrorRetry;
};

////////////////////////////////////////////////////////

} // namespace EGG

#endif
