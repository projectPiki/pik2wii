#ifndef NW4R_G3D_RES_RESTEV_H
#define NW4R_G3D_RES_RESTEV_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
//////////// TEXTURE ENVIRONMENT RESOURCES /////////////
////////////////////////////////////////////////////////

// OGWS doesn't know why this is out here, neither do I - HP
static const int TEV_STAGES_PER_DL = 2;

/**
 * @brief Display list data parts to be reused across TEV stages.
 *
 * @note Size: 0x60.
 */
struct ResTevCommonDL {
	union {
		struct {
			u8 swapModeTable[GX_MAX_TEVSWAP][GX_BP_CMD_SZ * 4]; // _00
			u8 indTexOrder[1][GX_BP_CMD_SZ];                    // _50
			u8 PADDING_0x55[0x60 - 0x55];                       // _55
		} dl;

		u8 data[0x60]; // _00
	};
};

/**
 * @brief Display list data that changes per TEV stage.
 *
 * @note Size: 0x30.
 */
struct ResTevVariableDL {
	union {
		struct {
			u8 tevKonstantSel[GX_BP_CMD_SZ * 2];                  // _00
			u8 tevOrder[GX_BP_CMD_SZ];                            // _0A
			u8 tevColorCalc[TEV_STAGES_PER_DL][GX_BP_CMD_SZ];     // _0F
			u8 alphaCalcAndSwap[TEV_STAGES_PER_DL][GX_BP_CMD_SZ]; // _19
			u8 tevIndirect[TEV_STAGES_PER_DL][GX_BP_CMD_SZ];      // _23
			u8 PADDING_0x2D[0x30 - 0x2D];                         // _2D
		} dl;

		u8 data[0x30]; // _00
	};
};

/**
 * @brief Display list data for each grouping of TEV stages (8 per object).
 *
 * @note Size: 0x1E0.
 */
struct ResTevDL {
	union {
		struct {
			ResTevCommonDL common;                                    // _00
			ResTevVariableDL var[GX_MAXTEVSTAGE / TEV_STAGES_PER_DL]; // _60
		} dl;

		u8 data[0x1E0]; // _00
	};
};

/**
 * @brief Underlying data structure for TEV resources.
 *
 * @note Size: 0x200.
 */
struct ResTevData {
	u32 size;                               // _00
	s32 toResMdlData;                       // _04
	u32 id;                                 // _08
	u8 nStages;                             // _0C
	u8 PADDING_0xD[0x10 - 0xD];             // _0D
	u8 texCoordToTexMapID[GX_MAX_TEXCOORD]; // _10
	u8 PADDING_0x18[0x20 - 0x18];           // _18
	ResTevDL dl;                            // _20
};

/**
 * @brief Wrapper for TEV resources.
 *
 * @note Size: 0x200.
 */
class ResTev : public ResCommon<ResTevData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResTev);

	bool GXGetTevSwapModeTable(GXTevSwapSel swap, GXTevColorChan* pR, GXTevColorChan* pG, GXTevColorChan* pB, GXTevColorChan* pA) const;
	void GXSetTevSwapModeTable(GXTevSwapSel swap, GXTevColorChan r, GXTevColorChan g, GXTevColorChan b, GXTevColorChan a);

	bool GXGetTevOrder(GXTevStageID stage, GXTexCoordID* pCoord, GXTexMapID* pMap, GXChannelID* pChannel) const;

	void GXSetTevColorIn(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d);

	void CallDisplayList(bool sync) const;

	ResTev CopyTo(void* pDst);

	void DCStore(bool sync);

	u8 GetNumTevStages() const { return ref().nStages; }

	void EndEdit() { DCStore(false); }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
