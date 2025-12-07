#include <nw4r/ut/ut_ResFontBase.h>

namespace nw4r {
namespace ut {
namespace detail {

/**
 * @brief TODO
 *
 */
ResFontBase::ResFontBase()
    : mResource(nullptr)
    , mFontInfo(nullptr)
    , mLastCharCode(0)
    , mLastGlyphIndex(GLYPH_INDEX_NOT_FOUND)
{
}

/**
 * @brief TODO
 *
 */
ResFontBase::~ResFontBase()
{
}

/**
 * @brief TODO
 *
 */
void ResFontBase::SetResourceBuffer(void* pBuffer, FontInformation* pInfo)
{
	mResource = pBuffer;
	mFontInfo = pInfo;
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetWidth() const
{
	return mFontInfo->width;
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetHeight() const
{
	return mFontInfo->height;
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetAscent() const
{
	return mFontInfo->ascent;
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetDescent() const
{
	return mFontInfo->height - mFontInfo->ascent;
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetBaselinePos() const
{
	return mFontInfo->pGlyph->baselinePos;
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetCellHeight() const
{
	return mFontInfo->pGlyph->cellHeight;
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetCellWidth() const
{
	return mFontInfo->pGlyph->cellWidth;
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetMaxCharWidth() const
{
	return mFontInfo->pGlyph->maxCharWidth;
}

/**
 * @brief TODO
 *
 */
Font::Type ResFontBase::GetType() const
{
	return TYPE_RESOURCE;
}

/**
 * @brief TODO
 *
 */
GXTexFmt ResFontBase::GetTextureFormat() const
{
	return static_cast<GXTexFmt>(mFontInfo->pGlyph->sheetFormat);
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetLineFeed() const
{
	return mFontInfo->linefeed;
}

/**
 * @brief TODO
 *
 */
CharWidths ResFontBase::GetDefaultCharWidths() const
{
	return mFontInfo->defaultWidth;
}

/**
 * @brief TODO
 *
 */
void ResFontBase::SetDefaultCharWidths(const CharWidths& rWidths)
{
	mFontInfo->defaultWidth = rWidths;
}

/**
 * @brief TODO
 *
 */
bool ResFontBase::SetAlternateChar(u16 ch)
{
	u16 index = FindGlyphIndex(ch);

	if (index != GLYPH_INDEX_NOT_FOUND) {
		mFontInfo->alterCharIndex = index;
		return true;
	}

	return false;
}

/**
 * @brief TODO
 *
 */
void ResFontBase::SetLineFeed(int lf)
{
	mFontInfo->linefeed = lf;
}

/**
 * @brief TODO
 *
 */
int ResFontBase::GetCharWidth(u16 ch) const
{
	return GetCharWidths(ch).charWidth;
}

/**
 * @brief TODO
 *
 */
CharWidths ResFontBase::GetCharWidths(u16 ch) const
{
	return GetCharWidthsFromIndex(GetGlyphIndex(ch));
}

/**
 * @brief TODO
 *
 */
void ResFontBase::GetGlyph(Glyph* pGlyph, u16 ch) const
{
	GetGlyphFromIndex(pGlyph, GetGlyphIndex(ch));
}

/**
 * @brief TODO
 *
 */
bool ResFontBase::HasGlyph(u16 ch) const
{
	return FindGlyphIndex(ch) != 0xFFFF;
}

/**
 * @brief TODO
 *
 */
FontEncoding ResFontBase::GetEncoding() const
{
	return static_cast<FontEncoding>(mFontInfo->encoding);
}

/**
 * @brief TODO
 *
 */
u16 ResFontBase::GetGlyphIndex(u16 ch) const
{
	u16 index = FindGlyphIndex(ch);
	return index != GLYPH_INDEX_NOT_FOUND ? index : mFontInfo->alterCharIndex;
}

/**
 * @brief TODO
 *
 */
u16 ResFontBase::FindGlyphIndex(u16 ch) const
{
	if (ch == mLastCharCode) {
		return mLastGlyphIndex;
	}
	mLastCharCode = ch;

	for (const FontCodeMap* pIt = mFontInfo->pMap; pIt != nullptr; pIt = pIt->pNext) {

		if (pIt->ccodeBegin <= ch && ch <= pIt->ccodeEnd) {
			mLastGlyphIndex = FindGlyphIndex(pIt, ch);
			return mLastGlyphIndex;
		}
	}

	mLastGlyphIndex = GLYPH_INDEX_NOT_FOUND;
	return mLastGlyphIndex;
}

/**
 * @brief TODO
 *
 */
u16 ResFontBase::FindGlyphIndex(const FontCodeMap* pMap, u16 ch) const
{
	u16 index = GLYPH_INDEX_NOT_FOUND;

	switch (pMap->mappingMethod) {
	case FONT_MAPMETHOD_DIRECT: {
		index = pMap->mapInfo[0] + (ch - pMap->ccodeBegin);
		break;
	}

	case FONT_MAPMETHOD_TABLE: {
		index = pMap->mapInfo[ch - pMap->ccodeBegin];
		break;
	}

	case FONT_MAPMETHOD_SCAN: {
		struct CMapScanEntry {
			u16 ccode; // _00
			u16 index; // _02
		};
		struct CMapInfoScan {
			u16 num;                 // _00
			CMapScanEntry entries[]; // _02
		};

		const CMapInfoScan* pInfo = reinterpret_cast<const CMapInfoScan*>(pMap->mapInfo);

		const CMapScanEntry* pStart = pInfo->entries;
		const CMapScanEntry* pEnd   = &pInfo->entries[pInfo->num - 1];

		while (pStart <= pEnd) {
			const CMapScanEntry* pMiddle = pStart + (pEnd - pStart) / 2;

			if (pMiddle->ccode < ch) {
				pStart = pMiddle + 1;
			} else if (ch < pMiddle->ccode) {
				pEnd = pMiddle - 1;
			} else {
				return pMiddle->index;
			}
		}

		break;
	}
	}

	return index;
}

/**
 * @brief TODO
 *
 */
const CharWidths& ResFontBase::GetCharWidthsFromIndex(u16 index) const
{
	for (const FontWidth* pIt = mFontInfo->pWidth; pIt != nullptr; pIt = pIt->pNext) {

		if (pIt->indexBegin <= index && index <= pIt->indexEnd) {
			return GetCharWidthsFromIndex(pIt, index);
		}
	}

	return mFontInfo->defaultWidth;
}

/**
 * @brief TODO
 *
 */
const CharWidths& ResFontBase::GetCharWidthsFromIndex(const FontWidth* pWidth, u16 index) const
{
	return pWidth->widthTable[index - pWidth->indexBegin];
}

/**
 * @brief TODO
 *
 */
void ResFontBase::GetGlyphFromIndex(Glyph* pGlyph, u16 index) const
{
	const FontTextureGlyph* pTexGlyph = mFontInfo->pGlyph;

	u32 cellsInASheet = pTexGlyph->sheetRow * pTexGlyph->sheetLine;

	u32 glyphCell  = index % cellsInASheet;
	u32 glyphSheet = index / cellsInASheet;

	u32 unitX = glyphCell % pTexGlyph->sheetRow;
	u32 unitY = glyphCell / pTexGlyph->sheetRow;

	u32 pixelX = unitX * (pTexGlyph->cellWidth + 1);
	u32 pixelY = unitY * (pTexGlyph->cellHeight + 1);

	pGlyph->pTexture = pTexGlyph->sheetImage + (glyphSheet * pTexGlyph->sheetSize);

	pGlyph->widths = GetCharWidthsFromIndex(index);
	pGlyph->height = pTexGlyph->cellHeight;

	pGlyph->texFormat = static_cast<GXTexFmt>(pTexGlyph->sheetFormat);

	pGlyph->texWidth  = pTexGlyph->sheetWidth;
	pGlyph->texHeight = pTexGlyph->sheetHeight;

	pGlyph->cellX = pixelX + 1;
	pGlyph->cellY = pixelY + 1;
}

} // namespace detail
} // namespace ut
} // namespace nw4r
