#include <nw4r/ut/ut_list.h>

namespace nw4r {
namespace ut {

/**
 * @brief TODO
 *
 */
void List_Init(List* pList, u16 offset)
{
	pList->headObject = nullptr;
	pList->tailObject = nullptr;
	pList->numObjects = 0;
	pList->offset     = offset;
}

/**
 * @brief TODO
 *
 */
static void SetFirstObject(List* pList, void* pObject)
{
	Link* pLink       = NW4R_UT_LIST_GET_LINK(*pList, pObject);
	pLink->nextObject = nullptr;
	pLink->prevObject = nullptr;

	pList->headObject = pObject;
	pList->tailObject = pObject;
	pList->numObjects++;
}

/**
 * @brief TODO
 *
 */
void List_Append(List* pList, void* pObject)
{
	if (pList->headObject == nullptr) {
		SetFirstObject(pList, pObject);
		return;
	}

	// Old tail <- New tail relationship
	Link* pLink       = NW4R_UT_LIST_GET_LINK(*pList, pObject);
	pLink->prevObject = pList->tailObject;
	pLink->nextObject = nullptr;

	// Old tail -> New tail relationship
	NW4R_UT_LIST_GET_LINK(*pList, pList->tailObject)->nextObject = pObject;
	pList->tailObject                                            = pObject;

	pList->numObjects++;
}

/**
 * @brief TODO
 *
 */
void List_Remove(List* pList, void* pObject)
{
	Link* pLink = NW4R_UT_LIST_GET_LINK(*pList, pObject);

	// Fix previous node relationship
	if (pLink->prevObject == nullptr) {
		pList->headObject = NW4R_UT_LIST_GET_LINK(*pList, pObject)->nextObject;
	} else {
		NW4R_UT_LIST_GET_LINK(*pList, pLink->prevObject)->nextObject = pLink->nextObject;
	}

	// Fix next node relationship
	if (pLink->nextObject == nullptr) {
		pList->tailObject = pLink->prevObject;
	} else {
		NW4R_UT_LIST_GET_LINK(*pList, pLink->nextObject)->prevObject = pLink->prevObject;
	}

	pLink->prevObject = nullptr;
	pLink->nextObject = nullptr;

	pList->numObjects--;
}

/**
 * @brief TODO
 *
 */
void* List_GetNext(const List* pList, const void* pObject)
{
	if (pObject == nullptr) {
		return pList->headObject;
	}

	return NW4R_UT_LIST_GET_LINK(*pList, pObject)->nextObject;
}

} // namespace ut
} // namespace nw4r
