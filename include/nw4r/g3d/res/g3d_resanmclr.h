#ifndef NW4R_G3D_RES_RESANMCLR_H
#define NW4R_G3D_RES_RESANMCLR_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_resdict.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
////////////////// COLOR ANIM RESULTS //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Data object for passing color animation results.
 *
 * @note Size: 0x5C.
 */
struct ClrAnmResult {

	/**
	 * @brief Color anim channels/types.
	 */
	enum ColorAnim {
		CLA_CLR0,
		CLA_CLR1,
		CLA_AMB0,
		CLA_AMB1,

		CLA_TEV0,
		CLA_TEV1,
		CLA_TEV2,

		CLA_TEVK0,
		CLA_TEVK1,
		CLA_TEVK2,
		CLA_TEVK3,

		CLA_MAX
	};

	u32 bRgbaExist;        // _00
	u32 rgba[CLA_MAX];     // _04
	u32 rgbaMask[CLA_MAX]; // _30
};

////////////////////////////////////////////////////////
///////////////// COLOR ANIM RESOURCES /////////////////
////////////////////////////////////////////////////////

/**
 * @brief Base data object for color animations.
 *
 * @note Size: 0x8.
 */
struct ResAnmClrAnmData {
	u32 mask;              // _00
	ResColorAnmData color; // _04
};

/**
 * @brief Material-color data for color animations.
 *
 * @note Size: 0x10.
 */
struct ResAnmClrMatData {

	/**
	 * @brief Basic control flags for material-color animations.
	 */
	enum Flag {
		FLAG_ANM_EXISTS   = (1 << 0),
		FLAG_ANM_CONSTANT = (1 << 1),

		// Two bits in 'flags' for each animation
		NUM_OF_FLAGS = 2
	};

	s32 name;                 // _00
	u32 flags;                // _04
	ResAnmClrAnmData anms[1]; // _08
};

/**
 * @brief Context/control info for color animations.
 *
 * @note Size: 0x8.
 */
struct ResAnmClrInfoData {
	u16 numFrame;     // _00
	u16 numMaterial;  // _02
	AnmPolicy policy; // _04
};

/**
 * @brief Underlying data structure of color animation resources.
 *
 * @note Size: 0x24.
 */
struct ResAnmClrData {
	ResBlockHeaderData header; // _00
	u32 revision;              // _08
	s32 toResFileData;         // _0C
	s32 toClrDataDic;          // _10
	s32 toResUserData;         // _14
	s32 name;                  // _18
	s32 original_path;         // _1C
	ResAnmClrInfoData info;    // _20
};

/**
 * @brief Wrapper class for color animation resources.
 *
 * @note Size: 0x4.
 */
class ResAnmClr : public ResCommon<ResAnmClrData> {
public:
	static const u32 SIGNATURE = FOURCC('C', 'L', 'R', '0');
	static const int REVISION  = 4;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmClr);

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	void GetAnmResult(ClrAnmResult* pResult, u32 idx, f32 frame) const;

	const ResAnmClrMatData* GetMatAnm(int idx) const { return static_cast<ResAnmClrMatData*>(ofs_to_obj<ResDic>(ref().toClrDataDic)[idx]); }
	const ResAnmClrMatData* GetMatAnm(u32 idx) const { return static_cast<ResAnmClrMatData*>(ofs_to_obj<ResDic>(ref().toClrDataDic)[idx]); }

	int GetNumFrame() const { return ref().info.numFrame; }

	int GetNumMaterial() const { return ref().info.numMaterial; }

	AnmPolicy GetAnmPolicy() const { return ref().info.policy; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
