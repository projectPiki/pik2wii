#include <nw4r/g3d.h>

namespace nw4r {
namespace g3d {

/**
 * @brief TODO
 *
 */
void ResVtxPos::SetArray()
{
	if (IsValid()) {
		GXSetArray(GX_VA_POS, GetData(), ref().stride);
	}
}

/**
 * @brief TODO
 *
 */
void ResVtxPos::GetArray(const void** ppBase, u8* pStride) const
{
	if (ppBase != nullptr) {
		*ppBase = GetData();
	}

	if (pStride) {
		*pStride = ref().stride;
	}
}

/**
 * @brief TODO
 *
 */
void ResVtxPos::CopyTo(void* pDst) const
{
	if (!IsValid()) {
		return;
	}

	u32 size = GetSize();
	detail::Copy32ByteBlocks(pDst, ptr(), size);
	DCStoreRange(pDst, size);
}

/**
 * @brief TODO
 *
 */
void ResVtxNrm::SetArray()
{
	if (IsValid()) {
		GXSetArray(GX_VA_NRM, GetData(), ref().stride);
	}
}

/**
 * @brief TODO
 *
 */
void ResVtxNrm::GetArray(const void** ppBase, u8* pStride) const
{
	if (ppBase != nullptr) {
		*ppBase = GetData();
	}

	if (pStride) {
		*pStride = ref().stride;
	}
}

/**
 * @brief TODO
 *
 */
void ResVtxNrm::CopyTo(void* pDst) const
{
	if (!IsValid()) {
		return;
	}

	u32 size = GetSize();
	detail::Copy32ByteBlocks(pDst, ptr(), size);
	DCStoreRange(pDst, size);
}

/**
 * @brief TODO
 *
 */
void ResVtxClr::SetArray(GXAttr attr)
{
	if (IsValid() && (attr == GX_VA_CLR0 || attr == GX_VA_CLR1)) {
		GXSetArray(attr, GetData(), ref().stride);
	}
}

/**
 * @brief TODO
 *
 */
void ResVtxClr::GetArray(const void** ppBase, u8* pStride) const
{
	if (ppBase != nullptr) {
		*ppBase = GetData();
	}

	if (pStride) {
		*pStride = ref().stride;
	}
}

/**
 * @brief TODO
 *
 */
void ResVtxClr::CopyTo(void* pDst) const
{
	if (!IsValid()) {
		return;
	}

	u32 size = GetSize();
	detail::Copy32ByteBlocks(pDst, ptr(), size);
	DCStoreRange(pDst, size);
}

/**
 * @brief TODO
 *
 */
void ResVtxTexCoord::GetArray(const void** ppBase, u8* pStride) const
{
	if (ppBase != nullptr) {
		*ppBase = GetData();
	}

	if (pStride) {
		*pStride = ref().stride;
	}
}

/**
 * @brief TODO
 *
 */
void ResVtxFurPos::SetArray(u16 idx)
{
	if (IsValid()) {
		void* base_ptr = GetData(idx);
		GXSetArray(GX_VA_POS, base_ptr, ref().stride);
	}
}

/**
 * @brief TODO
 *
 */
void ResVtxPos::DCStore(bool sync)
{
	void* pBase = &ref();
	u32 size    = GetSize();

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
void ResVtxNrm::DCStore(bool sync)
{
	void* pBase = &ref();
	u32 size    = GetSize();

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
void ResVtxClr::DCStore(bool sync)
{
	void* pBase = &ref();
	u32 size    = GetSize();

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
void ResVtxTexCoord::DCStore(bool sync)
{
	void* pBase = &ref();
	u32 size    = GetSize();

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
void ResVtxFurVec::DCStore(bool sync)
{
	void* pBase = &ref();
	u32 size    = GetSize();

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
void ResVtxFurPos::DCStore(bool sync)
{
	void* pBase = &ref();
	u32 size    = GetSize();

	if (sync) {
		DC::StoreRange(pBase, size);
	} else {
		DC::StoreRangeNoSync(pBase, size);
	}
}

} // namespace g3d
} // namespace nw4r
