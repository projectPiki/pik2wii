#ifndef NW4R_UT_RESFONTBASE_H
#define NW4R_UT_RESFONTBASE_H

#include <nw4r/types_nw4r.h>

#include <nw4r/ut/ut_Font.h>

namespace nw4r {
namespace ut {

////////////////////// BASE TYPES //////////////////////

/**
 * @brief Font mapping types.
 */
enum FontMapMethod {
	FONT_MAPMETHOD_DIRECT, // 0
	FONT_MAPMETHOD_TABLE,  // 1
	FONT_MAPMETHOD_SCAN,   // 2
};

/**
 * @brief Object for handling glyph texture resources.
 *
 * @note Size: 0x18.
 */
struct FontTextureGlyph {
	u8 cellWidth;    // _00
	u8 cellHeight;   // _01
	s8 baselinePos;  // _02
	u8 maxCharWidth; // _03
	u32 sheetSize;   // _04
	u16 sheetNum;    // _08
	u16 sheetFormat; // _0A
	u16 sheetRow;    // _0C
	u16 sheetLine;   // _0E
	u16 sheetWidth;  // _10
	u16 sheetHeight; // _12
	u8* sheetImage;  // _14
};

/**
 * @brief Object for font width info.
 *
 * @note Size: 0x8.
 */
struct FontWidth {
	u16 indexBegin;          // _00
	u16 indexEnd;            // _02
	FontWidth* pNext;        // _04
	CharWidths widthTable[]; // _08
};

/**
 * @brief Object for handling font codes.
 *
 * @note Size: 0xC.
 */
struct FontCodeMap {
	u16 ccodeBegin;     // _00
	u16 ccodeEnd;       // _02
	u16 mappingMethod;  // _04
	u16 reserved;       // _06
	FontCodeMap* pNext; // _08
	u16 mapInfo[];      // _0C
};

/**
 * @brief Object for general font info.
 *
 * @note Size: 0x17.
 */
struct FontInformation {
	u8 fontType;              // _00
	s8 linefeed;              // _01
	u16 alterCharIndex;       // _02
	CharWidths defaultWidth;  // _04
	u8 encoding;              // _07
	FontTextureGlyph* pGlyph; // _08
	FontWidth* pWidth;        // _0C
	FontCodeMap* pMap;        // _10
	u8 height;                // _14
	u8 width;                 // _15
	u8 ascent;                // _16
};

////////////////////////////////////////////////////////
////////////////////// FONT TYPE ///////////////////////

namespace detail {

/**
 * @brief Base class for fonts loaded as a resource.
 *
 * @note Size: 0x20.
 */
class ResFontBase : public Font {
public:
	ResFontBase();

	virtual ~ResFontBase();                                       // _08
	virtual int GetWidth() const;                                 // _0C
	virtual int GetHeight() const;                                // _10
	virtual int GetAscent() const;                                // _14
	virtual int GetDescent() const;                               // _18
	virtual int GetBaselinePos() const;                           // _1C
	virtual int GetCellHeight() const;                            // _20
	virtual int GetCellWidth() const;                             // _24
	virtual int GetMaxCharWidth() const;                          // _28
	virtual Type GetType() const;                                 // _2C
	virtual GXTexFmt GetTextureFormat() const;                    // _30
	virtual int GetLineFeed() const;                              // _34
	virtual CharWidths GetDefaultCharWidths() const;              // _38
	virtual void SetDefaultCharWidths(const CharWidths& rWidths); // _3C
	virtual bool SetAlternateChar(u16 ch);                        // _40
	virtual void SetLineFeed(int lf);                             // _44
	virtual int GetCharWidth(u16 ch) const;                       // _48
	virtual CharWidths GetCharWidths(u16 ch) const;               // _4C
	virtual void GetGlyph(Glyph* pGlyph, u16 ch) const;           // _50
	virtual bool HasGlyph(u16 ch) const;                          // _54
	virtual FontEncoding GetEncoding() const;                     // _58

protected:
	bool IsManaging(const void* pBuffer) const { return mResource == pBuffer; }

	void SetResourceBuffer(void* pBuffer, FontInformation* pInfo);

private:
	u16 GetGlyphIndex(u16 ch) const;

	u16 FindGlyphIndex(u16 ch) const;
	u16 FindGlyphIndex(const FontCodeMap* pMap, u16 ch) const;

	const CharWidths& GetCharWidthsFromIndex(u16 index) const;
	const CharWidths& GetCharWidthsFromIndex(const FontWidth* pWidth, u16 index) const;

	void GetGlyphFromIndex(Glyph* pGlyph, u16 index) const;

public:
	static const u16 GLYPH_INDEX_NOT_FOUND = 0xFFFF;

private:
	// _00     = VTBL
	// _00-_10 = Font
	void* mResource;             // _10
	FontInformation* mFontInfo;  // _14
	mutable u16 mLastCharCode;   // _18
	mutable u16 mLastGlyphIndex; // _1A
};

} // namespace detail

////////////////////////////////////////////////////////

} // namespace ut
} // namespace nw4r

#endif
