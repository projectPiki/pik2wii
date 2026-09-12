#ifndef _SYSTEM12_SYSTEM_H
#define _SYSTEM12_SYSTEM_H

#include <RevoSDK/hbm.h>
#include <RevoSDK/wpad.h>
#include <System12/HomeButtonMgr.h>
#include <egg/core/eggSingleton.h>
#include <nw4r/ut.h>

namespace System12 {

class ControllerConnectionMgr {
	EGG_SINGLETON_DECL(ControllerConnectionMgr);
};

class WarnWindowInitializeArg {
public:
	WarnWindowInitializeArg();

	u32 _00;
	u32 _04;
	u32 _08;
	u32 _0C;
};

class GameNandInitializeArg {
public:
	GameNandInitializeArg();

	u32 _00;
	u32 _04;
};

class System {

	EGG_SINGLETON_DECL(System);

public:
	System();

	struct InitializeArg {

		enum cGame { PIKMIN_1 = 0, PIKMIN_2 = 1, PIKMIN_12 = 2, UNDEF = 3 };

		InitializeArg();

		u16 mScreenX;
		u16 mScreenY;
		void* (*mHeapPrintFunc)(char, int);
		WarnWindowInitializeArg mWarnWindowInitializeArg;
		HomeButtonMgr::InitializeArg mHomeButtonMgrInitializeArg;
		GameNandInitializeArg mGameNandInitializeArg;
		u32 _24;
		const char* _28;
		u32 _2C;
		EGG::Heap* _30;
		u32 _34;
		OSThread* mThread;
		u32 _3C;
		u32 _40;
		u32 _44;
		u32 _48;
		u32 _4C;
		u32 mGameType;
	};

	void initialize(InitializeArg*);

	// _00     = VTBL
	// _00-_10 = EGG::Disposer
	InitializeArg mInitializeArg; // _10
	EGG::Heap* mHeap;             // _64
	nw4r::ut::RomFont mRomFont;   // _68
	u32 _84;                      // _84
	bool mIsWideTV;               // _88
	u32 _8C;                      // _8C
	u8 mDebugDraw;                // _90
	u8 _91;                       // _91
	u8 mHBMCapture[0x3C];         // _94
	u32 _D0;                      // _D0
	u8 mDelegate1[0x14];          // _D4
	u8 mDelegate2[0x14];          // _E8
	u8 mStrapScreen[0x2C];        // _FC
	u32 _128;                     // _128
	u32 _12C;                     // _12C
	u32 _130;                     // _130
	u32 _134;                     // _134
	u32 _138;                     // _138
};

} // namespace System12

#endif
