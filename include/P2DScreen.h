#ifndef _P2DSCREEN_H
#define _P2DSCREEN_H

#include "CNode.h"
#include "JSystem/J2D/J2DPicture.h"
#include "Vector2.h"
#include "types.h"

struct Graphics;

namespace P2DScreen {
struct Node : public CNode {
	Node()
	    : mPane(nullptr)
	{
	}

	virtual ~Node() { }                                           // _08 (weak)
	virtual void update() { }                                     // _10 (weak)
	virtual void draw(Graphics& gfx, J2DGrafContext& context) { } // _14 (weak)
	virtual void doInit() { }                                     // _18 (weak)

	// _00     = VTBL
	// _00-_18 = CNode
	J2DPane* mPane; // _18
};

struct CallBackNode : public Node {
	CallBackNode() { }

	virtual ~CallBackNode() { } // _08 (weak)
	virtual void update() { }   // _10 (weak)

	// _00     = VTBL
	// _00-_1C = Node
};

// Size: 0x138
struct Mgr : public J2DScreen {
	Mgr();

	virtual ~Mgr() { }                                         // _08 (weak)
	virtual void update();                                     // _30
	virtual void draw(Graphics& gfx, J2DGrafContext& context); // _9C

	J2DPane* addCallBack(u64 tag, Node* node);
	void addCallBackPane(J2DPane* pane, Node* node);

	// _00      = VTBL
	// _00-_114 = J2DScreen
	Node mScreenNode; // _114
};

// Size: 0x148
struct Mgr_tuning : public Mgr {
	Mgr_tuning();

	virtual ~Mgr_tuning() { }                                  // _08 (weak)
	virtual void draw(Graphics& gfx, J2DGrafContext& context); // _9C

	static const f32 mstTuningScaleX;
	static const f32 mstTuningScaleY;
	static const f32 mstTuningTransX;
	static const f32 mstTuningTransY;

	inline void setXY(f32 x, f32 y)
	{
		mTranslationX = x + mstTuningTransX;
		mTranslationY = y + mstTuningTransY;
	}

	inline void scaleScreen(f32 scale)
	{
		mScreenScaleX = scale * mstTuningScaleX;
		mScreenScaleY = scale * mstTuningScaleY;
	}

	inline void setBlendInfo(J2DBlendInfo info, u64* tags)
	{
		J2DBlend blend(info);
		while (true) {
			if (!*tags) {
				return;
			}
			J2DPictureEx* pane = static_cast<J2DPictureEx*>(search(*(tags++)));
			if (pane) {
				pane->getMaterial()->mPeBlock.setBlend(blend);
			}
		}
	}

	// _00      = VTBL
	// _00-_130 = Mgr
	f32 mScreenScaleX; // _130
	f32 mScreenScaleY; // _134
	f32 mTranslationX; // _138
	f32 mTranslationY; // _13C
};
} // namespace P2DScreen

#endif
