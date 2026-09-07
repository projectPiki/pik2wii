#include "System12/Renderer.h"

namespace System12 {

EGG_SINGLETON_IMPL(9, Renderer);

Renderer::Renderer()
{
}

void Renderer::init(Arg& arg)
{
	mArg = arg;
	mScene.construct(arg.mMaxScnObj, arg.mNumLightObj, arg.mHeap);
	mScene.getRoot()->SetCurrentCamera(0);
}

void Renderer::push_back(Model* model)
{
	mScene.getRoot()->PushBack(model->getModel());
}

void Renderer::calc()
{
	mScene.getRoot()->UpdateFrame();
	mScene.getRoot()->CalcWorld();
	mScene.getRoot()->CalcMaterial();
}

void Renderer::setup_draw()
{
	nw4r::g3d::Camera camera = mScene.getRoot()->GetCurrentCamera();
	mArg.mWindow->setG3DCamera(camera);
	mArg.mProjection->setG3DCamera(camera);
	mArg.mCamera->setG3DCamera(camera);
}

void Renderer::draw()
{
	setup_draw();
	raw_draw();
}

void Renderer::raw_draw()
{
	nw4r::g3d::G3dReset();
	mScene.getRoot()->CalcView();
	mScene.getRoot()->GatherDrawScnObj();
	mScene.getRoot()->ZSort();
	mScene.getRoot()->DrawOpa();
	mScene.getRoot()->DrawXlu();
}
} // namespace System12
