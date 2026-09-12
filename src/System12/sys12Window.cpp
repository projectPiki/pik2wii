#include "RevoSDK/os.h"
#include "System12/System.h"
#include "System12/Window.h"
#include "egg/core/eggAllocator.h"
#include "egg/core/eggThread.h"
#include "egg/prim/eggAssert.h"

namespace System12 {

Window::Window()
    : _08(_0C)
    , _0C(_04)
    , _04(nullptr)
    , _10(nullptr)
{
	_00 = nullptr;
	_48 = nullptr;
	_44 = nullptr;
	mViewport.set(0, 0, 0, 0);
}

void Window::setG3DCamera(nw4r::g3d::Camera& cam)
{
	mViewport.setG3DCamera(cam);
	cam.SetScissorBoxOffset(_44, _48);
}

void Window::getPosSizeInEFB(EGG::Vector2f& vec, f32& f1, f32& f2)
{
	f32 mult = 1.0f;
	vec.x / EGG_INSTANCE(System)->mInitializeArg.mScreenX;
	vec.y / EGG_INSTANCE(System)->mInitializeArg.mScreenY;
	getGlobalPos(vec);
	vec.x = vec.x * mult;
	vec.y = vec.y * mult;
	f1    = getSizeX() * mult;
	f2    = getSizeY() * mult;
}

void Window::getGlobalPos(EGG::Vector2f& vec)
{
	if (!_00) {
		vec = _18;
		return;
	}
	vec = _18;
}

} // namespace System12
