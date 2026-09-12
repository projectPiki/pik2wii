#include "RevoSDK/sc.h"
#include "System12/Language.h"
#include "System12/System.h"
#include "egg/prim/eggAssert.h"
#include <string.h>

namespace System12 {

EGG_SINGLETON_IMPL(6, Language);

Language::Language()
{
	mLanguage = -1;
	mLocale   = -1;
	_1C       = false;
}

namespace {
const char* codes[] = { "Jpn", "EngUS", "EngEU", "FreUS", "FreEU", "SpaUS", "SpaEU", "GerEU", "ItaEU", "HolEU", "ChS", "ChT", "Kor" };
} // namespace

} // namespace System12

extern "C" void makeLanguagePath(System12::Language* language, char* buf, size_t len, const char* path, const char* folder)
{
	snprintf(buf, len, "%s/%s/%s", folder, System12::codes[language->mLanguage], path);
}