#ifndef _SYSTEM12_CONFIG_H
#define _SYSTEM12_CONFIG_H

#include <System12/TagParms.h>
#include <egg/core/eggSingleton.h>

namespace System12 {

class Config : public TagParameters {

	EGG_SINGLETON_DECL(Config);

public:
	Config();

	void setControllerParam();
	void draw();
	void calc();
	void load(char*);

	// _00     = VTBL
	// _00-_10 = EGG::Disposer
	// _10-_14 = TagParameters
	int _18;                                      // _18
	int _1C;                                      // _1C
	PrimTagParm<int> mEnableOSReport;             // _20
	StringTagParm mBootSection;                   // _30
	PrimTagParm<int> mControllerType;             // _40
	PrimTagParm<int> mCameraFaceType;             // _50
	PrimTagParm<int> mCameraAutoRotate;           // _60
	PrimTagParm<int> mCameraAutoZoom;             // _70
	PrimTagParm<int> mCameraAutoElevation;        // _80
	PrimTagParm<int> mClampDpdCursor;             // _90
	PrimTagParm<int> mCursorPlaceFaceIfDpdOut;    // _A0
	PrimTagParm<int> mCaptureOn;                  // _B0
	PrimTagParm<int> mRemoveSaveFileCommand;      // _C0
	PrimTagParm<f32> mThrowRadius;                // _D0
	PrimTagParm<f32> mThrowLimit;                 // _E0
	PrimTagParm<int> mCreateDummyIfNotExist;      // _F0
	PrimTagParm<u32> mSaveData;                   // _100
	PrimTagParm<int> mUseBootProgram;             // _110
	PrimTagParm<int> mBombPikminNotPutWhenCalled; // _120
	PrimTagParm<int> mThrowHeightType;            // _130
	PrimTagParm<int> mUseMem1;                    // _140
	PrimTagParm<int> mReplayCtrlMode;             // _150
	PrimTagParm<int> mDeleteReplayFile;           // _160
	PrimTagParm<int> mPikmin1FastTitle;           // _170
	PrimTagParm<int> mPikmin1FastFileSelect;      // _180
	PrimTagParm<int> mPikmin1FastWiiMenu;         // _190
	StringTagParm mReplayFileName;                // _1A0

	static bool sReady;
};

} // namespace System12

#endif
