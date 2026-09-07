#include "RevoSDK/gx.h"
#include "RevoSDK/hbm.h"
#include "RevoSDK/mtx.h"
#include "RevoSDK/tpl.h"
#include "System12/DirChanger.h"
#include "System12/HomeButtonMgr.h"
#include "System12/System.h"
#include "egg/core/eggDvdRipper.h"
#include "egg/prim/eggAssert.h"
#include "JSystem/JKernel/JKRHeap.h"
#include <string.h>

namespace System12 {

EGG_SINGLETON_IMPL(22, HomeButtonMgr);

HBMSoundCallback* HomeButtonMgr::sHBMUserCallback;

namespace {
int fn_8000FCC0(int param_0, int param_1)
{
	if (HomeButtonMgr::sHBMUserCallback) {
		return (*HomeButtonMgr::sHBMUserCallback)(param_0, param_1);
	}
	return 0;
}
} // namespace

HomeButtonMgr::InitializeArg::InitializeArg()
{
}

HomeButtonMgr::HomeButtonMgr()
{
	mUseWide                 = 0;
	_10C                     = 0;
	_110                     = 0;
	mTick                    = 0;
	mBanIconAlpha            = 0;
	_114                     = 1;
	_C0                      = 0;
	mControllerNum           = 0;
	_C8                      = false;
	_C9                      = false;
	_CA                      = false;
	_10                      = false;
	mExceptionVISetBlackTrue = false;
}

void HomeButtonMgr::load_resource()
{
	DirChanger changer;
	mTPL = fn_80010858("hbm/HomeButton2/homeBtnIcon.tpl", 0);
	TPLBind(mTPL);
	initHomeButtonInfo();
}

void HomeButtonMgr::init_projection(int wide)
{
	Mtx44 mtx;
	if (wide) {
		C_MTXOrtho(mtx, 228.0f, -228.0f, -416.0f, 416.0f, 0.0f, 500.0f);
	} else {
		C_MTXOrtho(mtx, 228.0f, -228.0f, -(640 / 2), (640 / 2), 0.0f, 500.0f);
	}

	GXSetProjection(mtx, GX_ORTHOGRAPHIC);
}

void HomeButtonMgr::init_gx()
{
	GXClearVtxDesc();
	GXSetVtxAttrFmt(GX_VTXFMT4, GX_VA_POS, GX_POS_XY, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT4, GX_VA_CLR0, GX_CLR_RGB, GX_RGB8, 0);
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_CLR0, GX_DIRECT);
	GXSetNumChans(1);
	GXSetNumTexGens(0);
	GXSetNumTevStages(1);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
	GXSetTevOp(GX_TEVSTAGE0, GX_PASSCLR);
	GXSetBlendMode(GX_BM_NONE, GX_BL_ZERO, GX_BL_ZERO, GX_LO_CLEAR);
	GXSetZMode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
	GXSetCurrentMtx(3);
}

void HomeButtonMgr::initHomeButtonInfo()
{
	char anmNameBuf[64];
	strncpy(anmNameBuf, "hbm/HomeButton2", 32);
	const char* hbmname = "/homeBtn.arc";
	int language        = SCGetLanguage();
	mInfo.region        = language;
	switch (language) {
	case SC_LANG_JP:
		break;
	case SC_LANG_EN:
		hbmname = "/homeBtn_ENG.arc";
		break;
	case SC_LANG_DE:
		hbmname = "/homeBtn_GER.arc";
		break;
	case SC_LANG_FR:
		hbmname = "/homeBtn_FRA.arc";
		break;
	case SC_LANG_SP:
		hbmname = "/homeBtn_SPA.arc";
		break;
	case SC_LANG_IT:
		hbmname = "/homeBtn_ITA.arc";
		break;
	case SC_LANG_NL:
		hbmname = "/homeBtn_NED.arc";
		break;
	default:
		mInfo.region = 0;
	}
	strncat(anmNameBuf, hbmname, 0x20);
	DirChanger changer;
	mInfo.layoutBuf = EGG::DvdRipper::loadToMainRAM(anmNameBuf, 0, EGG_INSTANCE(System)->mHeap, EGG::DvdRipper::ALLOC_DIR_HEAD, 0, 0, 0);
	mInfo.spkSeBuf  = EGG::DvdRipper::loadToMainRAM("hbm/HomeButton2/SpeakerSe.arc", 0, EGG_INSTANCE(System)->mHeap,
	                                                EGG::DvdRipper::ALLOC_DIR_HEAD, 0, 0, 0);
	mInfo.msgBuf = EGG::DvdRipper::loadToMainRAM("hbm/HomeButton2/home.csv", 0, EGG_INSTANCE(System)->mHeap, EGG::DvdRipper::ALLOC_DIR_HEAD,
	                                             0, 0, 0);
	mInfo.configBuf = EGG::DvdRipper::loadToMainRAM("hbm/HomeButton2/config.txt", 0, EGG_INSTANCE(System)->mHeap,
	                                                EGG::DvdRipper::ALLOC_DIR_HEAD, 0, &mInfo.configBufSize, 0);

	mInfo.backFlag       = 0;
	mInfo.sound_callback = fn_8000FCC0;
	mInfo.cursor         = 0;

	mInfo.adjust.x   = 1.3684211f;
	mInfo.adjust.y   = 1.0f;
	mInfo.frameDelta = 1.0f;

	mInfo.mem         = new (0x20) u8[0x80000];
	mInfo.memSize     = 0x80000;
	mInfo.pAllocator  = 0;
	mInfo.messageFlag = 0;
}

void HomeButtonMgr::initCursorPos()
{
	for (int i = 0; i < 4; i++) {
		mControllerData.wiiCon[i].pos.x       = -2000.0f;
		mControllerData.wiiCon[i].pos.y       = -2000.0f;
		mControllerData.wiiCon[i].use_devtype = 0;
	}
}

} // namespace System12
