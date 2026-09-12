#include "System12/WPWideTextWriter.h"
#include "egg/prim/eggAssert.h"

namespace System12 {

wchar_t* WPWideTextWriter::sStrExpBuffer = nullptr;
WPTagProcessor WPWideTextWriter::sDefaultTagProcessor;

void WPWideTextWriter::Initialize()
{
	sStrExpBuffer = new wchar_t[2048];
	EGG_ASSERT(17, sStrExpBuffer);
}

WPWideTextWriter::WPWideTextWriter()
{
	EGG_ASSERT_MSG(22, sStrExpBuffer, "Maybe, you forgot to Initialize().\n");

	SetBuffer(sStrExpBuffer, 2048);

	setRPSysTagProcessor(&sDefaultTagProcessor);
	reset();
	setWaitTimePerWord(0.0f);
}

WPWideTextWriter::~WPWideTextWriter()
{
}

void WPWideTextWriter::reset()
{
	_6C      = 0;
	mPageIdx = 1;
	mRunning = true;
	_75      = false;
	setPrintOneStrokeMode(false);
	_7C = 0.0f;
}

void WPWideTextWriter::setWaitTimePerWord(f32 time)
{
	mWaitTimePerWord = time;
}

void WPWideTextWriter::setPrintOneStrokeMode(bool mode)
{
	mPrintOneStrokeMode = mode;
}

void WPWideTextWriter::calc(f32 time)
{
	if (mRunning) {
		return;
	}
	if (_75) {
		return;
	}
	f32 rate = _7C + time;
	_7C      = rate;
	if (mPrintOneStrokeMode) {
		_6C = 0x10000;
		return;
	}

	if (rate < mWaitTimePerWord) {
		return;
	}

	_7C = rate - mWaitTimePerWord;
	if (1 < _6C) {
		return;
	}
	_6C++;
}

void WPWideTextWriter::calcBBox(EGG::BoundBox2f* box, const wchar_t* str)
{
	wchar_t* buffer = GetBuffer();
	int size        = GetBufferSize() << 1;
	EGG_ASSERT(132, buffer);
	int len = 0;

	mTagProcessor2->PreProcessWithNumWords(str, _6C, buffer, size, &len, 0, mPageIdx);
	nw4r::ut::Rect rec;
	CalcStringRect(&rec, buffer, len);
	box->mMax.y = rec.bottom;
	box->mMin.x = rec.right;
	box->mMin.y = rec.top;

	box->mMax.x = rec.left;
}

void WPWideTextWriter::calcBBoxFullText(EGG::BoundBox2f* box, const wchar_t* str, int p3)
{
	wchar_t* buffer = GetBuffer();
	int size        = GetBufferSize() << 1;
	EGG_ASSERT(149, buffer);
	int len = 0;
	mTagProcessor2->PreProcessWithNumWords(str, 0x00010000, buffer, size, &len, 0, p3);
	nw4r::ut::Rect rec;
	CalcStringRect(&rec, buffer, len);

	box->mMin.x = rec.left;
	box->mMin.y = rec.top;
	box->mMax.x = rec.right;
	box->mMax.y = rec.bottom;

	// box->mMin.x = rec.right;
	// box->mMin.y = rec.top;
}

f32 WPWideTextWriter::printWithPos(f32 x, f32 y, const wchar_t* str)
{
	EGG_ASSERT(167, str);
	SetCursor(x, y);
	wchar_t* buffer = GetBuffer();
	int size        = GetBufferSize() << 1;
	EGG_ASSERT(175, buffer);
	int len = 0;
	EGG_ASSERT_MSG(179, mTagProcessor2, "Maybe, you forgot to Initialize().\n");
	int process = mTagProcessor2->PreProcessWithNumWords(str, _6C, buffer, size, &len, 0, mPageIdx);
	switch (process) {
	case 1:
		mRunning = true;
		break;
	case 2:
		_75      = true;
		mRunning = true;
		break;
	case 0:
	case 3:
	default:
		break;
	}
	if (_6C <= 0) {
		return 0.0f;
	} else {
		return Print(buffer, len);
	}
}

} // namespace System12
