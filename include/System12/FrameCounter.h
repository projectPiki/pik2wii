#ifndef _SYSTEM12_FRAME_COUNTER_H
#define _SYSTEM12_FRAME_COUNTER_H

#include <egg/prim/eggBitFlag.h>

namespace System12 {

class FrameCounter {
public:
	enum eType {
		TYPE_Unk0 = 0,
		TYPE_Unk1 = 1,
		TYPE_Unk2 = 2,
	};

	FrameCounter();

	virtual void play(eType, f32);                       // _08
	virtual void playFromCurrent(eType, f32);            // _0C
	virtual void playFromCurrentByDiff(eType, f32, f32); // _10
	virtual void playFromCurrentToTrg(eType, f32, f32);  // _14
	virtual void stop(f32);                              // _18
	virtual void stopCurrent();                          // _1C
	virtual void stopAtEnd();                            // _20
	virtual void calc();                                 // _24
	virtual void setCurrentFrame(f32);                   // _28

	void resetUserFrameRange();
	u16 isEnd() const;

	// unused/inlined:

	void setUserFrameRange(f32, f32);
	void setupMaxFrames(f32 frame)
	{
		mMaxFrames = frame;
		resetUserFrameRange();
	}
	f32 getUserMaxFrame() const;
	f32 getSpeed() const;
	f32 getCurrentFrame() const { return mCurrentFrame; }
	f32 getMaxFrames() const { return mMaxFrames; }
	eType getType() const { return mType; }
	u16 isTurnedMax() const;
	u16 isTurnedMin() const;
	u16 isEndDiff() const;

	// _00     = VTBL
	f32 mCurrentFrame;         // _04
	f32 mSpeed;                // _08
	f32 mDiff;                 // _0C
	f32 mMaxFrames;            // _10
	f32 mUserFrameRangeStart;  // _14
	f32 mUserFrameRangeEnd;    // _18
	eType mType;               // _1C
	u32 _20;                   // _20
	EGG::TBitFlag<u16> mFlags; // _24
};

} // namespace System12

#endif
