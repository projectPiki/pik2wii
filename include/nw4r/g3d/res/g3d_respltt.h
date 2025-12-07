#ifndef NW4R_G3D_RES_RESPLTT_H
#define NW4R_G3D_RES_RESPLTT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
////////////////// PALETTE RESOURCES ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for palette resources.
 *
 * @note Size: 0x28.
 */
struct ResPlttData {
	ResBlockHeaderData header; // _00
	u32 revision;              // _08
	s32 toResFileData;         // _0C
	s32 toPlttData;            // _10
	s32 name;                  // _14
	GXTlutFmt fmt;             // _18
	u16 numEntries;            // _1C
	u16 PADDING_0x1E;          // _1E
	s32 original_path;         // _20
	s32 toResUserData;         // _24
};

/**
 * @brief Wrapper for palette resources.
 *
 * @note Size: 0x4.
 */
class ResPltt : public ResCommon<ResPlttData> {
public:
	static const u32 SIGNATURE = FOURCC('P', 'L', 'T', '0');
	static const int REVISION  = 1;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResPltt);

	void Init() { DCStore(false); }

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	void DCStore(bool sync);

	u16* GetPlttData()
	{
		ResPlttData& r = ref();

		// clang-format off
        return r.toPlttData != 0
            ? reinterpret_cast<u16*>(reinterpret_cast<u8*>(&r) + r.toPlttData)
            : nullptr;
		// clang-format on
	}

	const u16* GetPlttData() const
	{
		const ResPlttData& r = ref();

		// clang-format off
        return r.toPlttData != 0
            ? reinterpret_cast<const u16*>(reinterpret_cast<const u8*>(&r) + r.toPlttData)
            : nullptr;
		// clang-format on
	}

	GXTlutFmt GetFmt() const { return ref().fmt; }

	u32 GetNumEntries() const { return ref().numEntries; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
