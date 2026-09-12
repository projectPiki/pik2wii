#ifndef _SYSTEM12_RESOURCE_MGR_H
#define _SYSTEM12_RESOURCE_MGR_H

#include <egg/core/eggHeap.h>
#include <egg/core/eggSingleton.h>

namespace System12 {

class SystemResourceMgr {
	EGG_SINGLETON_DECL(SystemResourceMgr);

public:
	SystemResourceMgr();

	virtual void construct(EGG::Heap*);

	// _00     = VTBL
	// _00-_10 = EGG::Disposer
	u8* mPikmin12Font; // _14
};

} // namespace System12

#endif
