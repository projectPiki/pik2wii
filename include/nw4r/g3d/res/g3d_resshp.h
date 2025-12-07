#ifndef NW4R_G3D_RES_RESSHP_H
#define NW4R_G3D_RES_RESSHP_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_resmdl.h>
#include <nw4r/g3d/res/g3d_resvtx.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
////////////// PRE-PRIMITIVE DISPLAY LIST //////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for configuring GX state before rendering shape primitives.
 *
 * @note Size: 0xE0.
 */
struct ResPrePrimDL {
	static const int SIZE_GXVTXDESCLIST    = (GX_VA_TEX7 + 1) + 1;
	static const int SIZE_GXVTXATTRFMTLIST = (GX_VA_TEX7 - GX_VA_POS + 1) + 1;

	union {
		struct {
			u8 cullMode[10];                                          // _00
			u8 vtxDescv[21];                                          // _0A
			u8 PADDING_0x1F;                                          // _1F
			u8 vtxFmtv[GX_CP_CMD_SZ * 3];                             // _20
			u8 array[GX_POS_MTX_ARRAY - GX_VA_POS][GX_CP_CMD_SZ * 2]; // _32
			u8 PADDING_0xC2[0xE0 - 0xC2];                             // _C2
		} dl;

		u8 data[0xE0]; // _00
	};
};

/**
 * @brief Wrapper for resources for configuring GX state before rendering shape primitives.
 *
 * @note Size: 0x4.
 */
class ResShpPrePrim : public ResCommon<ResPrePrimDL> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF_EX(ResShpPrePrim, ResPrePrimDL);

	void DCStore(bool sync);

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
//////////////////// SHAPE RESOURCES ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief Data cache for vertex descriptor settings.
 *
 * @note Size: 0xC.
 */
struct ResCacheVtxDescv {
	void Clear() { data_u32[0] = data_u32[1] = data_u32[2] = 0; }

	bool operator==(const ResCacheVtxDescv& rRhs) const
	{
		return data_u32[0] == rRhs.data_u32[0] && data_u32[1] == rRhs.data_u32[1] && data_u32[2] == rRhs.data_u32[2];
	}

	union {
		u32 data_u32[0xC / sizeof(u32)];
		u8 data[0xC / sizeof(u8)];
	}; // _00
};

/**
 * @brief Data object indicating what matrix IDs are used for a given shape.
 *
 * @note Size: 0x8.
 */
struct ResMtxSetUsed {
	u32 numMtxID;    // _00
	u16 vecMtxID[2]; // _04
};

/**
 * @brief Underlying data structure for shape resources.
 *
 * @note Size: 0x70.
 */
struct ResShpData {

	/**
	 * @brief Flags for envelope skinning.
	 */
	enum IDFlag {
		ID_FLAG_ENVELOPE = (1 << 31),
	};

	/**
	 * @brief Flags for shape rendering.
	 */
	enum Flag {
		FLAG_INVISIBLE = (1 << 1),
	};

	u32 size;                                         // _00
	s32 toResMdlData;                                 // _04
	s32 curMtxIdx;                                    // _08
	ResCacheVtxDescv cache;                           // _0C
	ResTagDLData tagPrePrimDL;                        // _18
	ResTagDLData tagPrimDL;                           // _24
	u32 vcdBitmap;                                    // _30
	u32 flag;                                         // _34
	s32 name;                                         // _38
	u32 id;                                           // _3C
	u32 numVtx;                                       // _40
	u32 numPolygon;                                   // _44
	s16 idVtxPosition;                                // _48
	s16 idVtxNormal;                                  // _4A
	s16 idVtxColor[GX_VA_TEX0 - GX_VA_CLR0];          // _4C
	s16 idVtxTexCoord[GX_POS_MTX_ARRAY - GX_VA_TEX0]; // _50
	s16 idVtxFurVec;                                  // _60
	s16 idVtxFurPos;                                  // _62
	s32 toMtxSetUsed;                                 // _64
	ResMtxSetUsed msu;                                // _68
};

/**
 * @brief Wrapper for shape resources.
 *
 * @note Size: 0x4.
 */
class ResShp : public ResCommon<ResShpData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResShp);

	void Init();
	void Terminate();

	ResMdl GetParent() const;

	bool GXGetVtxDescv(GXVtxDescList* pList) const;
	bool GXGetVtxAttrFmtv(GXVtxAttrFmtList* pList) const;
	void GXSetArray(GXAttr attr, const void* pBase, u8 stride);
	void DisableSetArray(GXAttr attr);

	ResVtxPos GetResVtxPos() const;
	ResVtxNrm GetResVtxNrm() const;
	ResVtxClr GetResVtxClr(u32 idx) const;
	ResVtxTexCoord GetResVtxTexCoord(u32 idx) const;
	ResVtxFurPos GetResVtxFurPos() const;

	void CallPrePrimitiveDisplayList(bool sync, bool cacheIsSame) const;
	void CallPrimitiveDisplayList(bool sync) const;

	ResTagDL GetPrePrimDLTag() { return ResTagDL(&ref().tagPrePrimDL); }
	ResTagDL GetPrePrimDLTag() const { return ResTagDL(const_cast<ResTagDLData*>(&ref().tagPrePrimDL)); }

	ResTagDL GetPrimDLTag() { return ResTagDL(&ref().tagPrimDL); }
	ResTagDL GetPrimDLTag() const { return ResTagDL(const_cast<ResTagDLData*>(&ref().tagPrimDL)); }

	ResShpPrePrim GetResShpPrePrim() { return ResShpPrePrim(GetPrePrimDLTag().GetDL()); }
	ResShpPrePrim GetResShpPrePrim() const { return ResShpPrePrim(GetPrePrimDLTag().GetDL()); }

	bool ExistVtxDesc(GXAttr attr) const { return ref().vcdBitmap & (1 << attr); }

	bool IsVisible() const { return !(ref().flag & ResShpData::FLAG_INVISIBLE); }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
