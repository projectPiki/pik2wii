#ifndef NW4R_UT_TEXTWRITERBASE_H
#define NW4R_UT_TEXTWRITERBASE_H

#include <nw4r/types_nw4r.h>

#include <nw4r/ut/ut_CharWriter.h>
#include <nw4r/ut/ut_TagProcessorBase.h>

#include <PowerPC_EABI_Support/MSL_C/MSL_Common/printf.h>

namespace nw4r {
namespace ut {

////////////////////// BASE TYPES //////////////////////

/**
 * @brief Base class for printing blocks of text.
 *
 * @note Size: 0x64.
 */
template <typename T>
class TextWriterBase : public CharWriter {
public:
	typedef TagProcessorBase<T> TagProcessorType;

public:
	/**
	 * @brief Flags for alignment (both within-line and within-block).
	 */
	enum DrawFlag {
		// Align text lines
		DRAWFLAG_ALIGN_TEXT_BASELINE = 0,
		DRAWFLAG_ALIGN_TEXT_CENTER   = (1 << 0),
		DRAWFLAG_ALIGN_TEXT_RIGHT    = (1 << 1),

		// Align text block (horizontal)
		DRAWFLAG_ALIGN_H_BASELINE = 0,
		DRAWFLAG_ALIGN_H_CENTER   = (1 << 4),
		DRAWFLAG_ALIGN_H_RIGHT    = (1 << 5),

		// Align text block (vertical)
		DRAWFLAG_ALIGN_V_BASELINE = 0,
		DRAWFLAG_ALIGN_V_CENTER   = (1 << 8),
		DRAWFLAG_ALIGN_V_TOP      = (1 << 9),

		// Mask constants
		DRAWFLAG_MASK_ALIGN_TEXT = DRAWFLAG_ALIGN_TEXT_BASELINE | DRAWFLAG_ALIGN_TEXT_CENTER | DRAWFLAG_ALIGN_TEXT_RIGHT,

		DRAWFLAG_MASK_ALIGN_H = DRAWFLAG_ALIGN_H_BASELINE | DRAWFLAG_ALIGN_H_CENTER | DRAWFLAG_ALIGN_H_RIGHT,

		DRAWFLAG_MASK_ALIGN_V = DRAWFLAG_ALIGN_V_BASELINE | DRAWFLAG_ALIGN_V_CENTER | DRAWFLAG_ALIGN_V_TOP,
	};

public:
	TextWriterBase();
	~TextWriterBase();

	f32 GetWidthLimit() const { return mWidthLimit; }
	void SetWidthLimit(f32 limit) { mWidthLimit = limit; }
	void ResetWidthLimit() { mWidthLimit = NW4R_MATH_FLT_MAX; }

	f32 GetCharSpace() const { return mCharSpace; }
	void SetCharSpace(f32 space) { mCharSpace = space; }

	f32 GetLineSpace() const { return mLineSpace; }
	void SetLineSpace(f32 space) { mLineSpace = space; }

	int GetTabWidth() const { return mTabWidth; }
	void SetTabWidth(int width) { mTabWidth = width; }

	u32 GetDrawFlag() const { return mDrawFlag; }
	void SetDrawFlag(u32 flag) { mDrawFlag = flag; }

	TagProcessorBase<T>* GetTagProcessor() const { return mTagProcessor; }
	void SetTagProcessor(TagProcessorBase<T>* pProcessor) { mTagProcessor = pProcessor; }
	void ResetTagProcessor() { mTagProcessor = &mDefaultTagProcessor; }

	f32 GetLineHeight() const;

	f32 CalcLineWidth(const T* pStr, int len);
	f32 CalcStringWidth(const T* pStr, int len) const;
	f32 CalcStringHeight(const T* pStr, int len) const;
	void CalcFormatStringRect(Rect* rect, const T* format, ...) const;
	void CalcStringRect(Rect* pRect, const T* pStr, int len) const;
	void CalcVStringRect(Rect* rect, const T* format, va_list args) const;

	f32 VPrintf(const T* pStr, va_list args);
	f32 Print(const T* pStr, int len);
	f32 PrintMutable(const T* str, int length);

	static int VSNPrintf(T* buffer, u32 count, const T* pStr, va_list args);
	static T* GetBuffer() { return mFormatBuffer; }
	static T* SetBuffer(T* pBuffer, u32 size)
	{
		T* pOldBuffer     = mFormatBuffer;
		mFormatBuffer     = pBuffer;
		mFormatBufferSize = size;
		return pOldBuffer;
	}

	static u32 GetBufferSize() { return mFormatBufferSize; }

private:
	static const int DEFAULT_FORMAT_BUFFER_SIZE = 256;

	static const u32 DRAWFLAG_MASK_ALL = DRAWFLAG_MASK_ALIGN_TEXT | DRAWFLAG_MASK_ALIGN_H | DRAWFLAG_MASK_ALIGN_V;

private:
	bool IsDrawFlagSet(u32 mask, u32 flag) const { return (mDrawFlag & mask) == flag; }

	bool CalcLineRectImpl(Rect* pRect, const T** ppStr, int len);
	void CalcStringRectImpl(Rect* pRect, const T* pStr, int len);

	f32 PrintImpl(const T* pStr, int len);
	f32 AdjustCursor(f32* pX, f32* pY, const T* pStr, int len);

private:
	static T* mFormatBuffer;
	static u32 mFormatBufferSize;
	static TagProcessorBase<T> mDefaultTagProcessor;

private:
	// _00-_4C = CharWriter
	f32 mWidthLimit;                    // _4C
	f32 mCharSpace;                     // _50
	f32 mLineSpace;                     // _54
	int mTabWidth;                      // _58
	u32 mDrawFlag;                      // _5C
	TagProcessorBase<T>* mTagProcessor; // _60
};

////////////////////////////////////////////////////////
///////////////// SPECIALISED TYPEDEFS /////////////////

typedef TextWriterBase<char> TextWriter;

template <>
inline int TextWriterBase<char>::VSNPrintf(char* buffer, u32 count, const char* format, va_list args)
{
	return vsnprintf(buffer, count, format, args);
}

// template <>
// inline int TextWriterBase<wchar_t>::VSNPrintf(wchar_t* buffer, u32 count, const wchar_t* format, va_list args)
// {
// 	return vswprintf(buffer, count, format, args);
// }

////////////////////////////////////////////////////////

} // namespace ut
} // namespace nw4r

#endif
