#include "System12/DebugDrawer.h"
#include "egg/prim/eggAssert.h"
#include <string.h>

namespace System12 {

EGG_SINGLETON_IMPL(11, DebugDrawer);

DebugDrawer::DebugDrawer()
    : _40(nullptr)
    , _44(nullptr)
    , _48(nullptr)
    , _4C(nullptr)
    , _50(nullptr)
{
	mMatrix.makeIdentity();
	_4C       = 0x8000;
	int* data = new int[0x4000];
	_40       = data;
	_44       = data;
	_48       = _4C;
	_50       = 0;
}

} // namespace System12
