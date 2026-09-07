#include "System12/Config.h"
#include "System12/System.h"
#include "egg/core/eggDvdRipper.h"
#include "egg/core/eggStream.h"
#include "egg/prim/eggAssert.h"
#include <string.h>

namespace System12 {

EGG_SINGLETON_IMPL(59, Config);
bool Config::sReady = false;

Config::Config()
    : TagParameters("S12Config")
    , mEnableOSReport(this, "enableOSReport")
    , mBootSection(this, "bootSection")
    , mControllerType(this, "controllerType")
    , mCameraFaceType(this, "cameraFaceType")
    , mCameraAutoRotate(this, "cameraAutoRotate")
    , mCameraAutoZoom(this, "cameraAutoZoom")
    , mCameraAutoElevation(this, "cameraAutoElevation")
    , mClampDpdCursor(this, "clampDpdCursor")
    , mCursorPlaceFaceIfDpdOut(this, "cursorPlaceFaceIfDpdOut")
    , mCaptureOn(this, "captureOn")
    , mRemoveSaveFileCommand(this, "removeSaveFileCommand")
    , mThrowRadius(this, "throwRadius")
    , mThrowLimit(this, "throwLimit")
    , mCreateDummyIfNotExist(this, "createDummyIfNotExist")
    , mSaveData(this, "saveData")
    , mUseBootProgram(this, "useBootProgram")
    , mBombPikminNotPutWhenCalled(this, "bombPikminNotPutWhenCalled")
    , mThrowHeightType(this, "throwHeightType")
    , mUseMem1(this, "useMem1")
    , mReplayCtrlMode(this, "replayCtrlMode")
    , mDeleteReplayFile(this, "deleteReplayFile")
    , mPikmin1FastTitle(this, "pikmin1FastTitle")
    , mPikmin1FastFileSelect(this, "pikmin1FastFileSelect")
    , mPikmin1FastWiiMenu(this, "pikmin1FastWiiMenu")
    , mReplayFileName(this, "replayFileName")
{
	mUseMem1.set(1);
	mThrowHeightType.set(1);
	mEnableOSReport.set(1);
	mControllerType.set(3);
	setControllerParam();
	_18 = 0;
	mCaptureOn.set(1);
	mRemoveSaveFileCommand.set(1);
	mThrowRadius.set(150.0f);
	mThrowLimit.set(280.0f);
	mCameraAutoElevation.set(1);
	mCreateDummyIfNotExist.set(0);
	mSaveData.set(2);
	mUseBootProgram.set(0);
	mBombPikminNotPutWhenCalled.set(1);
	mReplayCtrlMode.set(0);
	mDeleteReplayFile.set(0);
	mPikmin1FastTitle.set(0);
	mPikmin1FastFileSelect.set(0);
	mPikmin1FastWiiMenu.set(0);
	_1C = 0;
}

void Config::setControllerParam()
{
	mClampDpdCursor.set(0);
	mCursorPlaceFaceIfDpdOut.set(0);
	switch (mControllerType()) {
	case 3:
		mCameraFaceType.set(0);
		mCameraAutoRotate.set(0);
		mCameraAutoZoom.set(0);
		mClampDpdCursor.set(1);
		mCursorPlaceFaceIfDpdOut.set(1);
		break;
	case 0:
		mCameraFaceType.set(0);
		mCameraAutoRotate.set(0);
		mCameraAutoZoom.set(0);
		break;
	case 1:
		mCameraFaceType.set(1);
		mCameraAutoRotate.set(0);
		mCameraAutoZoom.set(0);
		break;
	case 2:
		mCameraFaceType.set(1);
		mCameraAutoRotate.set(1);
		mCameraAutoZoom.set(1);
		break;
	}
}

void Config::calc()
{
}

void Config::draw()
{
}

void Config::load(char* name)
{
	u32 fileSize;
	u8* file = EGG::DvdRipper::loadToMainRAM(name, 0, EGG_INSTANCE(System)->mHeap, EGG::DvdRipper::ALLOC_DIR_TAIL, 0, &fileSize, 0);
	if (file) {
		EGG::RamStream stream(file, fileSize);
		stream.setTextMode();
		read(stream);
		delete[] file;
	}
	setControllerParam();
	sReady = true;
}

} // namespace System12
