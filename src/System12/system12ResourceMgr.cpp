#include "System12/DirChanger.h"
#include "System12/Language.h"
#include "System12/ResourceMgr.h"
#include "egg/core/eggDvdRipper.h"
#include "egg/prim/eggAssert.h"


namespace System12 {

EGG_SINGLETON_IMPL(12, SystemResourceMgr);

SystemResourceMgr::SystemResourceMgr()
{
	mPikmin12Font = nullptr;
}

void SystemResourceMgr::construct(EGG::Heap* heap)
{
	DirChanger changer;
	char dir[1024];
	makeLanguagePath(EGG_INSTANCE(Language), dir, 1024, "font/pikmin12.brfnt", "pikmin12");
	mPikmin12Font = EGG::DvdRipper::loadToMainRAM(dir, 0, heap, EGG::DvdRipper::ALLOC_DIR_HEAD, 0, 0, 0);
}
} // namespace System12