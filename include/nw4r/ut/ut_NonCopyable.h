#ifndef NW4R_UT_NONCOPYABLE_H
#define NW4R_UT_NONCOPYABLE_H

#include <nw4r/types_nw4r.h>

namespace nw4r {
namespace ut {
namespace {

//////////////////////// TYPES /////////////////////////

/**
 * @brief TODO
 *
 * @note Size: 0x0.
 */
class NonCopyable {
protected:
	NonCopyable() { }
	NonCopyable(const NonCopyable& rOther) { }
	~NonCopyable() { }
};

////////////////////////////////////////////////////////

} // namespace
} // namespace ut
} // namespace nw4r

#endif
