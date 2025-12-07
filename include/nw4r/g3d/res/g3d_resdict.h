#ifndef NW4R_G3D_RES_RESDICT_H
#define NW4R_G3D_RES_RESDICT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
////////////////// RESOURCE DICTIONARY /////////////////
////////////////////////////////////////////////////////

/**
 * @brief Basic dictionary entry for resources.
 *
 * @note Size: 0x10.
 */
struct ResDicNodeData {
	u16 ref;       // _00
	u16 flag;      // _02
	u16 idxLeft;   // _04
	u16 idxRight;  // _06
	s32 ofsString; // _08
	s32 ofsData;   // _0C
};

/**
 * @brief Data for a dictionary.
 *
 * @note Size: 0x18.
 */
struct ResDicData {
	u32 size;               // _00
	u32 numData;            // _04
	ResDicNodeData data[1]; // _08
};

/**
 * @brief Data wrapper for a resource dictionary.
 *
 * @note Size: 0x4.
 */
class ResDic : public ResCommon<ResDicData> {
public:
	static const s32 NOT_FOUND = -1;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResDic);

	void* operator[](const char* pName) const;
	void* operator[](const ResName name) const;
	void* operator[](int idx) const
	{
		if (IsValid()) {
			return const_cast<void*>(ofs_to_ptr<void>(ref().data[idx + 1].ofsData));
		}

		return nullptr;
	}

	s32 GetIndex(const ResName name) const;

	u32 GetNumData() const
	{
		if (IsValid()) {
			return ptr()->numData;
		}

		return 0;
	}

private:
	ResDicNodeData* Get(const ResName name) const;
	ResDicNodeData* Get(const char* pName, u32 len) const;

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
