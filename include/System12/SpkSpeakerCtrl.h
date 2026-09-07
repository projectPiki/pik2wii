#ifndef SYSTEM12_SPKSPEAKERCTRL_H
#define SYSTEM12_SPKSPEAKERCTRL_H

#include "System12/SpkMixingBuffer.h"
#include <RevoSDK/os.h>
#include <RevoSDK/wenc.h>
#include <types.h>

#pragma pack(1)
struct SpeakerInfo {

	bool mIsConnected;          // _00
	bool mIsPlaying;            // _01
	WENCInfo mEncInfo;          // _02
	bool _22;                   // _22
	bool mIsMuted;              // _23
	s32 mState;                 // _24
	s32 mReconnectState;        // _28
	s32 mReconnectTime;         // _2C
	s32 mUsingTimeOut;          // _30
	s32 mRadioSensitivityTimer; // _34
	s32 mExtensionTimer;        // _38
	u8 mVolume;                 // _3C
	u8 pad[3];
};
#pragma pack()
class SpkSpeakerCtrl {
public:
	static void setMixingBuffer(SpkMixingBuffer*);
	static void setup(void);
	static void connect(s32 chan);
	static void disconnect(s32 chan);
	static void setSpeakerOn(s32 chan);
	static void setSpeakerOnCallback(s32 chan, s32 param_1);
	static void setSpeakerPlay(s32 chan);
	static void startPlayCallback(s32 chan, s32 param_1);
	static void setSpeakerOff(s32 chan);
	static void retryConnection(s32 chan);
	static void reconnect(s32);
	static void framework(void);
	static void reconnectProcess(s32);
	static void initReconnect(s32);
	static void continuousUsingProcess(s32);
	static void updateSpeaker(OSAlarm* alarm, OSContext* ctx);
	static bool isEnable(s32 chan);
	static void setUsingTimeoutNull(s32);
	static void setUsingTimeout(s32);
};

#endif
