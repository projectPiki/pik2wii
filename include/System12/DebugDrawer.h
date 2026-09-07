#ifndef _SYSTEM12_DEBUG_DRAWER_H
#define _SYSTEM12_DEBUG_DRAWER_H

#include <egg/core/eggSingleton.h>
#include <egg/math/eggMatrix.h>

namespace System12 {

class DebugDrawer {

	EGG_SINGLETON_DECL(DebugDrawer);

public:
	DebugDrawer();

	// _00     = VTBL
	// _00-_10 = EGG::Disposer
	EGG::Matrix34f mMatrix; // _10
	int* _40;               // _40
	int* _44;               // _44
	int _48;                // _48
	int _4C;                // _4C
	int _50;                // _50
};

} // namespace System12

#endif
