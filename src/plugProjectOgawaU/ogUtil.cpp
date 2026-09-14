#include "og/newScreen/ogUtil.h"
#include "Game/MoviePlayer.h"
#include "nans.h"

namespace og {
namespace newScreen {

/**
 * @note Address: 0x80317F28
 * @note Size: 0x24
 */
bool checkMovieActive()
{
	return ((Game::moviePlayer != nullptr) && (Game::moviePlayer->isFlag(Game::MVP_IsActive)));
}

/**
 * @note Address: N/A
 * @note Size: 0x4
 */
void drawObjName(Graphics&, char*)
{
	// UNUSED FUNCTION
}

/**
 * @note Address: N/A
 * @note Size: 0x84
 * Tells the game which resource folder path to use, based on system language.
 */
void getLanguageDir(char* path)
{
	char* langDir = nullptr;
	if (LOCALIZED) {
		switch (sys->getLanguage()) {
		case System::LANG_EUEnglish:
			langDir = "engEU/";
			break;
		case System::LANG_EUFrench:
			langDir = "fraEU/";
			break;
		case System::LANG_German:
			langDir = "gerEU/";
			break;
		case System::LANG_Italian:
			langDir = "itaEU/";
			break;
		case System::LANG_Japanese:
			langDir = "jpn/";
			break;
		case System::LANG_EUSpanish:
			langDir = "spaEU/";
			break;
		case System::LANG_USEnglish:
			langDir = "engUS/";
			break;
		case System::LANG_USFrench:
			langDir = "fraUS/";
			break;
		case System::LANG_USSpanish:
			langDir = "spaUS/";
			break;
		case System::LANG_Unused:
		default:
			langDir = "";
			break;
		}
	} else {
		langDir = "";
	}
	sprintf(path, "%s", langDir);
}

/**
 * @note Address: 0x80317F4C
 * @note Size: 0xDC
 */
void makeLanguageResName(char* languageResName, char const* path)
{
	char langDirBuffer[16];

	if (*path == '/') {
		sprintf(languageResName, "%s", path);
		return;
	}

	getLanguageDir(langDirBuffer);
	sprintf(languageResName, "/new_screen/%s%s", langDirBuffer, path);
}
} // namespace newScreen
} // namespace og
