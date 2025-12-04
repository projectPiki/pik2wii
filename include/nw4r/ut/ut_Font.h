#ifndef NW4R_UT_FONT_H
#define NW4R_UT_FONT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/ut/ut_CharStrmReader.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace ut {

////////////////////// BASE TYPES //////////////////////

/**
 * @brief Font encoding types.
 */
enum FontEncoding {
	FONT_ENCODING_UTF8,   // 0
	FONT_ENCODING_UTF16,  // 1
	FONT_ENCODING_SJIS,   // 2
	FONT_ENCODING_CP1252, // 3

	FONT_ENCODING_MAX, // 4
};

/**
 * @brief Object for character width info.
 *
 * @note Size: 0x3.
 */
struct CharWidths {
	s8 left;       // _00
	u8 glyphWidth; // _01
	s8 charWidth;  // _02
};

/**
 * @brief Info about a given glyph.
 *
 * @note Size: 0x14.
 */
struct Glyph {
	void* pTexture;     // _00
	CharWidths widths;  // _04
	u8 height;          // _07
	GXTexFmt texFormat; // _08
	u16 texWidth;       // _0C
	u16 texHeight;      // _0E
	u16 cellX;          // _10
	u16 cellY;          // _12
};

////////////////////////////////////////////////////////
////////////////////// FONT TYPE ///////////////////////

/**
 * @brief Base class for fonts.
 *
 * @note Size: 0x10.
 */
class Font {
public:
	/**
	 * @brief Font type.
	 */
	enum Type {
		TYPE_NULL,     // 0
		TYPE_ROM,      // 1
		TYPE_RESOURCE, // 2
		TYPE_PAIR,     // 3
	};

public:
	Font()
	    : mReadFunc(&CharStrmReader::ReadNextCharCP1252)
	{
	}

	virtual ~Font() { }                                               // _08
	virtual int GetWidth() const                                 = 0; // _0C
	virtual int GetHeight() const                                = 0; // _10
	virtual int GetAscent() const                                = 0; // _14
	virtual int GetDescent() const                               = 0; // _18
	virtual int GetBaselinePos() const                           = 0; // _1C
	virtual int GetCellHeight() const                            = 0; // _20
	virtual int GetCellWidth() const                             = 0; // _24
	virtual int GetMaxCharWidth() const                          = 0; // _28
	virtual Type GetType() const                                 = 0; // _2C
	virtual GXTexFmt GetTextureFormat() const                    = 0; // _30
	virtual int GetLineFeed() const                              = 0; // _34
	virtual CharWidths GetDefaultCharWidths() const              = 0; // _38
	virtual void SetDefaultCharWidths(const CharWidths& rWidths) = 0; // _3C
	virtual bool SetAlternateChar(u16 ch)                        = 0; // _40
	virtual void SetLineFeed(int lf)                             = 0; // _44
	virtual int GetCharWidth(u16 ch) const                       = 0; // _48
	virtual CharWidths GetCharWidths(u16 ch) const               = 0; // _4C
	virtual void GetGlyph(Glyph* pGlyph, u16 ch) const           = 0; // _50
	virtual bool HasGlyph(u16 ch) const                          = 0; // _54
	virtual FontEncoding GetEncoding() const                     = 0; // _58

	void InitReaderFunc(FontEncoding encode);

	CharStrmReader GetCharStrmReader() const { return CharStrmReader(mReadFunc); }

private:
	// _00 = VTBL
	CharStrmReader::ReadFunc mReadFunc; // _04
};

////////////////////////////////////////////////////////

} // namespace ut
} // namespace nw4r

#endif
