#ifndef NW4R_G3D_RES_RESMDL_H
#define NW4R_G3D_RES_RESMDL_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_resdict.h>
#include <nw4r/g3d/res/g3d_resmat.h>
#include <nw4r/g3d/res/g3d_resnode.h>
#include <nw4r/g3d/res/g3d_resshp.h>
#include <nw4r/g3d/res/g3d_resvtx.h>

#include <nw4r/math.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
///////////////// MODEL INFO RESOURCES /////////////////
////////////////////////////////////////////////////////

/**
 * @brief Base empty class for model information (just flags for texture source and skinning).
 *
 * @note Size: 0x0.
 */
struct ResMdlInfoDataTypedef {
	enum TexMatrixMode {
		TEXMATRIXMODE_MAYA,   // 0
		TEXMATRIXMODE_XSI,    // 1
		TEXMATRIXMODE_3DSMAX, // 2
	};

	enum EnvelopeMatrixMode {
		EVPMATRIXMODE_NORMAL, // 0
		EVPMATRIXMODE_APPROX, // 1
		EVPMATRIXMODE_EXACT,  // 2
	};
};

/**
 * @brief Scaling rules based on texture/model source software.
 */
enum ScalingRule {
	SCALINGRULE_STANDARD,  // 0
	SCALINGRULE_SOFTIMAGE, // 1
	SCALINGRULE_MAYA,      // 2
};

/**
 * @brief Stores number of matrix IDs, to convert to node/bone IDs.
 *
 * @note Size: 0x4.
 */
struct ResMtxIDToNodeIDData {
	u32 numMtxID; // _00
};

/**
 * @brief Underlying data structure for model info resources.
 *
 * @note Size: 0x40.
 */
struct ResMdlInfoData : public ResMdlInfoDataTypedef {
	u32 size;                   // _00
	s32 toResMdlData;           // _04
	ScalingRule scaling_rule;   // _08
	TexMatrixMode tex_mtx_mode; // _0C
	s32 vertex_size;            // _10
	s32 triangle_size;          // _14
	s32 original_path;          // _18
	u32 numViewMtx;             // _1C
	bool need_nrm_mtx_array;    // _20
	bool need_tex_mtx_array;    // _21
	bool is_valid_volume;       // _22
	u8 envelope_mtx_mode;       // _23
	s32 toMtxIDToNodeID;        // _24
	math::_VEC3 volume_min;     // _28
	math::_VEC3 volume_max;     // _34
};

/**
 * @brief Wrapper for model info resources.
 *
 * @note Size: 0x4.
 */
class ResMdlInfo : public ResCommon<ResMdlInfoData>, public ResMdlInfoDataTypedef {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResMdlInfo);

	ScalingRule GetScalingRule() const { return ref().scaling_rule; }

	u32 GetNumViewMtx() const { return ref().numViewMtx; }

	EnvelopeMatrixMode GetEnvelopeMatrixMode() const { return static_cast<EnvelopeMatrixMode>(ref().envelope_mtx_mode); }

	u32 GetNumPosNrmMtx() const
	{
		const ResMtxIDToNodeIDData* pData
		    = reinterpret_cast<const ResMtxIDToNodeIDData*>(reinterpret_cast<const u8*>(&ref()) + ref().toMtxIDToNodeID);

		return pData->numMtxID;
	}

	s32 GetNodeIDFromMtxID(u32 id) const
	{
		const s32* pArray
		    = reinterpret_cast<const s32*>(reinterpret_cast<const u8*>(&ref()) + ref().toMtxIDToNodeID + sizeof(ResMtxIDToNodeIDData));

		return pArray[id];
	}

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
/////////////////// MODEL RESOURCES ////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for model resources.
 *
 * @note Size: 0x8C.
 */
struct ResMdlData {
	ResBlockHeaderData header;         // _00
	u32 revision;                      // _08
	s32 toResFileData;                 // _0C
	s32 toResByteCodeDic;              // _10
	s32 toResNodeDic;                  // _14
	s32 toResVtxPosDic;                // _18
	s32 toResVtxNrmDic;                // _1C
	s32 toResVtxClrDic;                // _20
	s32 toResVtxTexCoordDic;           // _24
	s32 toResVtxFurVecDic;             // _28
	s32 toResVtxFurPosDic;             // _2C
	s32 toResMatDic;                   // _30
	s32 toResTevDic;                   // _34
	s32 toResShpDic;                   // _38
	s32 toResTexNameToTexPlttInfoDic;  // _3C
	s32 toResPlttNameToTexPlttInfoDic; // _40
	s32 toResUserData;                 // _44
	s32 name;                          // _48
	ResMdlInfoData info;               // _4C
};

/**
 * @brief Wrapper for model resources.
 *
 * @note Size: 0x4.
 */
class ResMdl : public ResCommon<ResMdlData> {
public:
	static const u32 SIGNATURE = FOURCC('M', 'D', 'L', '0');
	static const int REVISION  = 9;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResMdl);

	void Init();
	void Terminate();

	bool Bind(const ResFile file);
	void Release();

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	const u8* GetResByteCode(const char* pName) const;

	ResNode GetResNode(const char* pName) const;
	ResNode GetResNode(const ResName name) const;
	ResNode GetResNode(int idx) const;
	ResNode GetResNode(u32 idx) const;
	u32 GetResNodeNumEntries() const;

	ResVtxPos GetResVtxPos(const ResName name) const;
	ResVtxPos GetResVtxPos(int idx) const;
	ResVtxPos GetResVtxPos(u32 idx) const;
	u32 GetResVtxPosNumEntries() const;

	ResVtxNrm GetResVtxNrm(const ResName name) const;
	ResVtxNrm GetResVtxNrm(int idx) const;
	ResVtxNrm GetResVtxNrm(u32 idx) const;
	u32 GetResVtxNrmNumEntries() const;

	ResVtxClr GetResVtxClr(const ResName name) const;
	ResVtxClr GetResVtxClr(int idx) const;
	ResVtxClr GetResVtxClr(u32 idx) const;
	u32 GetResVtxClrNumEntries() const;

	ResVtxTexCoord GetResVtxTexCoord(int idx) const;
	u32 GetResVtxTexCoordNumEntries() const;

	ResVtxFurPos GetResVtxFurPos(int idx) const;
	u32 GetResVtxFurPosNumEntries() const;

	ResVtxFurVec GetResVtxFurVec(int idx) const;
	u32 GetResVtxFurVecNumEntries() const;

	ResMat GetResMat(const char* pName) const;
	ResMat GetResMat(const ResName name) const;
	ResMat GetResMat(int idx) const;
	ResMat GetResMat(u32 idx) const;
	u32 GetResMatNumEntries() const;

	ResShp GetResShp(const char* pName) const;
	ResShp GetResShp(int idx) const;
	ResShp GetResShp(u32 idx) const;
	u32 GetResShpNumEntries() const;

	ResTexPlttInfo GetResTexPlttInfoOffsetFromTexName(int idx) const;
	u32 GetResTexPlttInfoOffsetFromTexNameNumEntries() const;

	ResMdlInfo GetResMdlInfo() { return ResMdlInfo(&ref().info); }
	ResMdlInfo GetResMdlInfo() const { return ResMdlInfo(const_cast<ResMdlInfoData*>(&ref().info)); }

	// _00-_04 = ResCommon
};

} // namespace g3d
} // namespace nw4r

#endif
