#ifndef NW4R_G3D_PLATFORM_GPU_H
#define NW4R_G3D_PLATFORM_GPU_H

#include <nw4r/types_nw4r.h>

#include <nw4r/math.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {
namespace fifo {

////////////////////////////////////////////////////////
////////////////////// GX HELPERS //////////////////////
////////////////////////////////////////////////////////

// Swap bits to get hardware representation
static const u8 cm2hw[] = { 0b0000, 0b0010, 0b0001, 0b0011 };

inline void LoadBPCmd(u32 reg)
{
	GX_WRITE_U8(GX_FIFO_CMD_LOAD_BP_REG);
	GX_WRITE_U32(reg);
}

inline void LoadCPCmd(u8 addr, u32 value)
{
	GX_WRITE_U8(GX_FIFO_CMD_LOAD_CP_REG);
	GX_WRITE_U8(addr);
	GX_WRITE_U32(value);
}

inline void LoadXFCmd(u16 addr, u32 value)
{
	GX_WRITE_U8(GX_FIFO_CMD_LOAD_XF_REG);
	GX_WRITE_U16(0); // No size (single write)
	GX_WRITE_U16(addr);
	GX_WRITE_U32(value);
}

inline void LoadXFCmdHdr(u16 addr, u8 len)
{
	GX_WRITE_U8(GX_FIFO_CMD_LOAD_XF_REG);
	GX_WRITE_U16(len - 1);
	GX_WRITE_U16(addr);
}

inline void GDSetGenMode2Ex_BP(u8 numTexGens, u8 numChans, u8 numTevs, u8 numInds, GXCullMode cullMode)
{
	// TODO: Convert these to use our GX format

	// clang-format off
    // @note NUMCOLORS is actually three bits
    // LoadBPCmd(GX_BP_REG_SSMASK << GX_BP_OPCODE_SHIFT |
    //     GX_BP_GENMODE_NUMTEX_MASK                    |
    //     0b11 << GX_BP_GENMODE_NUMCOLORS_SHIFT        |
    //     GX_BP_GENMODE_NUMTEVSTAGES_MASK              |
    //     GX_BP_GENMODE_CULLMODE_MASK                  |
    //     GX_BP_GENMODE_NUMINDSTAGES_MASK);
	// clang-format on

	// clang-format off
    // LoadBPCmd(
    //     numTexGens        << GX_BP_GENMODE_NUMTEX_SHIFT       |
    //     numChans          << GX_BP_GENMODE_NUMCOLORS_SHIFT    |
    //     numTevs - 1       << GX_BP_GENMODE_NUMTEVSTAGES_SHIFT |
    //     cm2hw[cullMode]   << GX_BP_GENMODE_CULLMODE_SHIFT     |
    //     numInds           << GX_BP_GENMODE_NUMINDSTAGES_SHIFT |
    //     GX_BP_REG_GENMODE << GX_BP_OPCODE_SHIFT);
	// clang-format on
}

inline void GDSetChanCtrl(GXChannelID chan, u32 param, u32 lightMask)
{
	// TODO: Convert these to use our GX format

	// param &= ~(GX_XF_COLOR0CNTRL_LMASKLO_MASK | GX_XF_COLOR0CNTRL_LMASKHI_MASK);

	// param |= (lightMask & 0b1111) << GX_XF_COLOR0CNTRL_LMASKLO_SHIFT | ((lightMask >> 4) & 0b1111) << GX_XF_COLOR0CNTRL_LMASKHI_SHIFT;

	// LoadXFCmd(GX_XF_REG_COLOR0CNTRL + (chan & 3), param);
}

inline void GDSetChanCtrlLightOff(GXChannelID chan, u32 param, u32 lightMask)
{
	// TODO: Convert these to use our GX format

	// param &= ~(GX_XF_COLOR0CNTRL_LMASKLO_MASK | GX_XF_COLOR0CNTRL_LMASKHI_MASK | GX_XF_COLOR0CNTRL_LIGHT_MASK);

	// param |= (lightMask & 0b1111) << GX_XF_COLOR0CNTRL_LMASKLO_SHIFT | ((lightMask >> 4) & 0b1111) << GX_XF_COLOR0CNTRL_LMASKHI_SHIFT;

	// LoadXFCmd(GX_XF_REG_COLOR0CNTRL + (chan & 3), param);
}

inline void GDSetChanAmbColor(GXChannelID chan, GXColor color)
{
	LoadXFCmd(GX_XF_REG_AMBIENT0 + chan, *reinterpret_cast<u32*>(&color));
}

inline void GDSetChanMatColor(GXChannelID chan, GXColor color)
{
	LoadXFCmd(GX_XF_REG_MATERIAL0 + chan, *reinterpret_cast<u32*>(&color));
}

////////////////////////////////////////////////////////
/////////////////// GLOBAL FUNCTIONS ///////////////////
////////////////////////////////////////////////////////

void GDSetGenMode2(u8 numTexGens, u8 numChans, u8 numTevs, u8 numInds, GXCullMode cullMode);

void GDSetCullMode(GXCullMode cullMode);

void GDSetTexCoordScale2(GXTexCoordID coord, u16 scaleS, GXBool biasS, GXBool wrapS, u16 scaleT, GXBool biasT, GXBool wrapT);

void GDSetIndTexMtx(u32 id, const math::MTX34& rMtx);

void GDResetCurrentMtx();

void GDSetCurrentMtx(const u32* pIdArray);

void GDLoadTexMtxImm3x3(const math::MTX33& rMtx, u32 id);

////////////////////////////////////////////////////////

} // namespace fifo
} // namespace g3d
} // namespace nw4r

#endif
