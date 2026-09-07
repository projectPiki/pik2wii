#include "System12/SpkSound.h"

#include "System12/SpkData.h"
#include "System12/SpkGadget.h"
#include "System12/SpkMixingBuffer.h"
#include "System12/SpkSound.h"
#include "System12/SpkSpeakerCtrl.h"
#include "System12/SpkSystem.h"
#include "egg/core/eggHeap.h"
#include "nw4r/ut.h"

/*
enum SpkSoundState {
	SpkSoundState_STARTING_e,
	SpkSoundState_LOCKED_e,
	SpkSoundState_UNLOCKED_e,
	SpkSoundState_STOPPING_e,
	SpkSoundState_DEAD_e,
};

void SpkSoundHandle::releaseSound() {
    if (!mSound) {
        return;
    }

    mSound->mHandle = nullptr;
    mSound = nullptr;
}

void SpkSoundVolume::setRelease(s32 release)
{
	if (release > 0) {
		mReleaseRate = 1.0f / release;
	} else {
		mReleaseRate = 1.0f;
	}

	mReleaseVolume = 1.0f;
}

f32 SpkSoundVolume::calc(bool& param_0)
{
	param_0 = false;

	if (mReleaseRate != 0.0f) {
		mReleaseVolume -= mReleaseRate;
		if (mReleaseVolume <= 0.0f) {
			mReleaseVolume = 0.0f;
			mReleaseRate   = 0.0f;
			param_0        = true;
		}
	}

	if (mFadeOutRate != 0.0f) {
		mFadeOutVolume -= mFadeOutRate;
		if (mFadeOutVolume <= 0.0f) {
			mFadeOutVolume = 0.0f;
			mFadeOutRate   = 0.0f;
			param_0        = true;
		}
	}

	if (mFadeRate != 0.0f) {
		mFadeVolume += mFadeRate;
		if (mFadeRate >= 0.0f) {
			if (mFadeVolume >= mFadeTarget) {
				mFadeVolume = mFadeTarget;
				mFadeRate   = 0.0f;
			}
		} else if (mFadeVolume <= mFadeTarget) {
			mFadeVolume = mFadeTarget;
			mFadeRate   = 0.0f;
		}
	}

	f32 result = mTableVolume * (mFadeVolume * (mFadeOutVolume * (mReleaseVolume * mReleaseVolume)));
	return result;
}

void SpkSoundVolume::setTableVolume(f32 vol)
{
	mTableVolume = vol;
}

SpkSound::SpkSound() : mHandle(NULL), mSoundNum(-1), mWaveData(0), mCurPos(0),
                       _20(0), mPriority(100), _28(0), mWaveSize(0),
                       mWaveLoopStart(-1), mWaveLoopEnd(-1), mState(SpkSoundState_STARTING_e),
                       mLifeTime(-1) {
}

SpkSound::~SpkSound() {
    //releaseHandle();
}


void SpkSound::attachHandle(SpkSoundHandle* handle)
{
	EGG_ASSERT(338, handle);
	if (isHandleAttached()) {
		releaseHandle();
	}

	mHandle         = handle;
	mHandle->mSound = this;
}

bool SpkSound::isHandleAttached(void) const
{
	return mHandle != NULL;
}

void SpkSound::releaseHandle()
{
	if (!mHandle) {
		return;
	}

	mHandle->mSound = NULL;
	mHandle         = NULL;
}

void SpkSound::stop(s32 msec)
{
	mState   = SpkSoundState_STOPPING_e;
	s32 fade = convertMsecToFrames(msec);

	if (fade) {
		mVolume.setFadeOut(fade);
	} else {
		startRelease();
	}
}

void SpkSound::startRelease(void)
{
	mVolume.setRelease(_28);
}

bool SpkSound::start(s32 param_0, s32 soundNum)
{
	_20 = param_0;

	bool setResult = setWaveData(soundNum);
	if (!setResult) {
		return false;
	}

	mState = SpkSoundState_LOCKED_e;
	return true;
}

void SpkSound::kill(void)
{
	mState = SpkSoundState_DEAD_e;
}

bool SpkSound::isStopping(void) const
{
	return mState == SpkSoundState_STOPPING_e;
}

bool SpkSound::isDead(void) const
{
	return mState == SpkSoundState_DEAD_e;
}

bool SpkSound::isLocked(void) const
{
	return mState == SpkSoundState_LOCKED_e;
}

void SpkSound::unlock()
{
	if (mState != SpkSoundState_LOCKED_e) {
		return;
	}

	mState = SpkSoundState_UNLOCKED_e;
}

s32 SpkSound::getLifeTime(void)
{
	return mLifeTime;
}

void SpkSound::setLifeTime(s32 lifeTime)
{
	mLifeTime = lifeTime;
}

void SpkSound::updateLifeTime()
{
	mLifeTime--;
}

s32 SpkSound::convertMsecToFrames(s32 msec)
{
	return 6 * msec / 40;
}

bool SpkSound::setWaveData(s32 soundNum)
{
	SpkSystem* system = SpkGlobalInstance<SpkSystem>::getInstance();
	EGG_ASSERT(434, system);
	SpkData* data = system->getData();
	EGG_ASSERT(437, data);

	if (!data->isValid()) {
        NW4R_WARNING(440, "Speaker data is not valid\n");
		return false;
	}

	SpkTable& table = data->getTableMgr();

    EGG_ASSERT(446, soundNum < table.getNumOfSound());

    mSoundNum = soundNum;

	u16 ID               = table.getParams(soundNum)->mWaveNum;
	mPriority            = table.getParams(soundNum)->_02;
	mVolume.mTableVolume = (table.getParams(soundNum)->mVolume) / 127.0f;
	mLifeTime            = (table.getParams(soundNum)->mMsec * 6) / 40;

	SpkWave& wave = data->getWaveMgr();
	EGG_ASSERT(459, mSoundNum < wave.getNumOfWaves());
	mWaveData      = wave.getWave(ID);
	mCurPos        = 0;
	mWaveSize      = wave.getWaveSize(ID) / 2;
	mWaveLoopStart = wave.getLoopStartPos(ID);
	mWaveLoopEnd   = wave.getLoopEndPos(ID);
	EGG_ASSERT(468, mWaveLoopEnd <= mWaveSize);

	return true;
}

bool SpkSoundHolder::startSound(s32 chan, s32 soundNum, SpkSoundHandle* handle)
{
	if (!SpkSpeakerCtrl::isEnable(chan)) {
		return false;
	}

	if (soundNum < 0) {
		return false;
	}

	if (handle != nullptr) {
		if (*handle) {
			if ((*handle)->isLocked()) {
				(*handle)->kill();
			} else {
				(*handle)->stop(0);
			}
		}
	}

	static SpkGenericMemPool aound;

	SpkSound* new_sound_p = new SpkSound();
	if (new_sound_p == nullptr) {
		NW4R_WARNING(520, "%s", "cannot new SpkSound\n");
		return false;
	}

	if (handle != nullptr) {
		new_sound_p->attachHandle(handle);
	}

	bool startResult = new_sound_p->start(chan, soundNum);
	if (!startResult) {
		NW4R_WARNING(532, "%s", "cannot start SpkSound\n");
		delete new_sound_p;
		return false;
	}

	{
		BOOL status = OSDisableInterrupts();
		appendSound(chan, new_sound_p);
		OSRestoreInterrupts(status);
	}

	return true;
}*/
