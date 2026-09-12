#include "System12/SpkSystem.h"

#include "System12/SpkGadget.h"
#include "System12/SpkMixingBuffer.h"
#include "System12/SpkSound.h"
#include "System12/SpkSpeakerCtrl.h"
#include "egg/core/eggHeap.h"
#include "nw4r/ut.h"


template <>
SpkSystem* SpkGlobalInstance<SpkSystem>::sInstance;
template <>
SpkSoundHolder* SpkGlobalInstance<SpkSoundHolder>::sInstance;

const static s32 cConfigVolumeMax = 15;

SpkSystem::SpkSystem()
    : SpkGlobalInstance(true)
{
	mData = nullptr;

	mMixingBuffer = new SpkMixingBuffer();
	EGG_ASSERT(36, mMixingBuffer);
	mSoundHolder = new SpkSoundHolder();
	EGG_ASSERT(40, mSoundHolder);
	SpkSpeakerCtrl::setup();
	SpkSpeakerCtrl::setMixingBuffer(mMixingBuffer);
}

DECOMP_FORCEACTIVE(SpkSystem_cpp, "0");

void SpkSystem::setResource(EGG::Archive* resArc, const char* param_1, const char* param_2)
{
	EGG_ASSERT(79, resArc);
	mData = new SpkData(resArc);
	EGG_ASSERT(83, mData);
	mData->loadTable(param_1);
	mData->loadWave(param_2);
}

void SpkSystem::framework()
{
	EGG_ASSERT(99, mSoundHolder);
	SpkSpeakerCtrl::framework();
	mSoundHolder->framework();
}

void SpkSystem::startSound(s32 chan, s32 param_1, SpkSoundHandle* handle)
{
	EGG_ASSERT(118, chan >= 0);
	EGG_ASSERT(119, chan < WPAD_MAX_CONTROLLERS);
	EGG_ASSERT(120, mSoundHolder);
	mSoundHolder->startSound(chan, param_1, handle);
}

void SpkSystem::startLevelSound(s32 chan, s32 param_1, SpkSoundHandle* handle)
{
	EGG_ASSERT(138, chan >= 0);
	EGG_ASSERT(139, chan < WPAD_MAX_CONTROLLERS);
	EGG_ASSERT(140, mSoundHolder);
	EGG_ASSERT(141, handle);
	mSoundHolder->startLevelSound(chan, param_1, handle);
}

void SpkSystem::setMasterVolume(f32 vol)
{
	EGG_ASSERT(156, mSoundHolder);
	EGG_ASSERT(157, vol >= 0.f);
	EGG_ASSERT(158, vol <= 1.f);
	mSoundHolder->setMasterVolume(vol);
}

f32 SpkSystem::getMasterVolume(void)
{
	return mSoundHolder->getMasterVolume();
}

bool SpkSystem::isEnable(s32 f)
{
	return SpkSpeakerCtrl::isEnable(f);
}

void SpkSystem::stopAll(s32 chan, s32 msec)
{
	EGG_ASSERT(269, mSoundHolder);
	EGG_ASSERT(270, chan < WPAD_MAX_CONTROLLERS);
	EGG_ASSERT(271, msec >= 0);

	if (chan < 0) {
		for (s32 i = 0; i < 4; i++) {
			mSoundHolder->stopAll(i, msec);
		}
	} else {
		mSoundHolder->stopAll(chan, msec);
	}
}

void SpkSystem::setConfigVolume(s32 vol)
{
	EGG_ASSERT(317, mSoundHolder);
	EGG_ASSERT(318, vol >= 0);
	EGG_ASSERT(319, vol <= cConfigVolumeMax);

	mSoundHolder->setConfigVolume(vol);
}

void SpkSystem::connect(s32 chan)
{
	EGG_ASSERT(377, chan >= 0);
	EGG_ASSERT(378, chan < WPAD_MAX_CONTROLLERS);
	SpkSpeakerCtrl::connect(chan);
}

void SpkSystem::disconnect(s32 chan)
{
	EGG_ASSERT(394, chan >= 0);
	EGG_ASSERT(395, chan < WPAD_MAX_CONTROLLERS);
	SpkSpeakerCtrl::disconnect(chan);
}
