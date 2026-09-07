#ifndef SYSTEM12_SPKMIXINGBUFFER_H
#define SYSTEM12_SPKMIXINGBUFFER_H

#include "egg/core/eggHeap.h"

static const s32 cSamplesPerAudioPacket = 40;

class SpkMixingBuffer {
public:
	SpkMixingBuffer();
	void mix(s32 chan, s16* src, s32 len, f32 weight, s32 offset);
	s16* getSamples(s32 chan) const;
	bool update(s32 chan);
	void bzeroBuffer(s32 chan);

private:
	s16* mBuffer[4]; // _00
};

#endif
