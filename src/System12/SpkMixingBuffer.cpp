#include "System12/SpkMixingBuffer.h"

#include "System12/SpkGadget.h"
#include "System12/SpkSound.h"

SpkMixingBuffer::SpkMixingBuffer()
{
	for (s32 chan = 0; chan < 4; chan++) { // ARRAY_SIZE(mBuffer)
		mBuffer[chan] = new s16[cSamplesPerAudioPacket];
		EGG_ASSERT(34, mBuffer[chan]);
		bzeroBuffer(chan);
	}
}

DECOMP_FORCEACTIVE(SpkMixingBuffer_cpp, "0");

void SpkMixingBuffer::mix(s32 chan, s16* src, s32 len, f32 weight, s32 offset)
{
	EGG_ASSERT(73, chan < WPAD_MAX_CONTROLLERS);
	EGG_ASSERT(74, mBuffer[chan]);
	EGG_ASSERT(75, src);
	EGG_ASSERT(76, offset >= 0);
	EGG_ASSERT(77, (offset+len) <= cSamplesPerAudioPacket);

	for (s32 i = 0; i < len; i++) {
		s32 sample    = mBuffer[chan][i + offset];
		s16 srcSample = src[i];
		sample += (s32)(srcSample * weight);
		mBuffer[chan][i + offset] = SpkCalc::clamp<s16, s32>(sample);
	}
}

s16* SpkMixingBuffer::getSamples(s32 chan) const
{
	EGG_ASSERT(109, chan < WPAD_MAX_CONTROLLERS);
	EGG_ASSERT(110, mBuffer[chan]);
	return mBuffer[chan];
}

bool SpkMixingBuffer::update(s32 chan)
{
	bzeroBuffer(chan);
	SpkSoundHolder* sound_holder = SpkGlobalInstance<SpkSoundHolder>::getInstance();
	EGG_ASSERT(133, sound_holder);
	bool result = sound_holder->update(chan);
	return result;
}

void SpkMixingBuffer::bzeroBuffer(s32 chan)
{
	EGG_ASSERT(155, chan < WPAD_MAX_CONTROLLERS);
	EGG_ASSERT(156, mBuffer[chan]);
	SpkCalc::bzero(mBuffer[chan], cSamplesPerAudioPacket * sizeof(s16));
}
