#include <nw4r/g3d.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
////////////////// RESOURCE BYTE CODE //////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
const u8* ResMdl::GetResByteCode(const char* pName) const
{
	return static_cast<u8*>(ofs_to_obj<ResDic>(ref().toResByteCodeDic)[pName]);
}

////////////////////////////////////////////////////////
///////////////// RESOURCE NODES/BONES /////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResNode ResMdl::GetResNode(const char* pName) const
{
	return ResNode(ofs_to_obj<ResDic>(ref().toResNodeDic)[pName]);
}

/**
 * @brief TODO
 *
 */
ResNode ResMdl::GetResNode(const ResName name) const
{
	return ResNode(ofs_to_obj<ResDic>(ref().toResNodeDic)[name]);
}

/**
 * @brief TODO
 *
 */
ResNode ResMdl::GetResNode(int idx) const
{
	return ResNode(ofs_to_obj<ResDic>(ref().toResNodeDic)[idx]);
}

/**
 * @brief TODO
 *
 */
ResNode ResMdl::GetResNode(u32 idx) const
{
	return ResNode(ofs_to_obj<ResDic>(ref().toResNodeDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResNodeNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResNodeDic).GetNumData();
}

////////////////////////////////////////////////////////
/////////////////// VERTEX POSITIONS ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResVtxPos ResMdl::GetResVtxPos(const ResName name) const
{
	return ResVtxPos(ofs_to_obj<ResDic>(ref().toResVtxPosDic)[name]);
}

/**
 * @brief TODO
 *
 */
ResVtxPos ResMdl::GetResVtxPos(int idx) const
{
	return ResVtxPos(ofs_to_obj<ResDic>(ref().toResVtxPosDic)[idx]);
}

/**
 * @brief TODO
 *
 */
ResVtxPos ResMdl::GetResVtxPos(u32 idx) const
{
	return ResVtxPos(ofs_to_obj<ResDic>(ref().toResVtxPosDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResVtxPosNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResVtxPosDic).GetNumData();
}

////////////////////////////////////////////////////////
//////////////////// VERTEX NORMALS ////////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResVtxNrm ResMdl::GetResVtxNrm(const ResName name) const
{
	return ResVtxNrm(ofs_to_obj<ResDic>(ref().toResVtxNrmDic)[name]);
}

/**
 * @brief TODO
 *
 */
ResVtxNrm ResMdl::GetResVtxNrm(int idx) const
{
	return ResVtxNrm(ofs_to_obj<ResDic>(ref().toResVtxNrmDic)[idx]);
}

/**
 * @brief TODO
 *
 */
ResVtxNrm ResMdl::GetResVtxNrm(u32 idx) const
{
	return ResVtxNrm(ofs_to_obj<ResDic>(ref().toResVtxNrmDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResVtxNrmNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResVtxNrmDic).GetNumData();
}

////////////////////////////////////////////////////////
///////////////////// VERTEX COLORS ////////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResVtxClr ResMdl::GetResVtxClr(const ResName name) const
{
	return ResVtxClr(ofs_to_obj<ResDic>(ref().toResVtxClrDic)[name]);
}

/**
 * @brief TODO
 *
 */
ResVtxClr ResMdl::GetResVtxClr(int idx) const
{
	return ResVtxClr(ofs_to_obj<ResDic>(ref().toResVtxClrDic)[idx]);
}

/**
 * @brief TODO
 *
 */
ResVtxClr ResMdl::GetResVtxClr(u32 idx) const
{
	return ResVtxClr(ofs_to_obj<ResDic>(ref().toResVtxClrDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResVtxClrNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResVtxClrDic).GetNumData();
}

////////////////////////////////////////////////////////
////////////// VERTEX TEXTURE COORDINATES //////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResVtxTexCoord ResMdl::GetResVtxTexCoord(int idx) const
{
	return ResVtxTexCoord(ofs_to_obj<ResDic>(ref().toResVtxTexCoordDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResVtxTexCoordNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResVtxTexCoordDic).GetNumData();
}

////////////////////////////////////////////////////////
///////////////// VERTEX FUR POSITION //////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResVtxFurPos ResMdl::GetResVtxFurPos(int idx) const
{
	return ResVtxFurPos(ofs_to_obj<ResDic>(ref().toResVtxFurPosDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResVtxFurPosNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResVtxFurPosDic).GetNumData();
}

////////////////////////////////////////////////////////
///////////////// VERTEX FUR DIRECTION /////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResVtxFurVec ResMdl::GetResVtxFurVec(int idx) const
{
	return ResVtxFurVec(ofs_to_obj<ResDic>(ref().toResVtxFurVecDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResVtxFurVecNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResVtxFurVecDic).GetNumData();
}

////////////////////////////////////////////////////////
/////////////////////// MATERIALS //////////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResMat ResMdl::GetResMat(const char* pName) const
{
	return ResMat(ofs_to_obj<ResDic>(ref().toResMatDic)[pName]);
}

/**
 * @brief TODO
 *
 */
ResMat ResMdl::GetResMat(const ResName name) const
{
	return ResMat(ofs_to_obj<ResDic>(ref().toResMatDic)[name]);
}

/**
 * @brief TODO
 *
 */
ResMat ResMdl::GetResMat(int idx) const
{
	return ResMat(ofs_to_obj<ResDic>(ref().toResMatDic)[idx]);
}

/**
 * @brief TODO
 *
 */
ResMat ResMdl::GetResMat(u32 idx) const
{
	return ResMat(ofs_to_obj<ResDic>(ref().toResMatDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResMatNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResMatDic).GetNumData();
}

////////////////////////////////////////////////////////
//////////////////////// MESHES ////////////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResShp ResMdl::GetResShp(const char* pName) const
{
	return ResShp(ofs_to_obj<ResDic>(ref().toResShpDic)[pName]);
}

/**
 * @brief TODO
 *
 */
ResShp ResMdl::GetResShp(int idx) const
{
	return ResShp(ofs_to_obj<ResDic>(ref().toResShpDic)[idx]);
}

/**
 * @brief TODO
 *
 */
ResShp ResMdl::GetResShp(u32 idx) const
{
	return ResShp(ofs_to_obj<ResDic>(ref().toResShpDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResShpNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResShpDic).GetNumData();
}

////////////////////////////////////////////////////////
/////////////////// TEXTURE PALETTES ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
ResTexPlttInfo ResMdl::GetResTexPlttInfoOffsetFromTexName(int idx) const
{
	return ResTexPlttInfo(ofs_to_obj<ResDic>(ref().toResTexNameToTexPlttInfoDic)[idx]);
}

/**
 * @brief TODO
 *
 */
u32 ResMdl::GetResTexPlttInfoOffsetFromTexNameNumEntries() const
{
	return ofs_to_obj<ResDic>(ref().toResTexNameToTexPlttInfoDic).GetNumData();
}

////////////////////////////////////////////////////////
//////////////////////// MODELS ////////////////////////
////////////////////////////////////////////////////////

/**
 * @brief TODO
 *
 */
bool ResMdl::Bind(const ResFile file)
{
	u32 i;
	bool success = true;

	u32 matNum = GetResMatNumEntries();
	for (i = 0; i < matNum; i++) {
		success = GetResMat(i).Bind(file) && success;
	}

	return success;
}

/**
 * @brief TODO
 *
 */
void ResMdl::Release()
{
	u32 i;

	u32 matNum = GetResMatNumEntries();
	for (i = 0; i < matNum; i++) {
		GetResMat(i).Release();
	}
}

/**
 * @brief TODO
 *
 */
void ResMdl::Init()
{
	u32 i;

	u32 matNum = GetResMatNumEntries();
	for (i = 0; i < matNum; i++) {
		GetResMat(i).Init();
	}

	u32 shpNum = GetResShpNumEntries();
	for (i = 0; i < shpNum; i++) {
		GetResShp(i).Init();
	}

	u32 vtxPosNum = GetResVtxPosNumEntries();
	for (i = 0; i < vtxPosNum; i++) {
		GetResVtxPos(i).Init();
	}

	u32 vtxNrmNum = GetResVtxNrmNumEntries();
	for (i = 0; i < vtxNrmNum; i++) {
		GetResVtxNrm(i).Init();
	}

	u32 vtxClrNum = GetResVtxClrNumEntries();
	for (i = 0; i < vtxClrNum; i++) {
		GetResVtxClr(i).Init();
	}

	u32 texCoordNum = GetResVtxTexCoordNumEntries();
	for (i = 0; i < texCoordNum; i++) {
		GetResVtxTexCoord(i).Init();
	}

	u32 vtxFurVecNum = GetResVtxFurVecNumEntries();
	for (i = 0; i < vtxFurVecNum; i++) {
		GetResVtxFurVec(i).Init();
	}

	u32 vtxFurPosNum = GetResVtxFurPosNumEntries();
	for (i = 0; i < vtxFurPosNum; i++) {
		GetResVtxFurPos(i).Init();
	}
}

/**
 * @brief TODO
 *
 */
void ResMdl::Terminate()
{
	u32 i;

	u32 shpNum = GetResShpNumEntries();
	for (i = 0; i < shpNum; i++) {
		GetResShp(i).Terminate();
	}
}

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r
