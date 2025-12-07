#ifndef NW4R_G3D_RES_RESANMVIS_H
#define NW4R_G3D_RES_RESANMVIS_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_resdict.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
/////////// ADJUSTABLE VISIBILITY ANIMATIONS ///////////
////////////////////////////////////////////////////////

/**
 * @brief Visibility info for a given animation.
 *
 * @note Size: 0xC.
 */
struct ResAnmVisAnmData {

	/**
	 * @brief Flags for if visibility is adjustable.
	 */
	enum Flag {
		FLAG_ENABLE = (1 << 0), // 0x1
		FLAG_CONST  = (1 << 1), // 0x2
	};

	s32 name;                        // _00
	u32 flags;                       // _04
	ResBoolAnmFramesData visibility; // _08
};

/**
 * @brief Context info for visibliity animation resources.
 *
 * @note Size: 0x8.
 */
struct ResAnmVisInfoData {
	u16 numFrame;     // _00
	u16 numNode;      // _02
	AnmPolicy policy; // _04
};

/**
 * @brief Underlying data structure for visibility animation resources.
 *
 * @note Size: 0x28.
 */
struct ResAnmVisData {
	ResBlockHeaderData header; // _00
	u32 revision;              // _08
	s32 toResFileData;         // _0C
	s32 toVisDataDic;          // _10
	s32 toResUserData;         // _14
	s32 name;                  // _18
	s32 original_path;         // _1C
	ResAnmVisInfoData info;    // _20
};

/**
 * @brief Wrapper for visibility animation resources.
 *
 * @note Size: 0x4.
 */
class ResAnmVis : public ResCommon<ResAnmVisData> {
public:
	static const u32 SIGNATURE = FOURCC('V', 'I', 'S', '0');
	static const int REVISION  = 3;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmVis);

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	bool GetAnmResult(u32 idx, f32 frame) const;

	const ResAnmVisAnmData* GetNodeAnm(int idx) const
	{
		return static_cast<ResAnmVisAnmData*>(ofs_to_obj<ResDic>(ref().toVisDataDic)[idx]);
	}
	const ResAnmVisAnmData* GetNodeAnm(u32 idx) const
	{
		return static_cast<ResAnmVisAnmData*>(ofs_to_obj<ResDic>(ref().toVisDataDic)[idx]);
	}

	int GetNumFrame() const { return ref().info.numFrame; }

	int GetNumNode() const { return ref().info.numNode; }

	AnmPolicy GetAnmPolicy() const { return ref().info.policy; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
