#ifndef _SYSTEM12_WP_WIDE_TEXT_WRITER_H
#define _SYSTEM12_WP_WIDE_TEXT_WRITER_H

#include <System12/WPTagProcessor.h>
#include <egg/math/eggBoundBox.h>
#include <nw4r/ut.h>

namespace System12 {

class WPWideTextWriter : public nw4r::ut::TextWriterBase<wchar_t> {
public:
	WPWideTextWriter();

	virtual ~WPWideTextWriter();                                          // _0C
	virtual void calc(f32);                                               // _10
	virtual f32 printWithPos(f32, f32, const wchar_t*);                   // _14
	virtual void calcBBox(EGG::BoundBox2f*, const wchar_t*);              // _18
	virtual void calcBBoxFullText(EGG::BoundBox2f*, const wchar_t*, int); // _1C

	static void Initialize();
	void reset();
	void setWaitTimePerWord(f32);
	void setPrintOneStrokeMode(bool);

	// unused/inlined:

	void setRPSysTagProcessor(System12::WPTagProcessor* processor)
	{
		mTagProcessor2 = processor;
		SetTagProcessor(mTagProcessor2);
	}

	u32 getPageIdx();
	void init();
	void start();
	void stop();
	void end();
	bool isWaiting() const;
	bool isEnd() const;
	void nextPage();
	void setPage(int);

	static wchar_t* sStrExpBuffer;
	static WPTagProcessor sDefaultTagProcessor;

private:
	// _64     = VTBL
	// _00-_64 = nw4r::ut::TextWriterBase<wchar_t>
	WPTagProcessor* mTagProcessor2; // _68
	int _6C;                        // _6C
	int mPageIdx;                   // _70
	bool mRunning;                  // _74
	bool _75;                       // _75
	bool mPrintOneStrokeMode;       // _76
	f32 mWaitTimePerWord;           // _78
	f32 _7C;                        // _7C
};
} // namespace System12

#endif
