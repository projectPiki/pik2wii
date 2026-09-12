#include "RevoSDK/gx.h"
#include "RevoSDK/os.h"
#include "RevoSDK/vi.h"
#include "System12/RenderModeMgr.h"
#include "egg/prim/eggAssert.h"
#include <string.h>

namespace {

GXRenderModeObj localNtsc640x480IntDf = {
	VI_TVMODE_NTSC_INT, // tvInfo
	640,                // fbWidth
	480,                // efbHeight
	480,                // xfbHeight
	25,                 // viXOrigin
	0,                  // viYOrigin
	670,                // viWidth
	480,                // viHeight
	VI_XFBMODE_DF,      // xfbMode
	GX_FALSE,           // field_rendering
	GX_FALSE,           // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 5, 6, 14, 14, 14, 6, 5 } // vfilter
};

GXRenderModeObj localNtsc608x448IntDf = {
	VI_TVMODE_NTSC_INT, // tvInfo
	608,                // fbWidth
	448,                // efbHeight
	456,                // xfbHeight
	25,                 // viXOrigin
	12,                 // viYOrigin
	670,                // viWidth
	456,                // viHeight
	VI_XFBMODE_DF,      // xfbMode
	GX_FALSE,           // field_rendering
	GX_FALSE,           // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 5, 6, 14, 14, 14, 6, 5 } // vfilter
};

GXRenderModeObj localNtsc640x480Prog = {
	VI_TVMODE_NTSC_PROG, // tvInfo
	640,                 // fbWidth
	480,                 // efbHeight
	480,                 // xfbHeight
	25,                  // viXOrigin
	0,                   // viYOrigin
	670,                 // viWidth
	480,                 // viHeight
	VI_XFBMODE_SF,       // xfbMode
	GX_FALSE,            // field_rendering
	GX_FALSE,            // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 0, 0, 21, 22, 21, 0, 0 } // vfilter
};

GXRenderModeObj localNtsc608x448Prog = {
	VI_TVMODE_NTSC_PROG, // tvInfo
	608,                 // fbWidth
	448,                 // efbHeight
	456,                 // xfbHeight
	25,                  // viXOrigin
	12,                  // viYOrigin
	670,                 // viWidth
	456,                 // viHeight
	VI_XFBMODE_SF,       // xfbMode
	GX_FALSE,            // field_rendering
	GX_FALSE,            // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 0, 0, 21, 22, 21, 0, 0 } // vfilter
};

/**
 * @brief Render mode configuration for NTSC (interlaced)
 */
GXRenderModeObj localPal60640x480IntDf = {
	VI_TVMODE_EURGB60_INT, // tvInfo
	640,                   // fbWidth
	480,                   // efbHeight
	480,                   // xfbHeight
	25,                    // viXOrigin
	0,                     // viYOrigin
	670,                   // viWidth
	480,                   // viHeight
	VI_XFBMODE_DF,         // xfbMode
	GX_FALSE,              // field_rendering
	GX_FALSE,              // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 5, 6, 14, 14, 14, 6, 5 } // vfilter
};

GXRenderModeObj localPal60608x448IntDf = {
	VI_TVMODE_EURGB60_INT, // tvInfo
	608,                   // fbWidth
	448,                   // efbHeight
	480,                   // xfbHeight
	25,                    // viXOrigin
	0,                     // viYOrigin
	670,                   // viWidth
	480,                   // viHeight
	VI_XFBMODE_DF,         // xfbMode
	GX_FALSE,              // field_rendering
	GX_FALSE,              // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 5, 6, 14, 14, 14, 6, 5 } // vfilter
};

GXRenderModeObj localPal60640x480Prog = {
	VI_TVMODE_EURGB60_PROG, // tvInfo
	640,                    // fbWidth
	480,                    // efbHeight
	480,                    // xfbHeight
	25,                     // viXOrigin
	0,                      // viYOrigin
	670,                    // viWidth
	480,                    // viHeight
	VI_XFBMODE_SF,          // xfbMode
	GX_FALSE,               // field_rendering
	GX_FALSE,               // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 0, 0, 21, 22, 21, 0, 0 } // vfilter
};

GXRenderModeObj localPal60608x448Prog = {
	VI_TVMODE_EURGB60_PROG, // tvInfo
	608,                    // fbWidth
	448,                    // efbHeight
	480,                    // xfbHeight
	25,                     // viXOrigin
	0,                      // viYOrigin
	670,                    // viWidth
	480,                    // viHeight
	VI_XFBMODE_SF,          // xfbMode
	GX_FALSE,               // field_rendering
	GX_FALSE,               // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 0, 0, 21, 22, 21, 0, 0 } // vfilter
};

GXRenderModeObj localPal50_640x480IntDf = {
	VI_TVMODE_PAL_INT, // tvInfo
	640,               // fbWidth
	480,               // efbHeight
	528,               // xfbHeight
	25,                // viXOrigin
	23,                // viYOrigin
	670,               // viWidth
	528,               // viHeight
	VI_XFBMODE_DF,     // xfbMode
	GX_FALSE,          // field_rendering
	GX_FALSE,          // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 8, 8, 10, 12, 10, 8, 8 } // vfilter
};

GXRenderModeObj localPal50_608x448IntDf = {
	VI_TVMODE_PAL_INT, // tvInfo
	608,               // fbWidth
	448,               // efbHeight
	542,               // xfbHeight
	25,                // viXOrigin
	16,                // viYOrigin
	670,               // viWidth
	542,               // viHeight
	VI_XFBMODE_DF,     // xfbMode
	GX_FALSE,          // field_rendering
	GX_FALSE,          // aa
	{
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	    { 6, 6 },
	},                         // sample_pattern
	{ 8, 8, 10, 12, 10, 8, 8 } // vfilter
};

} // namespace

namespace System12 {

namespace {
const char* mode_names[] = { "Ntsc", "NtscProg", "Pal50", "Pal60", "PalProg", "Max", "Undef" };
} // namespace

void RenderModeMgr::wait()
{
	if (_1C != 0) {
		VISetBlack(TRUE);

		u32 waitEnd = _1C + 1600;

		for (int i = 0; i < 100; i++) {
			u32 waitNow = OSTicksToMilliseconds(OSGetTime());
			if (waitNow > waitEnd) {
				break;
			}

			VIFlush();
			VIWaitForRetrace();
			VIWaitForRetrace();
		}
	}
}

} // namespace System12
