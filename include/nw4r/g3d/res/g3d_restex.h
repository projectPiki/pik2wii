#ifndef NW4R_G3D_RES_RESTEX_H
#define NW4R_G3D_RES_RESTEX_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
////////////////// TEXTURE RESOURCES ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for texture resources.
 *
 * @note Size: 0x38.
 */
struct ResTexData {

	/**
	 * @brief Flag for whether the resource uses color indexing (to a TLUT) or stores the color in the texture.
	 */
	enum Flag {
		FLAG_CIFMT = (1 << 0),
	};

	ResBlockHeaderData header; // _00
	u32 revision;              // _08
	s32 toResFileData;         // _0C
	s32 toTexData;             // _10
	s32 name;                  // _14
	u32 flag;                  // _18
	u16 width;                 // _1C
	u16 height;                // _1E
	union {
		GXTexFmt fmt;
		GXCITexFmt cifmt;
	}; // _20
	u32 mipmap_level;  // _24
	f32 min_lod;       // _28
	f32 max_lod;       // _2C
	s32 original_path; // _30
	s32 toResUserData; // _34
};

/**
 * @brief Wrapper for texture resources.
 *
 * @note Size: 0x4.
 */
class ResTex : public ResCommon<ResTexData> {
public:
	static const u32 SIGNATURE = FOURCC('T', 'E', 'X', '0');
	static const int REVISION  = 1;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResTex);

	void Init();

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	bool GetTexObjParam(void** ppTexData, u16* pWidth, u16* pHeight, GXTexFmt* pFormat, f32* pMinLod, f32* pMaxLod, GXBool* pMipMap) const;

	bool GetTexObjCIParam(void** ppTexData, u16* pWidth, u16* pHeight, GXCITexFmt* pFormatCI, f32* pMinLod, f32* pMaxLod,
	                      GXBool* pMipMap) const;

	bool IsCIFmt() const { return ref().flag & ResTexData::FLAG_CIFMT; }

	u16 GetWidth() const { return ref().width; }
	u16 GetHeight() const { return ref().height; }

	const void* GetTexData() const { return ofs_to_ptr<void>(ref().toTexData); }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
