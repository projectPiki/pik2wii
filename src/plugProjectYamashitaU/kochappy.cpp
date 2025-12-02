#include "Game/Entities/Kochappy.h"

namespace Game {
namespace Kochappy {

/**
 * @note Address: 0x8010F31C
 * @note Size: 0x130
 */
Obj::Obj()
{
	mAnimator = new KochappyBase::ProperAnimator;
	setFSM(new KochappyBase::FSM);
}

/**
 * @note Address: 0x8010F59C
 * @note Size: 0x1A4
 */
void Obj::changeMaterial()
{
	J3DModelData* modelData;
	J3DModel* j3dModel = mModel->getJ3DModel();
	modelData          = j3dModel->getModelData();
	ResTIMG* texture   = C_MGR->getChangeTexture();

	j3dModel->calcMaterial();

	J3DTexture* j3dTexture = mModel->getJ3DModel()->getModelData()->getTexture();
	ResTIMG* newTexture    = mModel->getJ3DModel()->getModelData()->getTexture()->getResTIMG(0);

	*newTexture = *texture;

	j3dTexture->setImageOffset((u32)texture, 0);
	j3dTexture->setPaletteOffset((u32)texture, 0);

	for (u16 i = 0; i < modelData->getMaterialTable().getMaterialNum(); i++) {
		J3DMatPacket* packet = j3dModel->getMatPacket(i);
		j3dSys.setMatPacket(packet);
		J3DMaterial* material = modelData->getMaterialTable().getMaterialNodePointer(i);
		material->diff(packet->getShapePacket()->mDiffFlag);
	}
}

} // namespace Kochappy
} // namespace Game
