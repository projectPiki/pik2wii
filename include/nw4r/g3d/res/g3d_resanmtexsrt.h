#ifndef NW4R_G3D_RES_RESANMTEXSRT_H
#define NW4R_G3D_RES_RESANMTEXSRT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_resdict.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
///////////////////// COMMON TYPES /////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Base empty class for data/resources that deal with hardware matrix slots.
 *
 * @note Size: 0x0.
 */
struct ResAnmTexSrtDataTypedef {
	static const int NUM_OF_MAT_TEX_MTX = 8;
	static const int NUM_OF_IND_TEX_MTX = 3;
	static const int NUM_OF_TEX_MTX     = NUM_OF_MAT_TEX_MTX + NUM_OF_IND_TEX_MTX;
};

/**
 * @brief Base empty class for data/resources that deal with different texture matrix sources.
 *
 * @note Size: 0x0.
 */
struct TexSrtTypedef {

	/**
	 * @brief Flags for texture matrices from different sources.
	 */
	enum TexMatrixMode {
		TEXMATRIXMODE_MAYA,   // 0
		TEXMATRIXMODE_XSI,    // 1
		TEXMATRIXMODE_3DSMAX, // 2
	};
};

////////////////////////////////////////////////////////
/////////////// TEXTURE SRT ANIM RESULTS ///////////////
////////////////////////////////////////////////////////

/**
 * @brief Single SRT (Scale, Rotation, Translation) parameters for a texture matrix.
 *
 * @note Size: 0x14.
 */
struct TexSrt : public TexSrtTypedef {

	/**
	 * @brief Flags for controlling which SRT operations are active.
	 */
	enum Flag {
		FLAG_ANM_EXISTS = (1 << 0),
		FLAG_SCALE_ONE  = (1 << 1),
		FLAG_ROT_ZERO   = (1 << 2),
		FLAG_TRANS_ZERO = (1 << 3),

		FLAGSET_IDENTITY = (1 << 0) | (1 << 1) | (1 << 2) | (1 << 3),
		NUM_OF_FLAGS     = 4
	};

	f32 Su; // _00
	f32 Sv; // _04
	f32 R;  // _08
	f32 Tu; // _0C
	f32 Tv; // _10
};

/**
 * @brief Object for passing results from texture SRT animations.
 *
 * @note Size: 0xE8.
 */
struct TexSrtAnmResult : public ResAnmTexSrtDataTypedef, public TexSrtTypedef {

	/**
	 * @brief Flags for controlling which SRT operations are active in the anim results.
	 */
	enum Flag {
		FLAG_ANM_EXISTS = (1 << 0),
		FLAG_SCALE_ONE  = (1 << 1),
		FLAG_ROT_ZERO   = (1 << 2),
		FLAG_TRANS_ZERO = (1 << 3),

		// Four bits in 'flags' for each animation
		NUM_OF_FLAGS = 4
	};

	u32 flags;                  // _00
	u32 indFlags;               // _04
	TexMatrixMode texMtxMode;   // _08
	TexSrt srt[NUM_OF_TEX_MTX]; // _0C
};

////////////////////////////////////////////////////////
////////////// TEXTURE SRT ANIM RESOURCES //////////////
////////////////////////////////////////////////////////

/**
 * @brief Animations for a single texture matrix.
 *
 * @note Size: 0xE8.
 */
struct ResAnmTexSrtTexData {

	/**
	 * @brief Flags for controlling which SRT operations should be active in the anims.
	 */
	enum Flag {
		FLAG_ANM_EXISTS = (1 << 0),
		FLAG_SCALE_ONE  = (1 << 1),
		FLAG_ROT_ZERO   = (1 << 2),
		FLAG_TRANS_ZERO = (1 << 3),

		FLAG_SCALE_UNIFORM = (1 << 4),
		FLAG_SCALE_U_CONST = (1 << 5),
		FLAG_SCALE_V_CONST = (1 << 6),

		FLAG_ROT_CONST     = (1 << 7),
		FLAG_TRANS_U_CONST = (1 << 8),
		FLAG_TRANS_V_CONST = (1 << 9),
	};

	u32 flags;          // at 0x0
	ResAnmData anms[1]; // at 0x4
};

/**
 * @brief Animation data for all texture matrices for a given (named) material.
 *
 * @note Size: 0x10.
 */
struct ResAnmTexSrtMatData : public ResAnmTexSrtDataTypedef {

	/**
	 * @brief Switch for if anims exist for the given material.
	 */
	enum Flag {
		FLAG_ANM_EXISTS = (1 << 0),

		NUM_OF_FLAGS = 1
	};

	s32 name;                     // _00
	u32 flags;                    // _04
	u32 indFlags;                 // _08
	s32 toResAnmTexSrtTexData[1]; // _0C
};

/**
 * @brief Context data for texture matrix animation resources.
 *
 * @note Size: 0xC.
 */
struct ResAnmTexSrtInfoData : public TexSrtTypedef {
	u16 numFrame;             // _00
	u16 numMaterial;          // _02
	TexMatrixMode texMtxMode; // _04
	AnmPolicy policy;         // _08
};

/**
 * @brief Underlying data structure for texture SRT matrix animation resources.
 *
 * @note Size: 0x28.
 */
struct ResAnmTexSrtData {
	ResBlockHeaderData header; // _00
	u32 revision;              // _08
	s32 toResFileData;         // _0C
	s32 toTexSrtDataDic;       // _10
	s32 toResUserData;         // _14
	s32 name;                  // _18
	s32 original_path;         // _1C
	ResAnmTexSrtInfoData info; // _20
};

/**
 * @brief Wrapper for texture matrix animation resources.
 *
 * @note Size: 0x4.
 */
class ResAnmTexSrt : public ResCommon<ResAnmTexSrtData> {
public:
	static const u32 SIGNATURE = FOURCC('S', 'R', 'T', '0');
	static const int REVISION  = 5;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmTexSrt);

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	void GetAnmResult(TexSrtAnmResult* pResult, u32 idx, f32 frame) const;

	const ResAnmTexSrtMatData* GetMatAnm(int idx) const
	{
		return static_cast<ResAnmTexSrtMatData*>(ofs_to_obj<ResDic>(ref().toTexSrtDataDic)[idx]);
	}
	const ResAnmTexSrtMatData* GetMatAnm(u32 idx) const
	{
		return static_cast<ResAnmTexSrtMatData*>(ofs_to_obj<ResDic>(ref().toTexSrtDataDic)[idx]);
	}

	int GetNumFrame() const { return ref().info.numFrame; }

	int GetNumMaterial() const { return ref().info.numMaterial; }

	AnmPolicy GetAnmPolicy() const { return ref().info.policy; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
