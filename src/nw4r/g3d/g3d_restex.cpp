#include <nw4r/g3d.h>

namespace nw4r {
namespace g3d {

/**
 * @brief TODO
 *
 */
void ResPltt::DCStore(bool sync)
{
	void* pBase = &ref();
	u32 size    = ref().header.size;

	if (sync) {
		DC::StoreRange(pBase, size);
	} else {
		DC::StoreRangeNoSync(pBase, size);
	}
}

/**
 * @brief TODO
 *
 */
bool ResTex::GetTexObjParam(void** ppTexData, u16* pWidth, u16* pHeight, GXTexFmt* pFormat, f32* pMinLod, f32* pMaxLod,
                            GXBool* pMipMap) const
{
	const ResTexData& r = ref();

	if (IsCIFmt()) {
		return false;
	}

	if (ppTexData != nullptr) {
		*ppTexData = const_cast<void*>(GetTexData());
	}

	if (pWidth != nullptr) {
		*pWidth = GetWidth();
	}

	if (pHeight != nullptr) {
		*pHeight = GetHeight();
	}

	if (pFormat != nullptr) {
		*pFormat = r.fmt;
	}

	if (pMinLod != nullptr) {
		*pMinLod = r.min_lod;
	}

	if (pMaxLod != nullptr) {
		*pMaxLod = r.max_lod;
	}

	if (pMipMap != nullptr) {
		*pMipMap = r.mipmap_level > 1;
	}

	return true;
}

/**
 * @brief TODO
 *
 */
bool ResTex::GetTexObjCIParam(void** ppTexData, u16* pWidth, u16* pHeight, GXCITexFmt* pFormatCI, f32* pMinLod, f32* pMaxLod,
                              GXBool* pMipMap) const
{
	const ResTexData& r = ref();

	if (!IsCIFmt()) {
		return false;
	}

	if (ppTexData != nullptr) {
		*ppTexData = const_cast<void*>(GetTexData());
	}

	if (pWidth != nullptr) {
		*pWidth = GetWidth();
	}

	if (pHeight != nullptr) {
		*pHeight = GetHeight();
	}

	if (pFormatCI != nullptr) {
		*pFormatCI = r.cifmt;
	}

	if (pMinLod != nullptr) {
		*pMinLod = r.min_lod;
	}

	if (pMaxLod != nullptr) {
		*pMaxLod = r.max_lod;
	}

	if (pMipMap != nullptr) {
		*pMipMap = r.mipmap_level > 1;
	}

	return true;
}

/**
 * @brief TODO
 *
 */
void ResTex::Init()
{
	ResTexData& r = ref();
	DC::FlushRangeNoSync(&r, r.header.size);
}

} // namespace g3d
} // namespace nw4r
