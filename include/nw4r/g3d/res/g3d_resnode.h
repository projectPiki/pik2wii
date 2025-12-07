#ifndef NW4R_G3D_RES_RESNODE_H
#define NW4R_G3D_RES_RESNODE_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>

#include <nw4r/math.h>

namespace nw4r {
namespace g3d {

// Forward declarations
struct ChrAnmResult;

////////////////////////////////////////////////////////
///////////////////// COMMON TYPES /////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Base class for resource nodes (just billboard types).
 *
 * @note Size: 0x0.
 */
struct ResNodeDataTypedef {

	/**
	 * @brief Billboard modes for resource nodes.
	 */
	enum Billboard {
		BILLBOARD_OFF,       // 0
		BILLBOARD_STD,       // 1
		BILLBOARD_PERSP_STD, // 2
		BILLBOARD_ROT,       // 3
		BILLBOARD_PERSP_ROT, // 4
		BILLBOARD_Y_OFF,     // 5
		BILLBOARD_PERSP_Y,   // 6

		NUM_BILLBOARD, // 7
	};
};

////////////////////////////////////////////////////////
///////////////////////// NODES ////////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Class for node data.
 *
 * @note Size: 0xD0.
 */
struct ResNodeData : public ResNodeDataTypedef {

	/**
	 * @brief Flags for various node info (scaling, rotation, etc).
	 */
	enum Flag {
		FLAG_IDENTITY      = (1 << 0),
		FLAG_TRANS_ZERO    = (1 << 1),
		FLAG_ROT_ZERO      = (1 << 2),
		FLAG_SCALE_ONE     = (1 << 3),
		FLAG_SCALE_UNIFORM = (1 << 4),

		// Maya Scale Compensation
		FLAG_SSC_APPLY  = (1 << 5),
		FLAG_SSC_PARENT = (1 << 6),

		// Softimage Hierarchical Scaling
		FLAG_XSI_SCALING = (1 << 7),

		FLAG_VISIBLE          = (1 << 8),
		FLAG_GEOMETRY         = (1 << 9),
		FLAG_BILLBOARD_PARENT = (1 << 10)
	};

	// _00-_00 = ResNodeDataTypedef
	u32 size;                 // _00
	s32 toResMdlData;         // _04
	s32 name;                 // _08
	u32 id;                   // _0C
	u32 mtxID;                // _10
	u32 flags;                // _14
	Billboard bbmode;         // _18
	u32 bbref_nodeid;         // _1C
	math::_VEC3 scale;        // _20
	math::_VEC3 rot;          // _2C
	math::_VEC3 translate;    // _38
	math::_VEC3 volume_min;   // _44
	math::_VEC3 volume_max;   // _50
	s32 toParentNode;         // _5C
	s32 toChildNode;          // _60
	s32 toNextSibling;        // _64
	s32 toPrevSibling;        // _68
	s32 toResUserData;        // _6C
	math::_MTX34 modelMtx;    // _70
	math::_MTX34 invModelMtx; // _A0
};

/**
 * @brief Node-based resource object wrapper.
 *
 * @note Size: 0x4.
 */
class ResNode : public ResCommon<ResNodeData>, public ResNodeDataTypedef {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResNode);

	void PatchChrAnmResult(ChrAnmResult* pResult) const;
	void CalcChrAnmResult(ChrAnmResult* pResult) const;

	ResName GetResName() const
	{
		const ResNodeData& r = ref();

		if (r.name != 0) {
			return NW4R_G3D_OFS_TO_RESNAME(&r, r.name);
		}

		return ResName(nullptr);
	}

	u32 GetID() const
	{
		if (IsValid()) {
			return ptr()->id;
		}

		return 0;
	}

	u32 GetMtxID() const
	{
		if (IsValid()) {
			return ptr()->mtxID;
		}

		return 0;
	}

	bool IsVisible() const
	{
		if (IsValid()) {
			return ptr()->flags & ResNodeData::FLAG_VISIBLE;
		}

		return false;
	}

	void SetVisibility(bool visible)
	{
		if (!IsValid()) {
			return;
		}

		if (visible) {
			ptr()->flags |= ResNodeData::FLAG_VISIBLE;
		} else {
			ptr()->flags &= ~ResNodeData::FLAG_VISIBLE;
		}
	}

	Billboard GetBillboardMode() const
	{
		if (IsValid()) {
			return ptr()->bbmode;
		}

		return BILLBOARD_OFF;
	}

	const math::VEC3& GetTranslate() const { return ref().translate; }

	ResNode GetParentNode() { return ofs_to_obj<ResNode>(ref().toParentNode); }
	ResNode GetParentNode() const { return ofs_to_obj<ResNode>(ref().toParentNode); }

	ResNode GetChildNode() { return ofs_to_obj<ResNode>(ref().toChildNode); }
	ResNode GetChildNode() const { return ofs_to_obj<ResNode>(ref().toChildNode); }

	ResNode GetNextSibling() { return ofs_to_obj<ResNode>(ref().toNextSibling); }
	ResNode GetNextSibling() const { return ofs_to_obj<ResNode>(ref().toNextSibling); }

	ResNode GetPrevSibling() { return ofs_to_obj<ResNode>(ref().toPrevSibling); }
	ResNode GetPrevSibling() const { return ofs_to_obj<ResNode>(ref().toPrevSibling); }

	void EndEdit() { }

	// _00-_04 = ResCommon
	// _04-_04 = ResNodeDataTypedef
};

} // namespace g3d
} // namespace nw4r

#endif
