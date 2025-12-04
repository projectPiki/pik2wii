#include <egg/core/eggDvdFile.h>
#include <egg/core/eggDvdRipper.h>
#include <egg/core/eggHeap.h>

#include "RevoSDK/os.h"
#include "RevoSDK/vi.h"

namespace EGG {

bool DvdRipper::sErrorRetry = true;

/**
 * @brief TODO
 *
 */
u8* DvdRipper::loadToMainRAM(const char* pPath, u8* pBuffer, Heap* pHeap, EAllocDirection allocDir, u32 offset, u32* pRead, u32* pSize)
{

	DvdFile file = DvdFile();

	if (!file.open(pPath)) {
		return nullptr;
	}

	return loadToMainRAM(&file, pBuffer, pHeap, allocDir, offset, pRead, pSize);
}

/**
 * @brief TODO
 *
 */
u8* DvdRipper::loadToMainRAM(DvdFile* pFile, u8* pBuffer, Heap* pHeap, EAllocDirection allocDir, u32 offset, u32* pRead, u32* pSize)
{

	bool allocedBuffer = false;
	u32 fileSize       = pFile->getFileSize();

	if (pSize != nullptr) {
		*pSize = fileSize;
	}

	fileSize = ROUND_UP(fileSize, 32);

	if (pBuffer == nullptr) {
		pBuffer = static_cast<u8*>(Heap::alloc(fileSize - offset, allocDir == ALLOC_DIR_HEAD ? 32 : -32, pHeap));

		allocedBuffer = true;
	}

	if (pBuffer == nullptr) {
		// EGG_PRINT("heap allocation Failed: %d (heap %p)\n", fileSize - offset,
		//           pHeap);

		return nullptr;
	}

	if (offset > 0) {
		u8 chunk[32 + 31];
		void* const pChunk = ROUND_UP_PTR(chunk, 32);

		while (true) {
			s32 readFailed = DVDReadPrio(pFile->getFileInfo(), pChunk, 32, offset, 2);

			if (readFailed >= 0) {
				break;
			}

			if (readFailed == DVD_RESULT_CANCELED || !sErrorRetry) {
				if (allocedBuffer) {
					Heap::free(pBuffer, nullptr);
				}

				return nullptr;
			}

			VIWaitForRetrace();
		}

		DCInvalidateRange(pChunk, 32);
	}

	while (true) {
		s32 readFailed = DVDReadPrio(pFile->getFileInfo(), pBuffer, fileSize - offset, offset, 2);

		if (readFailed >= 0) {
			break;
		}

		if (readFailed == DVD_RESULT_CANCELED || !sErrorRetry) {
			// EGG_PRINT("readFailed : %d\n", readFailed);

			if (allocedBuffer) {
				Heap::free(pBuffer, nullptr);
			}

			return nullptr;
		}

		VIWaitForRetrace();
	}

	if (pRead != nullptr) {
		*pRead = fileSize - offset;
	}

	return pBuffer;
}

} // namespace EGG
