#ifndef NW4R_UT_CHAR_WRITER_H
#define NW4R_UT_CHAR_WRITER_H

#include <nw4r/types_nw4r.h>
#include <nw4r/ut/ut_Color.h>

#include <nw4r/math.h>

#include <RevoSDK/gx.h>

namespace nw4r {
namespace ut {

// Forward declarations
class Font;
struct Glyph;

//////////////////////// TYPES /////////////////////////

/**
 * @brief Base class for printing any character.
 *
 * @note Size: 0x4C.
 */
class CharWriter {
public:
	/**
	 * @brief Gradient coloring types.
	 */
	enum GradationMode {
		GRADMODE_NONE, // 0
		GRADMODE_H,    // 1
		GRADMODE_V,    // 2

		GRADMODE_MAX, // 3
	};

private:
	/**
	 * @brief Color object for blending/mapping.
	 *
	 * @note Size: 0x8.
	 */
	struct ColorMapping {
		Color min; // _00
		Color max; // _04
	};

	/**
	 * @brief Color object for vertices of a box.
	 *
	 * @note Size: 0x10.
	 */
	struct VertexColor {
		Color lu; // _00
		Color ru; // _04
		Color ld; // _08
		Color rd; // _0C
	};

	/**
	 * @brief Color object for text.
	 *
	 * @note Size: 0xC.
	 */
	struct TextColor {
		Color start;                 // _00
		Color end;                   // _04
		GradationMode gradationMode; // _08
	};

	/**
	 * @brief Object for handling texture filtering at different sizes.
	 *
	 * @note Size: 0x8.
	 */
	struct TextureFilter {
		bool operator!=(const TextureFilter& rOther) const { return atSmall != rOther.atSmall || atLarge != rOther.atLarge; }

		GXTexFilter atSmall; // _00
		GXTexFilter atLarge; // _04
	};

	/**
	 * @brief Object for handling font texture loading.
	 *
	 * @note Size: 0x10.
	 */
	struct LoadingTexture {
		bool operator!=(const LoadingTexture& rOther) const
		{
			return slot != rOther.slot || texture != rOther.texture || filter != rOther.filter;
		}

		void Reset()
		{
			slot    = GX_TEXMAP_NULL;
			texture = nullptr;
		}

		GXTexMapID slot;      // _00
		void* texture;        // _04
		TextureFilter filter; // _08
	};

public:
	CharWriter();
	~CharWriter();

	void SetupGX();
	void EnableLinearFilter(bool atSmall, bool atLarge);
	f32 Print(u16 ch);

	void SetColorMapping(Color min, Color max)
	{
		mColorMapping.min = min;
		mColorMapping.max = max;
	}

	void ResetColorMapping() { SetColorMapping(DEFAULT_COLOR_MAPPING_MIN, DEFAULT_COLOR_MAPPING_MAX); }

	void SetTextColor(Color start)
	{
		mTextColor.start = start;
		UpdateVertexColor();
	}

	void SetTextColor(Color start, Color end)
	{
		mTextColor.start = start;
		mTextColor.end   = end;
		UpdateVertexColor();
	}

	void SetGradationMode(GradationMode mode)
	{
		mTextColor.gradationMode = mode;
		UpdateVertexColor();
	}

	f32 GetScaleH() const { return mScale.x; }
	f32 GetScaleV() const { return mScale.y; }

	void SetScale(f32 x, f32 y)
	{
		mScale.x = x;
		mScale.y = y;
	}

	f32 GetCursorX() const { return mCursorPos.x; }
	void SetCursorX(f32 x) { mCursorPos.x = x; }

	f32 GetCursorY() const { return mCursorPos.y; }
	void SetCursorY(f32 y) { mCursorPos.y = y; }

	void SetCursor(f32 x, f32 y)
	{
		mCursorPos.x = x;
		mCursorPos.y = y;
	}
	void SetCursor(f32 x, f32 y, f32 z)
	{
		mCursorPos.x = x;
		mCursorPos.y = y;
		mCursorPos.z = z;
	}

	void MoveCursorX(f32 dx) { mCursorPos.x += dx; }
	void MoveCursorY(f32 dy) { mCursorPos.y += dy; }

	void SetAlpha(u8 alpha)
	{
		mAlpha = alpha;
		UpdateVertexColor();
	}
	u8 GetAlpha() const { return mAlpha; }

	void EnableFixedWidth(bool enable) { mIsWidthFixed = enable; }
	bool IsWidthFixed() const { return mIsWidthFixed; }

	void SetFixedWidth(f32 width) { mFixedWidth = width; }
	f32 GetFixedWidth() const { return mFixedWidth; }

	void SetFont(const Font& rFont) { mFont = &rFont; }
	const Font* GetFont() const { return mFont; }

	void SetFontSize(f32 width, f32 height);

	f32 GetFontWidth() const;
	f32 GetFontHeight() const;
	f32 GetFontAscent() const;
	f32 GetFontDescent() const;

private:
	static const u32 DEFAULT_COLOR_MAPPING_MIN = 0x00000000;
	static const u32 DEFAULT_COLOR_MAPPING_MAX = 0xFFFFFFFF;

private:
	static void SetupVertexFormat();
	static void SetupGXDefault();
	static void SetupGXWithColorMapping(Color min, Color max);
	static void SetupGXForI();
	static void SetupGXForRGBA();

	void UpdateVertexColor();
	void PrintGlyph(f32 x, f32 y, f32 z, const Glyph& rGlyph);

	void LoadTexture(const Glyph& rGlyph, GXTexMapID slot);
	void ResetTextureCache() { mLoadingTexture.Reset(); }

private:
	static LoadingTexture mLoadingTexture;

private:
	ColorMapping mColorMapping; // _00
	VertexColor mVertexColor;   // _08
	TextColor mTextColor;       // _18
	math::VEC2 mScale;          // _24
	math::VEC3 mCursorPos;      // _2C
	TextureFilter mFilter;      // _38
	u8 _40[0x42 - 0x40];        // _40, unknown/padding
	u8 mAlpha;                  // _42
	bool mIsWidthFixed;         // _43
	f32 mFixedWidth;            // _44
	const Font* mFont;          // _48
};

////////////////////////////////////////////////////////

} // namespace ut
} // namespace nw4r

#endif
