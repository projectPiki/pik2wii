#ifndef SYSTEM12_SPKSOUND_H
#define SYSTEM12_SPKSOUND_H

#include "System12/SpkGadget.h"
#include "System12/SpkTable.h"
#include <types.h>

class SpkSound;

class SpkSoundHandle {
public:
	SpkSoundHandle(void)
	    : mSound(nullptr)
	{
	}
	~SpkSoundHandle(void) { releaseSound(); }
	void releaseSound(void);

	inline bool isSoundAttached() const { return mSound != nullptr; }
	inline SpkSound* operator->(void) const
	{
		EGG_ASSERT(65, mSound != NULL);
		return mSound;
	}
	inline operator bool() const { return isSoundAttached(); }

	SpkSound* mSound; // _00
};

class SpkSoundVolume {
public:
	SpkSoundVolume(void);
	void setRelease(s32);
	void setFadeOut(s32);
	f32 calc(bool&);
	void setTableVolume(f32);

	f32 mReleaseVolume; // _00
	f32 mReleaseRate;   // _04
	f32 mFadeOutVolume; // _08
	f32 mFadeOutRate;   // _0C
	f32 mFadeVolume;    // _10
	f32 mFadeTarget;    // _14
	f32 mFadeRate;      // _18
	f32 mTableVolume;   // _1C
};

class SpkSound : public SpkPoolAllocObject<SpkSound> {
public:
	SpkSound(void);
	~SpkSound(void);
	void update(f32 vol);
	void stop(s32 msec);
	void startRelease(void);
	bool isHandleAttached(void) const;
	void attachHandle(SpkSoundHandle* handle);
	void releaseHandle(void);
	bool start(s32 chan, s32 soundNum);
	void kill(void);
	bool isStopping(void) const;
	bool isDead(void) const;
	bool isLocked(void) const;
	void unlock(void);
	s32 getLifeTime(void);
	void setLifeTime(s32 lifeTime);
	void updateLifeTime(void);
	s32 convertMsecToFrames(s32 msec);
	bool isLoopWave(void);
	bool setWaveData(s32 soundNum);

	inline s32 getPriority(void) const { return mPriority; }
	inline void setPriority(s32 priority) { mPriority = priority; }
	inline s32 getSoundNum(void) const { return mSoundNum; }
	inline void setSoundNum(s32 soundNum) { mSoundNum = soundNum; }

	SpkSoundHandle* mHandle; // _10
	s32 mSoundNum;           // _14
	s16* mWaveData;          // _18
	s32 mCurPos;             // _1C
	u32 _20;                 // _20
	s32 mPriority;           // _24
	u32 _28;                 // _28
	s32 mWaveSize;           // _2C
	s32 mWaveLoopStart;      // _30
	s32 mWaveLoopEnd;        // _34
	s32 mState;              // _38
	s32 mLifeTime;           // _3C
	SpkSoundVolume mVolume;  // _40
};

class SpkSoundHolder : SpkGlobalInstance<SpkSoundHolder> {
public:
	SpkSoundHolder(void);
	bool startSound(s32 chan, s32 soundNum, SpkSoundHandle* handle);
	bool startLevelSound(s32 chan, s32 soundNum, SpkSoundHandle* handle);
	void stopAll(s32 chan, s32 msec);
	bool update(s32 chan);
	bool updateEachSound(s32 chan);
	void freeDeadSound(s32 chan);
	void appendSound(s32 chan, SpkSound* sound);
	void framework(void);

	inline f32 getMasterVolume(void) const { return mMasterVolume; }
	inline void setMasterVolume(f32 vol) { mMasterVolume = vol; }
	inline s32 getConfigVolume(void) const { return mConfigVolume; }
	inline void setConfigVolume(s32 vol) { mConfigVolume = vol; }
	inline f32 getConfigVolumeF32(void) const { return (f32)mConfigVolume / 15.0f; }

	// EGG::TList<SpkSound> mSoundList[WPAD_MAX_CONTROLLERS]; // _00
	f32 mSoundVolumes[WPAD_MAX_CONTROLLERS]; // _30
	f32 mMasterVolume;                       // _40
	s32 mConfigVolume;                       // _44
};

#endif
