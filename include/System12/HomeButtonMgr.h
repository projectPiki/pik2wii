#ifndef _SYSTEM12_HOME_BUTTON_MGR_H
#define _SYSTEM12_HOME_BUTTON_MGR_H

#include <RevoSDK/gx.h>
#include <RevoSDK/hbm.h>
#include <RevoSDK/os.h>
#include <RevoSDK/tpl.h>
#include <egg/core/eggSingleton.h>

namespace System12 {

class HomeButtonMgr {

	EGG_SINGLETON_DECL(HomeButtonMgr);

public:
	struct InitializeArg {
		InitializeArg();

		HBMSoundCallback mSoundCallback;
	};

	HomeButtonMgr();

	void initialize(InitializeArg);
	void calc();
	void checkMenuStart();
	void checkMenuEnd();
	void initHomeButtonInfo();
	void init_gx();
	void init_projection(int);
	void load_resource();
	TPLPalette* fn_80010858(const char*, u32*);
	void initCursorPos();

	// _00     = VTBL
	// _00-_10 = EGG::Disposer
	bool _10;                          // _10
	bool mExceptionVISetBlackTrue;     // _11
	HBMDataInfo mInfo;                 // _14
	HBMControllerData mControllerData; // _54
	OSTick mTick;                      // _94
	u8 mBanIconAlpha;                  // _98
	int _9C;                           // _9C
	int _A0;                           // _A0
	int _A4;                           // _A4
	int _A8;                           // _A8
	int _AC;                           // _AC
	u8 _B0[0xC];                       // _B0
	TPLPalette* mTPL;                  // _BC
	int _C0;                           // _C0
	HBMSoundCallback* mSoundCallback;  // _C4
	bool _C8;                          // _C8
	bool _C9;                          // _C9
	bool _CA;                          // _CA
	bool _CB;                          // _CB
	GXRenderModeObj _CC;               // _CC
	int mUseWide;                      // _108
	int _10C;                          // _10C
	int _110;                          // _110
	int _114;                          // _114
	int mControllerNum;                // _118
	void* mHomeButtonSe;               // _11C

	static HBMSoundCallback* sHBMUserCallback;
};

} // namespace System12

#endif