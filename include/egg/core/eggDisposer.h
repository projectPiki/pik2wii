#ifndef EGG_CORE_DISPOSER_H
#define EGG_CORE_DISPOSER_H

#include <egg/egg_types.h>

#include <nw4r/ut.h>

namespace EGG {

// Forward declarations
class Heap;

///////////////////// DISPOSER TYPE ////////////////////

/**
 * @brief Base class for memory-related objects that need cleaning up.
 *
 * @note Size: 0x10.
 */
class Disposer {
	friend class Heap;

public:
	Disposer();

	virtual ~Disposer(); // _08

private:
	// _00 = VTBL
	Heap* mContainHeap; // _04

public:
	NW4R_UT_LIST_LINK_DECL(); // _08
};

////////////////////////////////////////////////////////

} // namespace EGG

#endif
