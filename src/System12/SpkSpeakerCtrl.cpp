#include "System12/SpkSpeakerCtrl.h"

#include "System12/SpkMixingBuffer.h"
#include "System12/SpkSound.h"
#include <RevoSDK/os.h>
#include <RevoSDK/wpad.h>

OSAlarm sSpeakerAlarm;
SpeakerInfo sSpeakerInfo[WPAD_MAX_CONTROLLERS];
SpkSoundHandle sAdjustSoundHandle[WPAD_MAX_CONTROLLERS];
SpkMixingBuffer* sMixingBuffer;

#define SPKSPEAKERCTRL_SET_STATE(s) mState = s

void SpkSpeakerCtrl::setMixingBuffer(SpkMixingBuffer* pMixingBuffer)
{
	BOOL status   = OSDisableInterrupts();
	sMixingBuffer = pMixingBuffer;
	OSRestoreInterrupts(status);
}

void SpkSpeakerCtrl::setup(void)
{
	for (s32 i = 0; i < WPAD_MAX_CONTROLLERS; i++) {
		sSpeakerInfo[i].mIsConnected = false;
		sSpeakerInfo[i].mIsPlaying   = false;
		sSpeakerInfo[i]._22          = true;
		sSpeakerInfo[i].mIsMuted     = false;
		sSpeakerInfo[i].mState       = 0;
		sSpeakerInfo[i].mVolume      = 64;

		sSpeakerInfo[i].mRadioSensitivityTimer = 0;
		sSpeakerInfo[i].mExtensionTimer        = 0;
		initReconnect(i);
		setUsingTimeoutNull(i);
		memset(&sSpeakerInfo[i].mEncInfo, 0, sizeof(WENCInfo));
	}

	OSCreateAlarm(&sSpeakerAlarm);
	OSSetPeriodicAlarm(&sSpeakerAlarm, OSGetTime(), OSNanosecondsToTicks(6666667), updateSpeaker);
}

void SpkSpeakerCtrl::connect(s32 chan)
{
	BOOL state                      = OSDisableInterrupts();
	sSpeakerInfo[chan].mIsConnected = true;
	sSpeakerInfo[chan].mIsPlaying   = false;
	sSpeakerInfo[chan].mState       = 0;
	initReconnect(chan);
	setUsingTimeoutNull(chan);
	setSpeakerOn(chan);
	OSRestoreInterrupts(state);
}

void SpkSpeakerCtrl::disconnect(s32 chan)
{
	BOOL state                      = OSDisableInterrupts();
	sSpeakerInfo[chan].mIsConnected = false;
	sSpeakerInfo[chan].mIsPlaying   = false;
	sSpeakerInfo[chan].mState       = 0;
	setSpeakerOff(chan);
	initReconnect(chan);
	setUsingTimeoutNull(chan);
	OSRestoreInterrupts(state);
}

void SpkSpeakerCtrl::setSpeakerOn(s32 chan)
{
	BOOL state = OSDisableInterrupts();
	s32 val    = WPADControlSpeaker(chan, 1, setSpeakerOnCallback);

	if (val == -2) {
		sSpeakerInfo[chan].mState = 1;
	} else {
		sSpeakerInfo[chan].mState = 0;
	}

	OSRestoreInterrupts(state);
}

void SpkSpeakerCtrl::setSpeakerOnCallback(s32 chan, s32 param_1)
{
	BOOL state = OSDisableInterrupts();
	if (param_1 == 0) {
		sSpeakerInfo[chan].mState = 0;
		setSpeakerPlay(chan);
	} else {
		if (param_1 == -3) {
			sSpeakerInfo[chan].mState = 1;
		}
	}
	OSRestoreInterrupts(state);
}

void SpkSpeakerCtrl::setSpeakerPlay(s32 chan)
{
	BOOL state = OSDisableInterrupts();
	s32 val    = WPADControlSpeaker(chan, 4, startPlayCallback);

	if (val == -2) {
		sSpeakerInfo[chan].mState = 2;
	} else {
		sSpeakerInfo[chan].mState = 0;
	}
	OSRestoreInterrupts(state);
}

void SpkSpeakerCtrl::startPlayCallback(s32 chan, s32 err)
{
	BOOL state = OSDisableInterrupts();
	if (err == WPAD_ERR_NONE) {
		sSpeakerInfo[chan].mIsPlaying    = true;
		sSpeakerInfo[chan]._22           = true;
		sSpeakerInfo[chan].mState        = 0;
		setUsingTimeout(chan);
		memset(&sSpeakerInfo[chan].mEncInfo, 0, sizeof(WENCInfo));
	} else if (err == WPAD_ERR_TRANSFER) {
		sSpeakerInfo[chan].mState = 2;
	}
	OSRestoreInterrupts(state);
}

