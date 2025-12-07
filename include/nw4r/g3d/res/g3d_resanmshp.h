#ifndef NW4R_G3D_RES_RESANMSHP_H
#define NW4R_G3D_RES_RESANMSHP_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_resdict.h>
#include <nw4r/g3d/res/g3d_resvtx.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
//////////////////// BLEND VERTICES ////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Mesh vertex info class (position, normal, color).
 *
 * @note Size: 0xC.
 */
struct ShpAnmVtxSet {

	friend bool operator==(const ShpAnmVtxSet& rLhs, const ShpAnmVtxSet& rRhs);

	ResVtxPos resVtxPos; // _00
	ResVtxNrm resVtxNrm; // _04
	ResVtxClr resVtxClr; // _08
};

inline bool operator==(const ShpAnmVtxSet& rLhs, const ShpAnmVtxSet& rRhs)
{
	return rLhs.resVtxPos == rRhs.resVtxPos && rLhs.resVtxNrm == rRhs.resVtxNrm && rLhs.resVtxClr == rRhs.resVtxClr;
}

/**
 * @brief Mesh vertex info for blending.
 *
 * @note Size: 0x10.
 */
struct BlendVtx {
	ShpAnmVtxSet vtxSet; // _00
	f32 weight;          // _0C
};

////////////////////////////////////////////////////////
////////////////// SHAPE ANIM RESULTS //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Data object for passing results of mesh animations.
 *
 * @note Size: 0x218.
 */
struct ShpAnmResult {

	/**
	 * @brief Flags/masks for vertex results.
	 */
	enum Flag {
		FLAG_ANM_EXISTS = (1 << 0),
		FLAG_ANM_VTXPOS = (1 << 1),
		FLAG_ANM_VTXNRM = (1 << 2),
		FLAG_ANM_VTXCLR = (1 << 3),
	};

	static const int MAX_KEY_SHAPE = 32;

	u32 flags;                        // _00
	u32 numKeyShape;                  // _04
	ShpAnmVtxSet baseShapeVtxSet;     // _08
	f32 baseShapeWeight;              // _14
	BlendVtx keyShape[MAX_KEY_SHAPE]; // _18
};

////////////////////////////////////////////////////////
///////////////// SHAPE ANIM RESOURCES /////////////////
////////////////////////////////////////////////////////

/**
 * @brief Animation data handler for a given mesh.
 *
 * @note Size: 0x18.
 */
struct ResAnmShpAnmData {
	enum Flag {
		FLAG_ANM_EXISTS = (1 << 0),
		FLAG_ANM_VTXPOS = (1 << 1),
		FLAG_ANM_VTXNRM = (1 << 2),
		FLAG_ANM_VTXCLR = (1 << 3),
	};

	u32 flags;                 // at 0x0
	s32 name;                  // at 0x4
	u16 baseShapeVtxIdx;       // at 0x8
	u16 numKeyShape;           // at 0xA
	u32 constFlags;            // at 0xC
	s32 toAnmIdxToVtxIdxTable; // at 0x10
	ResAnmData anms[1];        // at 0x14
};

/**
 * @brief Context info for mesh animations.
 *
 * @note Size: 0x8.
 */
struct ResAnmShpInfoData {
	u16 numFrame;     // _00
	u16 numVtxName;   // _02
	AnmPolicy policy; // _04
};

/**
 * @brief Underlying data structure for mesh animation resources.
 *
 * @note Size: 0x28.
 */
struct ResAnmShpData {
	ResBlockHeaderData header; // at 0x0
	u32 revision;              // at 0x8
	s32 toResFileData;         // at 0xC
	s32 toShpDataDic;          // at 0x10
	s32 toVtxNameArray;        // at 0x14
	s32 name;                  // at 0x18
	s32 original_path;         // at 0x1C
	ResAnmShpInfoData info;    // at 0x20
};

/**
 * @brief Wrapper class for mesh animations.
 *
 * @note Size: 0x4.
 */
class ResAnmShp : public ResCommon<ResAnmShpData> {
public:
	static const u32 SIGNATURE = FOURCC('S', 'H', 'P', '0');
	static const int REVISION  = 3;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmShp);

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	void GetAnmResult(ShpAnmResult* pResult, u32 idx, f32 frame, const ShpAnmVtxSet* pShapeArray) const;

	const ResAnmShpAnmData* GetShapeAnm(int idx) const
	{
		return static_cast<ResAnmShpAnmData*>(ofs_to_obj<ResDic>(ref().toShpDataDic)[idx]);
	}
	const ResAnmShpAnmData* GetShapeAnm(u32 idx) const
	{
		return static_cast<ResAnmShpAnmData*>(ofs_to_obj<ResDic>(ref().toShpDataDic)[idx]);
	}

	u32 GetShapeAnmNumEntries() const { return ofs_to_obj<ResDic>(ref().toShpDataDic).GetNumData(); }

	const s32* GetVtxNameArray() const { return ofs_to_ptr<s32>(ref().toVtxNameArray); }

	int GetNumFrame() const { return ref().info.numFrame; }

	int GetNumVtxNames() const { return ref().info.numVtxName; }

	AnmPolicy GetAnmPolicy() const { return ref().info.policy; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
