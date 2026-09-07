#ifndef _SYSTEM12_LANGUAGE_H
#define _SYSTEM12_LANGUAGE_H

#include <RevoSDK/sc.h>
#include <egg/core/eggHeap.h>
#include <egg/core/eggSingleton.h>

namespace System12 {

class Language {

	EGG_SINGLETON_DECL(Language);

public:
	Language();

	// _00     = VTBL
	// _00-_10 = EGG::Disposer
	u32 mLanguage; // _14
	u32 mLocale;   // _18
	bool _1C;      // _1C
};
} // namespace System12

extern "C" void makeLanguagePath(System12::Language*, char*, size_t, const char*, const char*);
extern "C" void makeLanguageFile(System12::Language*, char*, size_t, const char*);

#endif
