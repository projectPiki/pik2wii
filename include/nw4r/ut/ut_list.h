#ifndef NW4R_UT_LIST_H
#define NW4R_UT_LIST_H

#include <nw4r/types_nw4r.h>

namespace nw4r {
namespace ut {

////////////////////// LIST TYPES //////////////////////

/**
 * @brief TODO
 *
 * @note Size: 0xC.
 */
struct List {
	void* headObject; // _00
	void* tailObject; // _04
	u16 numObjects;   // _08
	u16 offset;       // _0A
};

/**
 * @brief TODO
 *
 * @note Size: 0x8.
 */
struct Link {
	void* prevObject; // _00
	void* nextObject; // _04
};

////////////////////////////////////////////////////////
/////////////////// GLOBAL FUNCTIONS ///////////////////

void List_Init(List* pList, u16 offset);

void List_Append(List* pList, void* pObject);
void List_Remove(List* pList, void* pObject);

void* List_GetNext(const List* pList, const void* pObject);

// not found in this version/stripped:
// void List_Prepend(List* pList, void* pObject);
// void List_Insert(List* pList, void* pTarget, void* pObject);
// void* List_GetPrev(const List* pList, const void* pObject);
// void* List_GetNth(const List* pList, u16 n);

////////////////////////////////////////////////////////
/////////////////// INLINE FUNCTIONS ///////////////////

inline const void* List_GetNextConst(const List* pList, const void* pObject)
{
	return List_GetNext(pList, pObject);
}

inline void* List_GetFirst(const List* pList)
{
	return List_GetNext(pList, nullptr);
}

inline const void* List_GetFirstConst(const List* pList)
{
	return List_GetFirst(pList);
}

inline u16 List_GetSize(const List* pList)
{
	return pList->numObjects;
}

// not found in this version/stripped:
// inline const void* List_GetPrevConst(const List* pList, const void* pObject)
// {
// 	return List_GetPrev(pList, pObject);
// }
// inline const void* List_GetNthConst(const List* pList, u16 n)
// {
// 	return List_GetNth(pList, n);
// }
// inline void* List_GetLast(const List* pList)
// {
// 	return List_GetPrev(pList, nullptr);
// }
// inline const void* List_GetLastConst(const List* pList)
// {
// 	return List_GetLast(pList);
// }

////////////////////////////////////////////////////////
//////////////////////// MACROS ////////////////////////
// declare member Link
#define NW4R_UT_LIST_LINK_DECL() nw4r::ut::Link link

// initialise List object for specified type T
#define NW4R_UT_LIST_INIT(LIST, T) nw4r::ut::List_Init(&(LIST), offsetof(T, link))

// get underlying Link within specified object Obj
#define NW4R_UT_LIST_GET_LINK(LIST, OBJ) reinterpret_cast<nw4r::ut::Link*>((u8*)(OBJ) + (LIST).offset)

// List for-each
#define NW4R_UT_LIST_FOREACH(TYPE, NAME, LIST, ...)                                             \
	{                                                                                           \
		TYPE* NAME = nullptr;                                                                   \
                                                                                                \
		while ((NAME = static_cast<TYPE*>(nw4r::ut::List_GetNext(&(LIST), NAME))) != nullptr) { \
                                                                                                \
			__VA_ARGS__;                                                                        \
		}                                                                                       \
	}

// List for-each (reverse order)
#define NW4R_UT_LIST_FOREACH_REV(TYPE, NAME, LIST, ...)                                         \
	{                                                                                           \
		TYPE* NAME = nullptr;                                                                   \
                                                                                                \
		while ((NAME = static_cast<TYPE*>(nw4r::ut::List_GetPrev(&(LIST), NAME))) != nullptr) { \
                                                                                                \
			__VA_ARGS__;                                                                        \
		}                                                                                       \
	}

// List for-each (robust with pre-grabbed NEXT before loop)
#define NW4R_UT_LIST_FOREACH_SAFE(TYPE, NAME, LIST, ...)                                                      \
	{                                                                                                         \
		TYPE* NAME;                                                                                           \
		TYPE* __next__;                                                                                       \
                                                                                                              \
		for (NAME = static_cast<TYPE*>(nw4r::ut::List_GetFirst(&(LIST))); NAME != nullptr; NAME = __next__) { \
                                                                                                              \
			__next__ = static_cast<TYPE*>(nw4r::ut::List_GetNext(&(LIST), NAME));                             \
                                                                                                              \
			__VA_ARGS__;                                                                                      \
		}                                                                                                     \
	}

////////////////////////////////////////////////////////

} // namespace ut
} // namespace nw4r

#endif
