#include "System12/PSSpkSystem.h"
#include "RevoSDK/WPAD.h"
#include "System12/SpkSystem.h"
#include "egg/prim/eggAssert.h"

static u8 lbl_8066B970;
static SpkSoundHandle* sSpkHandles;

static const char* sSpkResTable[] = { "bin/PSSpkTable.bct", "bin/PSSpkWave.csw" };

void PSSpkSystem::newSpkSoundMemPool()
{
	SpkSystem::newSoundMemPool(0x30);
}

int PSSpkSystem::init(EGG::Archive* res, s32 param_2, s32 param_3)
{
	EGG_ASSERT(76, res);
	SpkSystem* spkSys = new SpkSystem();
	EGG_ASSERT(84, spkSys);

	sSpkHandles = new SpkSoundHandle[0x30];
	EGG_ASSERT(89, sSpkHandles);

	spkSys->setResource(res, sSpkResTable[0], sSpkResTable[1]);
	spkSys->setMasterVolume(1.0f);
	spkSys->setConfigVolume(15);
}

void PSSpkSystem::update()
{
	if (SpkGlobalInstance<SpkSystem>::getInstance() != nullptr) {
		SpkGlobalInstance<SpkSystem>::getInstance()->framework();
	}
}

void PSSpkSystem::connect(s32 chan)
{
	if (SpkGlobalInstance<SpkSystem>::getInstance() != nullptr) {
		SpkSystem::connect(chan);
		lbl_8066B970 = WPADGetSpeakerVolume();
	}
}

void PSSpkSystem::disconnect(s32 chan)
{
	SpkSystem::disconnect(chan);
}

static SpkSoundHandle* getFreeSpkHandle(void)
{
    if (!SpkGlobalInstance<SpkSystem>::getInstance()) {
		return nullptr;
	}
	if (!sSpkHandles) {
		return nullptr;
	}
	SpkSoundHandle* highestPriorityHandle = nullptr;
	s32 highestPriority                   = 255;
	for (s32 i = 0; i < 0x30; i++) {
		if (!sSpkHandles[i].isSoundAttached()) {
			return &sSpkHandles[i];
		}

		if (sSpkHandles[i]->getPriority() < highestPriority) {
			highestPriorityHandle = &sSpkHandles[i];
			highestPriority       = sSpkHandles[i]->getPriority();
		}
	}

	return highestPriorityHandle;
}

SpkSoundHandle* PSSpkSystem::getHandleSoundID(s32 soundNum) {
    for (s32 i = 0; i < 0x30; i++) {
        if (!sSpkHandles[i].isSoundAttached()) {
            continue;
        }

        if (sSpkHandles[i]->getSoundNum() == soundNum) {
            return &sSpkHandles[i];
        }
    }

    return nullptr;
}

SpkSoundHandle* PSSpkSystem::start(s32 id, s32 chan) {
    if (!SpkGlobalInstance<SpkSystem>::getInstance()) {
        return nullptr;
    }
    if (sSpkHandles == nullptr) {
        return nullptr;
    }
    if (lbl_8066B970 == 0) {
        return nullptr;
    }

    SpkSoundHandle* handle = getFreeSpkHandle();
    EGG_ASSERT(280, handle);

    SpkGlobalInstance<SpkSystem>::getInstance()->startSound(chan, id, handle);
    return handle;
}

SpkSoundHandle* PSSpkSystem::startLevel(s32 id, s32 chan) {
    if (!SpkGlobalInstance<SpkSystem>::getInstance()) {
        return nullptr;
    }
    if (sSpkHandles == nullptr) {
        return nullptr;
    }
    if (lbl_8066B970 == 0) {
        return nullptr;
    }

    SpkSoundHandle* handle = getHandleSoundID(id);
    if (handle == nullptr) {
        handle = getFreeSpkHandle();
    }
    EGG_ASSERT(304, handle);

    SpkGlobalInstance<SpkSystem>::getInstance()->startLevelSound(chan, id, handle);
    return handle;
}