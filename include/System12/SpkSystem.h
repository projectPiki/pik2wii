#ifndef SYSTEM12_SPKSYSTEM_H
#define SYSTEM12_SPKSYSTEM_H

#include "System12/SpkData.h"
#include "System12/SpkGadget.h"
#include "System12/SpkMixingBuffer.h"
#include "System12/SpkSound.h"
#include "egg/core/eggArchive.h"
#include "egg/core/eggHeap.h"
#include <types.h>

class SpkSystem : protected SpkGlobalInstance<SpkSystem> {
public:
	SpkSystem();
	void setResource(EGG::Archive* resArc, const char*, const char*);
	void framework(void);
	void startSound(s32 chan, s32 param_1, SpkSoundHandle* handle);
	void startLevelSound(s32 chan, s32 param_1, SpkSoundHandle* handle);
	void stopAll(s32 chan, s32 msec);
	void setMasterVolume(f32 vol);
	f32 getMasterVolume(void);
	bool isEnable(s32);
	void setConfigVolume(s32 vol);
	static void newSoundMemPool(s32 numOfSound);
	static void connect(s32 chan);
	static void disconnect(s32 chan);
	static void extensionProcess(s32, s32);

	inline SpkData* getData(void) const { return mData; }
	inline SpkMixingBuffer* getMixingBuffer(void) const { return mMixingBuffer; }

private:
	SpkData* mData;                 // _00
	SpkMixingBuffer* mMixingBuffer; // _04
	SpkSoundHolder* mSoundHolder;   // _08
};

#endif
