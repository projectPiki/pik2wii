#ifndef NW4R_UT_ROMFONT_H
#define NW4R_UT_ROMFONT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/ut/ut_Font.h>

#include <RevoSDK/os.h>

namespace nw4r {
namespace ut {

////////////////////// BASE TYPES //////////////////////

/**
 * @brief Class for fonts loaded from disc.
 *
 * @note Size: 0x1A.
 */
class RomFont : public Font {
public:
	RomFont();

	virtual ~RomFont();                                           // _08
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
	virtual bool HasGlyph(u16) const;                             // _54
	virtual FontEncoding GetEncoding() const;                     // _58

	u32 GetRequireBufferSize();
	bool Load(void* pBuffer);

private:
	static const int CHAR_PTR_BUFFER_SIZE = 4;

private:
	void MakeCharPtr(char* pBuffer, u16 ch) const;
	u16 HandleUndefinedChar(u16 ch) const;

private:
	static u16 mFontEncode;

private:
	// _00     = VTBL
	// _00-_10 = Font
	OSFontHeader* mFontHeader; // _10
	CharWidths mDefaultWidths; // _14
	u16 mAlternateChar;        // _18
};

////////////////////////////////////////////////////////

} // namespace ut
} // namespace nw4r

#endif
