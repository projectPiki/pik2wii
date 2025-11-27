#include <nw4r/ut/ut_LinkList.h>

namespace nw4r {
namespace ut {
namespace detail {

/**
 * @brief TODO
 *
 */
LinkListImpl::~LinkListImpl()
{
	Clear();
}

/**
 * @brief TODO
 *
 */
LinkListImpl::Iterator LinkListImpl::Erase(LinkListImpl::Iterator it)
{
	Iterator clone(it);
	return Erase(it, ++clone);
}

/**
 * @brief TODO
 *
 */
void LinkListImpl::Clear()
{
	Erase(GetBeginIter(), GetEndIter());
}

/**
 * @brief TODO
 *
 */
LinkListImpl::Iterator LinkListImpl::Insert(Iterator it, LinkListNode* pNode)
{
	LinkListNode* pNext = it.mNode;
	LinkListNode* pPrev = pNext->mPrev;

	// pPrev <- pNode -> pNext
	pNode->mNext = pNext;
	pNode->mPrev = pPrev;

	// pPrev <-> pNode <-> pNext
	pNext->mPrev = pNode;
	pPrev->mNext = pNode;

	mSize++;

	return Iterator(pNode);
}

/**
 * @brief TODO
 *
 */
LinkListImpl::Iterator LinkListImpl::Erase(LinkListNode* pNode)
{
	LinkListNode* pNext = pNode->mNext;
	LinkListNode* pPrev = pNode->mPrev;

	// Remove connections to node
	pNext->mPrev = pPrev;
	pPrev->mNext = pNext;

	mSize--;

	// Isolate node
	pNode->mNext = nullptr;
	pNode->mPrev = nullptr;

	return Iterator(pNext);
}

/**
 * @brief TODO
 *
 */
LinkListImpl::Iterator LinkListImpl::Erase(Iterator begin, Iterator end)
{
	LinkListNode* pIt  = begin.mNode;
	LinkListNode* pEnd = end.mNode;

	while (pIt != pEnd) {
		// Preserve next node before erasing pointers
		LinkListNode* pNext = pIt->mNext;

		// Erase current node
		Erase(pIt);
		pIt = pNext;
	}

	return Iterator(pEnd);
}

} // namespace detail
} // namespace ut
} // namespace nw4r
