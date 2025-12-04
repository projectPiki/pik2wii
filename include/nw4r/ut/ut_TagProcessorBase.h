#ifndef NW4R_UT_TAGPROCESSORBASE_H
#define NW4R_UT_TAGPROCESSORBASE_H

#include <nw4r/types_nw4r.h>

namespace nw4r {
namespace ut {

// Forward declarations
struct Rect;
template <typename T>
class TextWriterBase;

////////////////////// BASE TYPES //////////////////////

/**
 * @brief Contextual info to use while printing text.
 *
 * @note Size: 0x14.
 */
template <typename T>
struct PrintContext {

	/**
	 * @brief Flags for printing.
	 */
	enum Flags {
		FLAGS_CHARSPACE = (1 << 0),
	};

	TextWriterBase<T>* writer; // _00
	const T* str;              // _04
	f32 x;                     // _08
	f32 y;                     // _0C
	u32 flags;                 // _10
};

/**
 * @brief Empty base class for processing tags.
 *
 * @note Size: 0x0.
 */
template <typename T>
class TagProcessorBase {
public:
	typedef PrintContext<T> ContextType;

	/**
	 * @brief Operation types.
	 */
	enum Operation {
		OPERATION_DEFAULT,       // 0
		OPERATION_NO_CHAR_SPACE, // 1
		OPERATION_CHAR_SPACE,    // 2
		OPERATION_NEXT_LINE,     // 3
		OPERATION_END_DRAW,      // 4
	};

public:
	TagProcessorBase();

	virtual ~TagProcessorBase();                                        // _08
	virtual Operation Process(u16 ch, ContextType* pCtx);               // _0C
	virtual Operation CalcRect(Rect* pRect, u16 ch, ContextType* pCtx); // _10

private:
	void ProcessTab(ContextType* pCtx);
	void ProcessLinefeed(ContextType* pCtx);
};

////////////////////////////////////////////////////////

} // namespace ut
} // namespace nw4r

#endif
