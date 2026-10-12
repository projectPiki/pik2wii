#include "Game/Cave/RandMapMgr.h"
#include "RevoSDK/rand.h"

// TODO: fix this up
static void __Print(const char** fmt, ...)
{
	*fmt = "246-RandMapScore";
}

namespace Game {
namespace Cave {

/**
 * @note Address: 0x8024C878
 * @note Size: 0xA8
 */
RandMapScore::RandMapScore(MapUnitGenerator* generator)
{
	mGenerator       = generator;
	mVersusHighScore = 0;
	mVersusLowScore  = 0;
	mFixObjNodes     = new MapNode*[FIXNODE_Count];
	mFixObjGens      = new BaseGen*[FIXNODE_Count];

	for (int i = 0; i < FIXNODE_Count; i++) {
		mFixObjNodes[i] = nullptr;
		mFixObjGens[i]  = nullptr;
	}
}

/**
 * @note Address: 0x8024C920
 * @note Size: 0x6C
 */
void RandMapScore::setMapUnitScore()
{
	clearRoomAndDoorScore();
	if (!isScoreSetDone()) {
		for (int i = 0; i < 500; i++) {
			setUnitAndDoorScore();
			if (isScoreSetDone()) {
				return;
			}
		}
	}
}

/**
 * @note Address: 0x8024C98C
 * @note Size: 0x38
 */
void RandMapScore::setStartSlot()
{
	if (mGenerator->mIsVersusMode) {
		setVersusOnyon();
	} else {
		setChallengePod();
	}
}

/**
 * @note Address: 0x8024C9C4
 * @note Size: 0x58
 */
void RandMapScore::setGoalSlot()
{
	if (!mGenerator->mIsVersusMode) {
		if (isGoalSetHard()) {
			setChallengeFixObjHard();
		} else {
			setChallengeFixObjNormal();
		}
	}
}

/**
 * @note Address: 0x8024CA1C
 * @note Size: 0x18C
 */
void RandMapScore::makeObjectLayout(MapNode* mapNode, ObjectLayout* layout)
{
	for (int i = 0; i < FIXNODE_Count; i++) {
		if (mapNode == mFixObjNodes[i]) {
			int layoutTypes[FIXNODE_Count]
			    = { OBJLAYOUT_Pod, OBJLAYOUT_Hole, OBJLAYOUT_Fountain, OBJLAYOUT_VsBlueOnyon, OBJLAYOUT_VsRedOnyon };
			FixObjNode* rootObjNode  = new FixObjNode(layoutTypes[i]);
			FixObjNode* childObjNode = new FixObjNode(layoutTypes[i]);

			Vector3f globalPos       = mFixObjNodes[i]->getBaseGenGlobalPosition(mFixObjGens[i]);
			f32 dir                  = mFixObjNodes[i]->getBaseGenGlobalDirection(mFixObjGens[i]);
			childObjNode->mPosition  = globalPos;
			childObjNode->mDirection = dir;

			rootObjNode->add(childObjNode);
			layout->setNode(layoutTypes[i], rootObjNode);
		}
	}
}

/**
 * @note Address: 0x8024CBA8
 * @note Size: 0x10
 */
MapNode* RandMapScore::getFixObjNode(int idx)
{
	return mFixObjNodes[idx];
}

/**
 * @note Address: 0x8024CBB8
 * @note Size: 0x10
 */
BaseGen* RandMapScore::getFixObjGen(int idx)
{
	return mFixObjGens[idx];
}

/**
 * @note Address: 0x8024CBC8
 * @note Size: 0x64
 */
void RandMapScore::getGlobalPosition(int idx, Vector3f& position)
{
	MapNode* node = getFixObjNode(idx);
	if (node) {
		position = node->getBaseGenGlobalPosition(getFixObjGen(idx));
	}
}

/**
 * @note Address: 0x8024CC2C
 * @note Size: 0x8
 */
int RandMapScore::getVersusHighScore()
{
	return mVersusHighScore;
}

/**
 * @note Address: 0x8024CC34
 * @note Size: 0x8
 */
int RandMapScore::getVersusLowScore()
{
	return mVersusLowScore;
}

/**
 * @note Address: 0x8024CC3C
 * @note Size: 0x84
 */
bool RandMapScore::isScoreSetDone()
{
	FOREACH_NODE(MapNode, mGenerator->getPlacedNodes()->mChild, currNode)
	{
		for (int i = 0; i < currNode->getNumDoors(); i++) {
			if (!currNode->isDoorScoreSetDone(i)) {
				return false;
			}
		}
	}

	return true;
}

/**
 * @note Address: 0x8024CCC0
 * @note Size: 0xC4
 */
void RandMapScore::clearRoomAndDoorScore()
{
	FOREACH_NODE(MapNode, mGenerator->getPlacedNodes()->mChild, currNode)
	{
		currNode->setEnemyScore();
		currNode->setNodeScore(-1);
		currNode->resetDoorScore();
	}

	if (mGenerator->mIsVersusMode) {
		// if in versus mode, start calculating map score from both red and blue onyons (if set)
		if (getFixObjNode(FIXNODE_VsRedOnyon)) {
			setStartMapNodeScore(getFixObjNode(FIXNODE_VsRedOnyon));
		}
		if (getFixObjNode(FIXNODE_VsBlueOnyon)) {
			setStartMapNodeScore(getFixObjNode(FIXNODE_VsBlueOnyon));
		}

	} else if (getFixObjNode(FIXNODE_Pod)) { // not versus mode, so start from pod/ship.
		setStartMapNodeScore(getFixObjNode(FIXNODE_Pod));
	}
}

/**
 * @note Address: 0x8024CD84
 * @note Size: 0x154
 */
void RandMapScore::setUnitAndDoorScore()
{
	MapNode* minScoreNode = nullptr;
	int minScoreDoor      = -1;
	int minScore          = 12800000;

	FOREACH_NODE(MapNode, mGenerator->getPlacedNodes()->mChild, currNode)
	{
		currNode->getNodeScore();
		int numDoors = currNode->getNumDoors();
		for (int i = 0; i < numDoors; i++) {
			if (!currNode->isDoorScoreSetDone(i)) {
				continue;
			}
			FOREACH_NODE(AdjustNode, currNode->getAdjustNode(i)->mChild, adjNode)
			{
				int doorID = adjNode->mAdjust->mDoorID;
				if (!currNode->isDoorScoreSetDone(doorID)) {
					int currScore = adjNode->mAdjust->mTekiFlags * currNode->getEnemyScore()
					              + (currNode->mAdjustInfo[i].mDoorScore + adjNode->mAdjust->mDistance) + currNode->getGateScore(doorID);
					if (minScore > currScore) {
						minScore     = currScore;
						minScoreNode = currNode;
						minScoreDoor = doorID;
					}
				}
			}
		}
	}

	if (minScoreNode) {
		minScoreNode->setDoorScore(minScoreDoor, minScore);
		MapNode* connectedNode = minScoreNode->getConnectedNode(minScoreDoor);
		setMapNodeScore(connectedNode, minScore);
	}
}

/**
 * @note Address: 0x8024CED8
 * @note Size: 0xB0
 */
void RandMapScore::setStartMapNodeScore(MapNode* mapNode)
{
	setMapNodeScore(mapNode, 0);
	for (int i = 0; i < mapNode->getNumDoors(); i++) {
		if (!mapNode->isDoorScoreSetDone(i)) {
			int score     = mapNode->getGateScore(i);
			int nodeScore = mapNode->getNodeScore();
			int doorScore = nodeScore + score + 1;
			mapNode->setDoorScore(i, doorScore);
			setMapNodeScore(mapNode->getConnectedNode(i), doorScore);
		}
	}
}

/**
 * @note Address: N/A
 * @note Size: 0xDC
 */
MapNode* RandMapScore::getRandRoomMapNode()
{
	int counter = 0;
	MapNode* mapList[16];
	FOREACH_NODE(MapNode, mGenerator->mPlacedMapNodes->mChild, currNode)
	{
		if (currNode->mUnitInfo->getUnitKind() == UNITKIND_Room) {
			mapList[counter] = currNode;
			counter++;
		}
	}

	MapNode* targetNode;
	if (counter) {
		return mapList[randInt(counter)];
	}

	return nullptr;
}

/**
 * @note Address: 0x8024CF88
 * @note Size: 0x13C
 */
void RandMapScore::setChallengePod()
{
	BaseGen* genList[16];
	if (!getFixObjNode(FIXNODE_Pod)) {
		int counter = 0;
		FOREACH_NODE(MapNode, mGenerator->mPlacedMapNodes->mChild, currNode)
		{
			if (currNode->mUnitInfo->getUnitKind() == UNITKIND_Room) {
				mFixObjNodes[FIXNODE_Pod] = currNode;
				break;
			}
		}

		if (getFixObjNode(FIXNODE_Pod)) {
			BaseGen* gen = getFixObjNode(FIXNODE_Pod)->mUnitInfo->getBaseGen();
			if (gen) {

				FOREACH_NODE(BaseGen, gen->mChild, currGen)
				{
					if (currGen->mSpawnType == BaseGen::CGT_Start) {
						genList[counter] = currGen;
						counter++;
					}
				}
			}

			if (counter) {
				int randIdx              = randInt(counter);
				mFixObjGens[FIXNODE_Pod] = genList[randIdx];
			}
		}
	}
}

/**
 * @note Address: 0x8024D0C4
 * @note Size: 0x1B8
 */
void RandMapScore::setVersusOnyon()
{

	if (!getFixObjNode(FIXNODE_VsRedOnyon) && !getFixObjNode(FIXNODE_VsBlueOnyon)) {
		MapNode* targetNode    = getRandRoomMapNode();
		MapNode* onyonNodes[2] = { nullptr, nullptr };
		BaseGen* onyonGens[2]  = { nullptr, nullptr };

		if (targetNode) {
			calcNodeScore(targetNode);

			onyonNodes[0] = getMaxScoreRoomMapNode(targetNode, &onyonGens[0]);
			calcNodeScore(onyonNodes[0]);

			copyNodeScore();

			onyonNodes[1] = getMaxScoreRoomMapNode(onyonNodes[0], &onyonGens[1]);
			calcNodeScore(onyonNodes[1]);

			mFixObjNodes[FIXNODE_VsRedOnyon]  = onyonNodes[0];
			mFixObjNodes[FIXNODE_VsBlueOnyon] = onyonNodes[1];

			mFixObjGens[FIXNODE_VsRedOnyon]  = onyonGens[0];
			mFixObjGens[FIXNODE_VsBlueOnyon] = onyonGens[1];

			subNodeScore();
		}
	}
}

/**
 * @note Address: 0x8024D27C
 * @note Size: 0xFC
 */
MapNode* RandMapScore::getMaxScoreRoomMapNode(MapNode* mapNode, BaseGen** maxScoreGen)
{
	MapNode* maxScoreNode = nullptr;
	int maxScore          = 0;
	FOREACH_NODE(MapNode, mGenerator->mPlacedMapNodes->mChild, currNode)
	{
		if (currNode != mapNode && currNode->mUnitInfo->getUnitKind() == UNITKIND_Room) {
			int nodeScore = currNode->getNodeScore() + 10;
			BaseGen* gen  = currNode->mUnitInfo->getBaseGen();
			if (gen) {
				FOREACH_NODE(BaseGen, gen->mChild, currGen)
				{
					if (currGen->mSpawnType == BaseGen::CGT_Start) {
						if (nodeScore > maxScore || (nodeScore == maxScore && randWeightFloat(1.0f) < 0.5f)) {
							*maxScoreGen = currGen;
							maxScoreNode = currNode;
							maxScore     = nodeScore;
						}
					}
				}
			}
		}
	}

	return maxScoreNode;
}

/**
 * @note Address: 0x8024D378
 * @note Size: 0x3B0
 */
void RandMapScore::calcNodeScore(MapNode* mapNode)
{
	clearRoomAndDoorScore();
	setStartMapNodeScore(mapNode);
	if (!isScoreSetDone()) {
		for (int i = 0; i < 500; i++) {
			setUnitAndDoorScore();
			if (isScoreSetDone()) {
				return;
			}
		}
	}
}

/**
 * @note Address: 0x8024D728
 * @note Size: 0x48
 */
void RandMapScore::copyNodeScore()
{
	FOREACH_NODE(MapNode, mGenerator->mPlacedMapNodes->mChild, currNode)
	{
		currNode->copyNodeScoreToVersusScore();
	}
}

/**
 * @note Address: 0x8024D770
 * @note Size: 0x8C
 */
void RandMapScore::subNodeScore()
{
	FOREACH_NODE(MapNode, mGenerator->mPlacedMapNodes->mChild, currNode)
	{
		currNode->subNodeScoreToVersusScore();
		if (currNode == getFixObjNode(FIXNODE_VsRedOnyon)) {
			mVersusLowScore = currNode->getVersusScore();
		} else if (currNode == getFixObjNode(FIXNODE_VsBlueOnyon)) {
			mVersusHighScore = currNode->getVersusScore();
		}
	}
}

/**
 * @note Address: 0x8024D7FC
 * @note Size: 0x64
 */
void RandMapScore::setMapNodeScore(MapNode* mapNode, int score)
{
	score += mapNode->getEnemyScore();
	int nodeScore = mapNode->getNodeScore();
	if (nodeScore < 0 || nodeScore > score) {
		mapNode->setNodeScore(score);
	}
}

/**
 * @note Address: 0x8024D860
 * @note Size: 0x3BC
 */
void RandMapScore::setChallengeFixObjNormal()
{
	if (getFixObjNode(FIXNODE_Hole) || getFixObjNode(FIXNODE_Fountain)) {
		return;
	}

	MapNode* placedNodes = mGenerator->getPlacedNodes();
	int fixObjIdx[2]     = { FIXNODE_Hole, FIXNODE_Fountain };

	// include hole and geyser by default
	bool fixObjEnabled[2] = { true, true };

	if (mGenerator->mIsFinalFloor) {
		// disable hole on the final floor
		fixObjEnabled[0] = false;
	} else if (!mGenerator->mHasEscapeFountain) {
		// disable geyser if one is not enabled (and this is not the final floor)
		fixObjEnabled[1] = false;
	}

	for (int i = 0; i < 2; i++) {
		if (fixObjEnabled[i] && !getFixObjNode(fixObjIdx[i])) {
			MapNode* mapList[512];
			BaseGen* genList[512];
			int scoreList[512];

			int roomTypes[UNITKIND_Count] = { UNITKIND_Room, UNITKIND_Cap, UNITKIND_Corridor };
			int counter                   = 0;
			int tally                     = 0;
			mapList[0]                    = nullptr;
			// loop over room types
			for (int j = 0; j < UNITKIND_Count; j++) {
				if (!mapList[0] || j < 2) {
					FOREACH_NODE(MapNode, placedNodes->mChild, currNode)
					{
						if (roomTypes[j] == currNode->mUnitInfo->getUnitKind()) {
							f32 val;
							if (currNode->getNodeScore() > 0) {
								val = currNode->getNodeScore();
								val = sqrtf(val);
							} else {
								val = 0.0f;
							}

							int score = (int)val + 10;

							if (roomTypes[j] == UNITKIND_Room) {
								BaseGen* gen = currNode->mUnitInfo->getBaseGen();
								if (gen) {
									FOREACH_NODE(BaseGen, gen->mChild, currGen)
									{
										if (currGen->mSpawnType == BaseGen::CGT_HoleOrGeyser && isFixObjSet(currNode, currGen)) {
											mapList[counter] = currNode;
											genList[counter] = currGen;
											scoreList[counter] = score;
											tally += scoreList[counter];
											counter++;
										}
									}
								}

							} else if (roomTypes[j] == UNITKIND_Cap) {
								if (IS_SAME_STRING_PREFIX(currNode->getUnitName(), "item") && isFixObjSet(currNode, nullptr)) {
									mapList[counter] = currNode;
									genList[counter] = nullptr;
									scoreList[counter] = score;
									tally += scoreList[counter];
									counter++;
								}
							} else if (isFixObjSet(currNode, nullptr)) {
								mapList[counter] = currNode;
								genList[counter] = nullptr;
								scoreList[counter] = score;
								tally += scoreList[counter];
								counter++;
							}
						}
					}
				}
			}

			if (tally) {
				int randIdx  = randInt(tally);
				int newTally = 0;
				for (int k = 0; k < counter; k++) {
					newTally += scoreList[k];
					if (newTally > randIdx) {
						mFixObjNodes[fixObjIdx[i]] = mapList[k];
						mFixObjGens[fixObjIdx[i]]  = genList[k];
						break;
					}
				}
			}
		}
	}
	/*
	stwu     r1, -0x1880(r1)
	mflr     r0
	stw      r0, 0x1884(r1)
	stmw     r16, 0x1840(r1)
	mr       r17, r3
	lwz      r3, 4(r3)
	lwz      r0, 4(r3)
	cmplwi   r0, 0
	bne      lbl_8024DC08
	lwz      r0, 8(r3)
	cmplwi   r0, 0
	beq      lbl_8024D894
	b        lbl_8024DC08

lbl_8024D894:
	lwz      r6, 0(r17)
	lwz      r5, lbl_8051A810@sda21(r2)
	lbz      r0, 0(r6)
	lwz      r4, lbl_8051A814@sda21(r2)
	lhz      r3, lbl_8051A818@sda21(r2)
	cmplwi   r0, 0
	stw      r5, 0xc(r1)
	lwz      r31, 0x28(r6)
	stw      r4, 0x10(r1)
	sth      r3, 8(r1)
	beq      lbl_8024D8CC
	li       r0, 0
	stb      r0, 8(r1)
	b        lbl_8024D8E0

lbl_8024D8CC:
	lbz      r0, 1(r6)
	cmplwi   r0, 0
	bne      lbl_8024D8E0
	li       r0, 0
	stb      r0, 9(r1)

lbl_8024D8E0:
	addi     r26, r1, 8
	addi     r25, r1, 0xc
	li       r24, 0

lbl_8024D8EC:
	lbz      r0, 0(r26)
	cmplwi   r0, 0
	beq      lbl_8024DBF4
	lwz      r0, 0(r25)
	lwz      r3, 4(r17)
	slwi     r0, r0, 2
	lwzx     r0, r3, r0
	cmplwi   r0, 0
	bne      lbl_8024DBF4
	lis      r3, lbl_8048410C@ha
	li       r16, 0
	addi     r5, r3, lbl_8048410C@l
	stw      r16, 0x1020(r1)
	lwz      r4, 0(r5)
	addi     r27, r1, 0x14
	lwz      r3, 4(r5)
	li       r23, 0
	lwz      r0, 8(r5)
	li       r22, 0
	stw      r4, 0x14(r1)
	li       r21, 0
	stw      r3, 0x18(r1)
	stw      r0, 0x1c(r1)

lbl_8024D948:
	lwz      r0, 0x1020(r1)
	cmplwi   r0, 0
	beq      lbl_8024D95C
	cmpwi    r21, 2
	bge      lbl_8024DB2C

lbl_8024D95C:
	lwz      r20, 0x10(r31)
	b        lbl_8024DB24

lbl_8024D964:
	lwz      r3, 0x18(r20)
	bl       getUnitKind__Q34Game4Cave8UnitInfoFv
	lwz      r0, 0(r27)
	cmpw     r0, r3
	bne      lbl_8024DB20
	mr       r3, r20
	bl       getNodeScore__Q34Game4Cave7MapNodeFv
	cmpwi    r3, 0
	ble      lbl_8024D9C4
	mr       r3, r20
	bl       getNodeScore__Q34Game4Cave7MapNodeFv
	xoris    r3, r3, 0x8000
	lis      r0, 0x4330
	stw      r3, 0x1824(r1)
	lfd      f2, lbl_8051A800@sda21(r2)
	stw      r0, 0x1820(r1)
	lfs      f0, lbl_8051A81C@sda21(r2)
	lfd      f1, 0x1820(r1)
	fsubs    f1, f1, f2
	fcmpo    cr0, f1, f0
	ble      lbl_8024D9C8
	frsqrte  f0, f1
	fmuls    f1, f0, f1
	b        lbl_8024D9C8

lbl_8024D9C4:
	lfs      f1, lbl_8051A81C@sda21(r2)

lbl_8024D9C8:
	fctiwz   f0, f1
	lwz      r0, 0(r27)
	cmpwi    r0, 1
	stfd     f0, 0x1820(r1)
	lwz      r3, 0x1824(r1)
	addi     r19, r3, 0xa
	bne      lbl_8024DA70
	lwz      r3, 0x18(r20)
	bl       getBaseGen__Q34Game4Cave8UnitInfoFv
	cmplwi   r3, 0
	beq      lbl_8024DB20
	addi     r30, r1, 0x1020
	addi     r29, r1, 0x820
	addi     r28, r1, 0x20
	lwz      r18, 0x10(r3)
	add      r30, r30, r16
	add      r29, r29, r16
	add      r28, r28, r16
	b        lbl_8024DA64

lbl_8024DA14:
	lwz      r0, 0x18(r18)
	cmpwi    r0, 4
	bne      lbl_8024DA60
	mr       r3, r17
	mr       r4, r20
	mr       r5, r18
	bl
isFixObjSet__Q34Game4Cave12RandMapScoreFPQ34Game4Cave7MapNodePQ34Game4Cave7BaseGen
	clrlwi.  r0, r3, 0x18
	beq      lbl_8024DA60
	stw      r19, 0(r28)
	addi     r23, r23, 1
	addi     r16, r16, 4
	lwz      r0, 0(r28)
	addi     r28, r28, 4
	stw      r20, 0(r30)
	addi     r30, r30, 4
	add      r22, r22, r0
	stw      r18, 0(r29)
	addi     r29, r29, 4

lbl_8024DA60:
	lwz      r18, 4(r18)

lbl_8024DA64:
	cmplwi   r18, 0
	bne      lbl_8024DA14
	b        lbl_8024DB20

lbl_8024DA70:
	cmpwi    r0, 0
	bne      lbl_8024DADC
	mr       r3, r20
	bl       getUnitName__Q34Game4Cave7MapNodeFv
	addi     r4, r2, lbl_8051A820@sda21
	li       r5, 4
	bl       strncmp
	cmpwi    r3, 0
	bne      lbl_8024DB20
	mr       r3, r17
	mr       r4, r20
	li       r5, 0
	bl
isFixObjSet__Q34Game4Cave12RandMapScoreFPQ34Game4Cave7MapNodePQ34Game4Cave7BaseGen
	clrlwi.  r0, r3, 0x18
	beq      lbl_8024DB20
	addi     r6, r1, 0x20
	addi     r5, r1, 0x1020
	stwx     r19, r6, r16
	addi     r3, r1, 0x820
	li       r4, 0
	addi     r23, r23, 1
	lwzx     r0, r6, r16
	stwx     r20, r5, r16
	add      r22, r22, r0
	stwx     r4, r3, r16
	addi     r16, r16, 4
	b        lbl_8024DB20

lbl_8024DADC:
	mr       r3, r17
	mr       r4, r20
	li       r5, 0
	bl
isFixObjSet__Q34Game4Cave12RandMapScoreFPQ34Game4Cave7MapNodePQ34Game4Cave7BaseGen
	clrlwi.  r0, r3, 0x18
	beq      lbl_8024DB20
	addi     r6, r1, 0x20
	addi     r5, r1, 0x1020
	stwx     r19, r6, r16
	addi     r3, r1, 0x820
	li       r4, 0
	addi     r23, r23, 1
	lwzx     r0, r6, r16
	stwx     r20, r5, r16
	add      r22, r22, r0
	stwx     r4, r3, r16
	addi     r16, r16, 4

lbl_8024DB20:
	lwz      r20, 4(r20)

lbl_8024DB24:
	cmplwi   r20, 0
	bne      lbl_8024D964

lbl_8024DB2C:
	addi     r21, r21, 1
	addi     r27, r27, 4
	cmpwi    r21, 3
	blt      lbl_8024D948
	cmpwi    r22, 0
	beq      lbl_8024DBF4
	bl       rand
	lis      r4, 0x4330
	xoris    r0, r3, 0x8000
	stw      r0, 0x1824(r1)
	xoris    r0, r22, 0x8000
	lfd      f2, lbl_8051A800@sda21(r2)
	addi     r5, r1, 0x20
	stw      r4, 0x1820(r1)
	li       r6, 0
	lfs      f0, lbl_8051A7F8@sda21(r2)
	li       r7, 0
	lfd      f1, 0x1820(r1)
	stw      r0, 0x182c(r1)
	fsubs    f1, f1, f2
	stw      r4, 0x1828(r1)
	fdivs    f1, f1, f0
	lfd      f0, 0x1828(r1)
	fsubs    f0, f0, f2
	fmuls    f0, f0, f1
	fctiwz   f0, f0
	stfd     f0, 0x1830(r1)
	lwz      r3, 0x1834(r1)
	mtctr    r23
	cmpwi    r23, 0
	ble      lbl_8024DBF4

lbl_8024DBA8:
	lwz      r0, 0(r5)
	add      r6, r6, r0
	cmpw     r6, r3
	ble      lbl_8024DBE8
	lwz      r0, 0(r25)
	slwi     r7, r7, 2
	addi     r3, r1, 0x1020
	lwz      r5, 4(r17)
	lwzx     r6, r3, r7
	slwi     r4, r0, 2
	addi     r3, r1, 0x820
	stwx     r6, r5, r4
	lwzx     r0, r3, r7
	lwz      r3, 8(r17)
	stwx     r0, r3, r4
	b        lbl_8024DBF4

lbl_8024DBE8:
	addi     r5, r5, 4
	addi     r7, r7, 1
	bdnz     lbl_8024DBA8

lbl_8024DBF4:
	addi     r24, r24, 1
	addi     r25, r25, 4
	cmpwi    r24, 2
	addi     r26, r26, 1
	blt      lbl_8024D8EC

lbl_8024DC08:
	lmw      r16, 0x1840(r1)
	lwz      r0, 0x1884(r1)
	mtlr     r0
	addi     r1, r1, 0x1880
	blr
	*/
}

/**
 * @note Address: 0x8024DC1C
 * @note Size: 0x324
 */
void RandMapScore::setChallengeFixObjHard()
{
	if (getFixObjNode(FIXNODE_Hole) || getFixObjNode(FIXNODE_Fountain)) {
		return;
	}

	MapNode* placedNodes = mGenerator->getPlacedNodes();
	int fixObjIdx[2]     = { FIXNODE_Hole, FIXNODE_Fountain };

	bool fixObjEnabled[2] = { true, true };
	if (mGenerator->mIsFinalFloor) {
		fixObjEnabled[0] = false;
	} else if (!mGenerator->mHasEscapeFountain) {
		fixObjEnabled[1] = false;
	}

	for (int i = 0; i < 2; i++) {
		if (fixObjEnabled[i] && !getFixObjNode(fixObjIdx[i])) {
			MapNode* mapList[512];
			BaseGen* genList[512];
			// int scoreList[512];

			int roomTypes[UNITKIND_Count] = { UNITKIND_Room, UNITKIND_Cap, UNITKIND_Corridor };
			int counter                   = 0;
			mapList[0]                    = nullptr;
			int maxScore                  = -1;
			// loop over room types
			for (int j = 0; j < UNITKIND_Count; j++) {
				if (!mapList[0] || j < 2) {
					for (CNode* node = placedNodes->mChild; node; node = node->mNext) {
						MapNode* currNode = static_cast<MapNode*>(node);
						if (roomTypes[j] == currNode->mUnitInfo->getUnitKind()) {
							int score = currNode->getNodeScore();

							if (roomTypes[j] == UNITKIND_Room) {
								BaseGen* gen = currNode->mUnitInfo->getBaseGen();
								if (gen) {
									FOREACH_NODE(BaseGen, gen->mChild, currGen)
									{
										if (currGen->mSpawnType == BaseGen::CGT_HoleOrGeyser && isFixObjSet(currNode, currGen)) {
											if (score >= maxScore) {
												if (score > maxScore) {
													counter  = 0;
													maxScore = score;
												}
												mapList[counter] = currNode;
												genList[counter] = currGen;
												counter++;
											}
										}
									}
								}

							} else if (roomTypes[j] == UNITKIND_Cap) {
								if (IS_SAME_STRING_PREFIX(currNode->getUnitName(), "item") && isFixObjSet(currNode, nullptr)) {
									if (score >= maxScore) {
										if (score > maxScore) {
											counter  = 0;
											maxScore = score;
										}
										mapList[counter] = currNode;
										genList[counter] = nullptr;
										counter++;
									}
								}
							} else if (isFixObjSet(currNode, nullptr)) {
								if (score >= maxScore) {
									if (score > maxScore) {
										counter  = 0;
										maxScore = score;
									}
									mapList[counter] = currNode;
									genList[counter] = nullptr;
									counter++;
								}
							}
						}
					}
				}
			}

			if (counter) {
				int randIdx                = randInt(counter);
				mFixObjNodes[fixObjIdx[i]] = mapList[randIdx];
				mFixObjGens[fixObjIdx[i]]  = genList[randIdx];
			}
		}
	}
}

/**
 * @note Address: 0x8024DF40
 * @note Size: 0x64
 */
bool RandMapScore::isGoalSetHard()
{
	switch (mGenerator->mRandItemType) {
	case 0:
		return false;

	case 1:
		return true;

	case 2:
		return false;

	case 3:
		return true;

	case 4:
		return true;
	}

	return false;
}

/**
 * @note Address: 0x8024DFA4
 * @note Size: 0x128
 */
bool RandMapScore::isFixObjSet(MapNode* node, BaseGen* spawner)
{
	// test 0 (pod/ship) separately
	if (node == getFixObjNode(FIXNODE_Pod) && spawner && getFixObjGen(FIXNODE_Pod)) {
		Vector3f fixPos  = getFixObjGen(FIXNODE_Pod)->mPosition;
		Vector3f testPos = spawner->mPosition;
		if (fixPos.distance(testPos) < 150.0f) {
			return false;
		}
	}

	// test remaining fix obj nodes
	for (int i = FIXNODE_Hole; i < FIXNODE_Count; i++) {
		if (node == getFixObjNode(i) && spawner == getFixObjGen(i)) {
			return false;
		}
	}

	return true;
}
} // namespace Cave
} // namespace Game
