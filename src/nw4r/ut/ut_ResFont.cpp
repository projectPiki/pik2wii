#include <nw4r/ut/ut_ResFont.h>

#include <nw4r/ut/ut_binaryFileFormat.h>

namespace nw4r {
namespace ut {

namespace {

template <typename T>
inline void ResolveOffset(T*& rpPtr, void* pBase)
{
	rpPtr = reinterpret_cast<T*>(static_cast<char*>(pBase) + reinterpret_cast<s32>(rpPtr));
}

} // namespace

/**
 * @brief TODO
 *
 */
ResFont::ResFont()
{
}

/**
 * @brief TODO
 *
 */
ResFont::~ResFont()
{
}

/**
 * @brief TODO
 *
 */
bool ResFont::SetResource(void* pBuffer)
{
	BinaryFileHeader* pHeader = static_cast<BinaryFileHeader*>(pBuffer);
	FontInformation* pInfo    = nullptr;

	if (!IsManaging(nullptr)) {
		return false;
	}

	if (pHeader->signature == SIGNATURE_UNPACKED) {
		BinaryBlockHeader* pBlock = reinterpret_cast<BinaryBlockHeader*>(reinterpret_cast<char*>(pHeader) + pHeader->headerSize);

		for (int i = 0; i < pHeader->dataBlocks; i++) {
			if (pBlock->kind == SIGNATURE_FONTINFO) {
				pInfo = reinterpret_cast<FontInformation*>(pBlock + 1);
				break;
			}

			pBlock = reinterpret_cast<BinaryBlockHeader*>(reinterpret_cast<char*>(pBlock) + pBlock->size);
		}
	} else {
		if (pHeader->version == NW4R_VERSION(1, 4)) {
			if (!IsValidBinaryFile(pHeader, SIGNATURE, NW4R_VERSION(1, 4), 2)) {
				return false;
			}
		} else if (!IsValidBinaryFile(pHeader, SIGNATURE, NW4R_VERSION(1, 2), 2)) {
			return false;
		}

		pInfo = Rebuild(pHeader);
	}

	if (pInfo == nullptr) {
		return false;
	}

	SetResourceBuffer(pHeader, pInfo);
	InitReaderFunc(GetEncoding());

	return true;
}

/**
 * @brief TODO
 *
 */
FontInformation* ResFont::Rebuild(BinaryFileHeader* pHeader)
{
	BinaryBlockHeader* pBlock = reinterpret_cast<BinaryBlockHeader*>(reinterpret_cast<char*>(pHeader) + pHeader->headerSize);

	FontInformation* pInfo = nullptr;

	for (int i = 0; i < pHeader->dataBlocks; i++) {
		switch (pBlock->kind) {
		case SIGNATURE_FONTINFO: {
			pInfo = reinterpret_cast<FontInformation*>(pBlock + 1);
			ResolveOffset<FontTextureGlyph>(pInfo->pGlyph, pHeader);

			if (pInfo->pWidth != 0) {
				ResolveOffset<FontWidth>(pInfo->pWidth, pHeader);
			}

			if (pInfo->pMap != 0) {
				ResolveOffset<FontCodeMap>(pInfo->pMap, pHeader);
			}
			break;
		}

		case SIGNATURE_TEXGLYPH: {
			ResolveOffset<u8>(reinterpret_cast<FontTextureGlyph*>(pBlock + 1)->sheetImage, pHeader);
			break;
		}

		case SIGNATURE_CHARWIDTH: {
			FontWidth* pWidth = reinterpret_cast<FontWidth*>(pBlock + 1);
			if (pWidth->pNext != 0) {
				ResolveOffset<FontWidth>(pWidth->pNext, pHeader);
			}
			break;
		}

		case SIGNATURE_CHARMAP: {
			FontCodeMap* pMap = reinterpret_cast<FontCodeMap*>(pBlock + 1);
			if (pMap->pNext != 0) {
				ResolveOffset<FontCodeMap>(pMap->pNext, pHeader);
			}
			break;
		}

		case SIGNATURE_GLGR: {
			break;
		}

		default: {
			return nullptr;
		}
		}

		pBlock = reinterpret_cast<BinaryBlockHeader*>(reinterpret_cast<char*>(pBlock) + pBlock->size);
	}

	pHeader->signature = SIGNATURE_UNPACKED;
	return pInfo;
}

} // namespace ut
} // namespace nw4r