void SpkSpeakerCtrl::setSpeakerOff(s32 chan)
{
	sSpeakerInfo[chan].mIsPlaying    = false;
	sSpeakerInfo[chan].mState        = 0;
	setUsingTimeoutNull(chan);
	WPADControlSpeaker(chan, 0, 0);
}

void SpkSpeakerCtrl::retryConnection(s32 chan)
{
	switch (sSpeakerInfo[chan].mState) {
	case 0:
	case 3:
		break;
	case 1:
		setSpeakerOn(chan);
		break;
	case 2:
		setSpeakerPlay(chan);
		break;
	}
}

void SpkSpeakerCtrl::reconnect(s32 idx)
{
	if (sSpeakerInfo[idx].mIsConnected) {
		sSpeakerInfo[idx].mReconnectState = 1;
	}
}

void SpkSpeakerCtrl::framework()
{
	for (s32 i = 0; i < WPAD_MAX_CONTROLLERS; i++) {
		continuousUsingProcess(i);
		reconnectProcess(i);
		retryConnection(i);
	}
}

void SpkSpeakerCtrl::reconnectProcess(s32 idx)
{
	if (sSpeakerInfo[idx].mIsConnected) {
		switch (sSpeakerInfo[idx].mReconnectState) {
		case 0:
			break;
		case 1:
			SpkSpeakerCtrl::setSpeakerOff(idx);
			sSpeakerInfo[idx].mReconnectState = 2;
			sSpeakerInfo[idx].mReconnectTime  = 20;
			break;
		case 2:
			sSpeakerInfo[idx].mReconnectTime--;

			if (sSpeakerInfo[idx].mReconnectTime <= 0) {
				sSpeakerInfo[idx].mReconnectTime  = -1;
				sSpeakerInfo[idx].mReconnectState = 3;
			}
			break;
		case 3:
			SpkSpeakerCtrl::setSpeakerOn(idx);
			sSpeakerInfo[idx].mReconnectState = 0;
			break;
		}
	}
}

void SpkSpeakerCtrl::initReconnect(s32 idx)
{
	sSpeakerInfo[idx].mReconnectState = 0;
	sSpeakerInfo[idx].mReconnectTime  = -1;
}

void SpkSpeakerCtrl::continuousUsingProcess(s32 idx)
{
	if (sSpeakerInfo[idx].mUsingTimeOut >= 0) {
		sSpeakerInfo[idx].mUsingTimeOut--;
		if (sSpeakerInfo[idx].mUsingTimeOut <= 0) {
			sSpeakerInfo[idx].mUsingTimeOut = -1;
			SpkSpeakerCtrl::reconnect(idx);
		}
	}
}

void SpkSpeakerCtrl::setUsingTimeoutNull(s32 chan)
{
    sSpeakerInfo[chan].mUsingTimeOut = -1;
}

void SpkSpeakerCtrl::setUsingTimeout(s32 chan)
{
    sSpeakerInfo[chan].mUsingTimeOut = 8 * 60 * 60;
}

void SpkSpeakerCtrl::updateSpeaker(OSAlarm*, OSContext*)
{
	for (s32 i = 0; i < WPAD_MAX_CONTROLLERS; i++) {
		if (sMixingBuffer == nullptr) {
			continue;
		}
		if (!sSpeakerInfo[i].mIsPlaying) {
			continue;
		}

		if (sSpeakerInfo[i].mIsMuted) {
			continue;
		}
		if (sMixingBuffer->update(i)) {
			u32 flags = WENC_FLAG_USER_INFO;
			if (sSpeakerInfo[i].mIsPlaying && sMixingBuffer != nullptr) {
				BOOL en = OSDisableInterrupts();

				if (!WPADCanSendStreamData(i)) {
					OSRestoreInterrupts(en);
					continue;
				}

				if (sSpeakerInfo[i]._22) {
					flags               = 0;
					sSpeakerInfo[i]._22 = false;
				}
				const s16* samples = sMixingBuffer->getSamples(i);
				u8 data[16];
				WENCGetEncodeData(&sSpeakerInfo[i].mEncInfo, flags, samples, 40, data);
				WPADSendStreamData(i, data, 20);
				OSRestoreInterrupts(en);
			}
			continue;
		}
		sSpeakerInfo[i]._22 = true;
	}
}

bool SpkSpeakerCtrl::isEnable(s32 chan)
{
	return WPADIsSpeakerEnabled(chan) && sSpeakerInfo[chan].mIsPlaying && sSpeakerInfo[chan].mState == 0 && sMixingBuffer != nullptr;
}

