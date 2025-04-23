#include "noiseutils_bindings.h"
#include <memory>

extern "C" {

/* BEGIN NAMESPACE: utils */

/* BEGIN CLASS: Color */
nu_noise_utils_Color* nu_noise_utils_Color_new_1() {
	return (nu_noise_utils_Color*)(new noise::utils::Color());
}
nu_noise_utils_Color* nu_noise_utils_Color_new_2(no_noise_uint8 r, no_noise_uint8 g, no_noise_uint8 b, no_noise_uint8 a) {
	return (nu_noise_utils_Color*)(new noise::utils::Color((noise::uint8)r, (noise::uint8)g, (noise::uint8)b, (noise::uint8)a));
}
void nu_noise_utils_Color_dispose(nu_noise_utils_Color* self) {
	delete (noise::utils::Color*)self;
}
/* END CLASS: Color */

/* BEGIN CLASS: GradientPoint */
void nu_noise_utils_GradientPoint_dispose(nu_noise_utils_GradientPoint* self) {
	delete (noise::utils::GradientPoint*)self;
}
/* END CLASS: GradientPoint */

/* BEGIN CLASS: GradientColor */
nu_noise_utils_GradientColor* nu_noise_utils_GradientColor_new() {
	return (nu_noise_utils_GradientColor*)(new noise::utils::GradientColor());
}
void nu_noise_utils_GradientColor_AddGradientPoint(nu_noise_utils_GradientColor* self, double gradientPos, nu_noise_utils_Color* gradientColor) {
	((noise::utils::GradientColor*)self)->AddGradientPoint(gradientPos, *(noise::utils::Color*)gradientColor);
}
void nu_noise_utils_GradientColor_Clear(nu_noise_utils_GradientColor* self) {
	((noise::utils::GradientColor*)self)->Clear();
}
nu_noise_utils_Color* nu_noise_utils_GradientColor_GetColor(nu_noise_utils_GradientColor* self, double gradientPos) {
	return (nu_noise_utils_Color*)&(((noise::utils::GradientColor*)self)->GetColor(gradientPos));
}
nu_noise_utils_GradientPoint* nu_noise_utils_GradientColor_GetGradientPointArray(nu_noise_utils_GradientColor* self) {
	return (nu_noise_utils_GradientPoint*)(((noise::utils::GradientColor*)self)->GetGradientPointArray());
}
int nu_noise_utils_GradientColor_GetGradientPointCount(nu_noise_utils_GradientColor* self) {
	return ((noise::utils::GradientColor*)self)->GetGradientPointCount();
}
void nu_noise_utils_GradientColor_dispose(nu_noise_utils_GradientColor* self) {
	delete (noise::utils::GradientColor*)self;
}
/* END CLASS: GradientColor */

/* BEGIN CLASS: NoiseMap */
nu_noise_utils_NoiseMap* nu_noise_utils_NoiseMap_new_1() {
	return (nu_noise_utils_NoiseMap*)(new noise::utils::NoiseMap());
}
nu_noise_utils_NoiseMap* nu_noise_utils_NoiseMap_new_2(int width, int height) {
	return (nu_noise_utils_NoiseMap*)(new noise::utils::NoiseMap(width, height));
}
nu_noise_utils_NoiseMap* nu_noise_utils_NoiseMap_new_3(nu_noise_utils_NoiseMap* rhs) {
	return (nu_noise_utils_NoiseMap*)(new noise::utils::NoiseMap(*(noise::utils::NoiseMap*)rhs));
}
void nu_noise_utils_NoiseMap_Clear(nu_noise_utils_NoiseMap* self, float value) {
	((noise::utils::NoiseMap*)self)->Clear(value);
}
float nu_noise_utils_NoiseMap_GetBorderValue(nu_noise_utils_NoiseMap* self) {
	return ((noise::utils::NoiseMap*)self)->GetBorderValue();
}
const float* nu_noise_utils_NoiseMap_GetConstSlabPtr_1(nu_noise_utils_NoiseMap* self) {
	return (const float*)(((noise::utils::NoiseMap*)self)->GetConstSlabPtr());
}
const float* nu_noise_utils_NoiseMap_GetConstSlabPtr_2(nu_noise_utils_NoiseMap* self, int row) {
	return (const float*)(((noise::utils::NoiseMap*)self)->GetConstSlabPtr(row));
}
const float* nu_noise_utils_NoiseMap_GetConstSlabPtr_3(nu_noise_utils_NoiseMap* self, int x, int y) {
	return (const float*)(((noise::utils::NoiseMap*)self)->GetConstSlabPtr(x, y));
}
int nu_noise_utils_NoiseMap_GetHeight(nu_noise_utils_NoiseMap* self) {
	return ((noise::utils::NoiseMap*)self)->GetHeight();
}
size_t nu_noise_utils_NoiseMap_GetMemUsed(nu_noise_utils_NoiseMap* self) {
	return ((noise::utils::NoiseMap*)self)->GetMemUsed();
}
float* nu_noise_utils_NoiseMap_GetSlabPtr_1(nu_noise_utils_NoiseMap* self) {
	return ((noise::utils::NoiseMap*)self)->GetSlabPtr();
}
float* nu_noise_utils_NoiseMap_GetSlabPtr_2(nu_noise_utils_NoiseMap* self, int row) {
	return ((noise::utils::NoiseMap*)self)->GetSlabPtr(row);
}
float* nu_noise_utils_NoiseMap_GetSlabPtr_3(nu_noise_utils_NoiseMap* self, int x, int y) {
	return ((noise::utils::NoiseMap*)self)->GetSlabPtr(x, y);
}
int nu_noise_utils_NoiseMap_GetStride(nu_noise_utils_NoiseMap* self) {
	return ((noise::utils::NoiseMap*)self)->GetStride();
}
float nu_noise_utils_NoiseMap_GetValue(nu_noise_utils_NoiseMap* self, int x, int y) {
	return ((noise::utils::NoiseMap*)self)->GetValue(x, y);
}
int nu_noise_utils_NoiseMap_GetWidth(nu_noise_utils_NoiseMap* self) {
	return ((noise::utils::NoiseMap*)self)->GetWidth();
}
void nu_noise_utils_NoiseMap_ReclaimMem(nu_noise_utils_NoiseMap* self) {
	((noise::utils::NoiseMap*)self)->ReclaimMem();
}
void nu_noise_utils_NoiseMap_SetBorderValue(nu_noise_utils_NoiseMap* self, float borderValue) {
	((noise::utils::NoiseMap*)self)->SetBorderValue(borderValue);
}
void nu_noise_utils_NoiseMap_SetSize(nu_noise_utils_NoiseMap* self, int width, int height) {
	((noise::utils::NoiseMap*)self)->SetSize(width, height);
}
void nu_noise_utils_NoiseMap_SetValue(nu_noise_utils_NoiseMap* self, int x, int y, float value) {
	((noise::utils::NoiseMap*)self)->SetValue(x, y, value);
}
void nu_noise_utils_NoiseMap_TakeOwnership(nu_noise_utils_NoiseMap* self, nu_noise_utils_NoiseMap* source) {
	((noise::utils::NoiseMap*)self)->TakeOwnership(*(noise::utils::NoiseMap*)source);
}
void nu_noise_utils_NoiseMap_dispose(nu_noise_utils_NoiseMap* self) {
	delete (noise::utils::NoiseMap*)self;
}
/* END CLASS: NoiseMap */

/* BEGIN CLASS: Image */
nu_noise_utils_Image* nu_noise_utils_Image_new_1() {
	return (nu_noise_utils_Image*)(new noise::utils::Image());
}
nu_noise_utils_Image* nu_noise_utils_Image_new_2(int width, int height) {
	return (nu_noise_utils_Image*)(new noise::utils::Image(width, height));
}
nu_noise_utils_Image* nu_noise_utils_Image_new_3(nu_noise_utils_Image* rhs) {
	return (nu_noise_utils_Image*)(new noise::utils::Image(*(noise::utils::Image*)rhs));
}
void nu_noise_utils_Image_Clear(nu_noise_utils_Image* self, nu_noise_utils_Color* value) {
	((noise::utils::Image*)self)->Clear(*(noise::utils::Color*)value);
}
nu_noise_utils_Color* nu_noise_utils_Image_GetBorderValue(nu_noise_utils_Image* self) {
	auto _tmp = ((noise::utils::Image*)self)->GetBorderValue();
	auto _result = std::make_unique<noise::utils::Color>(_tmp);
	return (nu_noise_utils_Color*)_result.release();
}
nu_noise_utils_Color* nu_noise_utils_Image_GetConstSlabPtr_1(nu_noise_utils_Image* self) {
	return (nu_noise_utils_Color*)(((noise::utils::Image*)self)->GetConstSlabPtr());
}
nu_noise_utils_Color* nu_noise_utils_Image_GetConstSlabPtr_2(nu_noise_utils_Image* self, int row) {
	return (nu_noise_utils_Color*)(((noise::utils::Image*)self)->GetConstSlabPtr(row));
}
nu_noise_utils_Color* nu_noise_utils_Image_GetConstSlabPtr_3(nu_noise_utils_Image* self, int x, int y) {
	return (nu_noise_utils_Color*)(((noise::utils::Image*)self)->GetConstSlabPtr(x, y));
}
int nu_noise_utils_Image_GetHeight(nu_noise_utils_Image* self) {
	return ((noise::utils::Image*)self)->GetHeight();
}
size_t nu_noise_utils_Image_GetMemUsed(nu_noise_utils_Image* self) {
	return ((noise::utils::Image*)self)->GetMemUsed();
}
nu_noise_utils_Color* nu_noise_utils_Image_GetSlabPtr_1(nu_noise_utils_Image* self) {
	return (nu_noise_utils_Color*)(((noise::utils::Image*)self)->GetSlabPtr());
}
nu_noise_utils_Color* nu_noise_utils_Image_GetSlabPtr_2(nu_noise_utils_Image* self, int row) {
	return (nu_noise_utils_Color*)(((noise::utils::Image*)self)->GetSlabPtr(row));
}
nu_noise_utils_Color* nu_noise_utils_Image_GetSlabPtr_3(nu_noise_utils_Image* self, int x, int y) {
	return (nu_noise_utils_Color*)(((noise::utils::Image*)self)->GetSlabPtr(x, y));
}
int nu_noise_utils_Image_GetStride(nu_noise_utils_Image* self) {
	return ((noise::utils::Image*)self)->GetStride();
}
nu_noise_utils_Color* nu_noise_utils_Image_GetValue(nu_noise_utils_Image* self, int x, int y) {
	auto _tmp = ((noise::utils::Image*)self)->GetValue(x, y);
	auto _result = std::make_unique<noise::utils::Color>(_tmp);
	return (nu_noise_utils_Color*)_result.release();
}
int nu_noise_utils_Image_GetWidth(nu_noise_utils_Image* self) {
	return ((noise::utils::Image*)self)->GetWidth();
}
void nu_noise_utils_Image_ReclaimMem(nu_noise_utils_Image* self) {
	((noise::utils::Image*)self)->ReclaimMem();
}
void nu_noise_utils_Image_SetBorderValue(nu_noise_utils_Image* self, nu_noise_utils_Color* borderValue) {
	((noise::utils::Image*)self)->SetBorderValue(*(noise::utils::Color*)borderValue);
}
void nu_noise_utils_Image_SetSize(nu_noise_utils_Image* self, int width, int height) {
	((noise::utils::Image*)self)->SetSize(width, height);
}
void nu_noise_utils_Image_SetValue(nu_noise_utils_Image* self, int x, int y, nu_noise_utils_Color* value) {
	((noise::utils::Image*)self)->SetValue(x, y, *(noise::utils::Color*)value);
}
void nu_noise_utils_Image_TakeOwnership(nu_noise_utils_Image* self, nu_noise_utils_Image* source) {
	((noise::utils::Image*)self)->TakeOwnership(*(noise::utils::Image*)source);
}
void nu_noise_utils_Image_dispose(nu_noise_utils_Image* self) {
	delete (noise::utils::Image*)self;
}
/* END CLASS: Image */

/* BEGIN CLASS: WriterBMP */
nu_noise_utils_WriterBMP* nu_noise_utils_WriterBMP_new() {
	return (nu_noise_utils_WriterBMP*)(new noise::utils::WriterBMP());
}
char* nu_noise_utils_WriterBMP_GetDestFilename(nu_noise_utils_WriterBMP* self) {
	auto _tmp = ((noise::utils::WriterBMP*)self)->GetDestFilename();
	auto _result = _tmp.c_str();
	return (char*)_result;
}
void nu_noise_utils_WriterBMP_SetDestFilename(nu_noise_utils_WriterBMP* self, char* filename) {
	((noise::utils::WriterBMP*)self)->SetDestFilename(std::string(filename));
}
void nu_noise_utils_WriterBMP_SetSourceImage(nu_noise_utils_WriterBMP* self, nu_noise_utils_Image* sourceImage) {
	((noise::utils::WriterBMP*)self)->SetSourceImage(*(noise::utils::Image*)sourceImage);
}
void nu_noise_utils_WriterBMP_WriteDestFile(nu_noise_utils_WriterBMP* self) {
	((noise::utils::WriterBMP*)self)->WriteDestFile();
}
void nu_noise_utils_WriterBMP_dispose(nu_noise_utils_WriterBMP* self) {
	delete (noise::utils::WriterBMP*)self;
}
/* END CLASS: WriterBMP */

/* BEGIN CLASS: WriterTER */
nu_noise_utils_WriterTER* nu_noise_utils_WriterTER_new() {
	return (nu_noise_utils_WriterTER*)(new noise::utils::WriterTER());
}
char* nu_noise_utils_WriterTER_GetDestFilename(nu_noise_utils_WriterTER* self) {
	auto _tmp = ((noise::utils::WriterTER*)self)->GetDestFilename();
	auto _result = _tmp.c_str();
	return (char*)_result;
}
float nu_noise_utils_WriterTER_GetMetersPerPoint(nu_noise_utils_WriterTER* self) {
	return ((noise::utils::WriterTER*)self)->GetMetersPerPoint();
}
void nu_noise_utils_WriterTER_SetDestFilename(nu_noise_utils_WriterTER* self, char* filename) {
	((noise::utils::WriterTER*)self)->SetDestFilename(std::string(filename));
}
void nu_noise_utils_WriterTER_SetMetersPerPoint(nu_noise_utils_WriterTER* self, float metersPerPoint) {
	((noise::utils::WriterTER*)self)->SetMetersPerPoint(metersPerPoint);
}
void nu_noise_utils_WriterTER_SetSourceNoiseMap(nu_noise_utils_WriterTER* self, nu_noise_utils_NoiseMap* sourceNoiseMap) {
	((noise::utils::WriterTER*)self)->SetSourceNoiseMap(*(noise::utils::NoiseMap*)sourceNoiseMap);
}
void nu_noise_utils_WriterTER_WriteDestFile(nu_noise_utils_WriterTER* self) {
	((noise::utils::WriterTER*)self)->WriteDestFile();
}
void nu_noise_utils_WriterTER_dispose(nu_noise_utils_WriterTER* self) {
	delete (noise::utils::WriterTER*)self;
}
/* END CLASS: WriterTER */

/* BEGIN CLASS: NoiseMapBuilder */
void nu_noise_utils_NoiseMapBuilder_Build(nu_noise_utils_NoiseMapBuilder* self) {
	((noise::utils::NoiseMapBuilder*)self)->Build();
}
double nu_noise_utils_NoiseMapBuilder_GetDestHeight(nu_noise_utils_NoiseMapBuilder* self) {
	return ((noise::utils::NoiseMapBuilder*)self)->GetDestHeight();
}
double nu_noise_utils_NoiseMapBuilder_GetDestWidth(nu_noise_utils_NoiseMapBuilder* self) {
	return ((noise::utils::NoiseMapBuilder*)self)->GetDestWidth();
}
void nu_noise_utils_NoiseMapBuilder_SetCallback(nu_noise_utils_NoiseMapBuilder* self, nu_noise_utils_NoiseMapCallback pCallback) {
	((noise::utils::NoiseMapBuilder*)self)->SetCallback((noise::utils::NoiseMapCallback)pCallback);
}
void nu_noise_utils_NoiseMapBuilder_SetDestNoiseMap(nu_noise_utils_NoiseMapBuilder* self, nu_noise_utils_NoiseMap* destNoiseMap) {
	((noise::utils::NoiseMapBuilder*)self)->SetDestNoiseMap(*(noise::utils::NoiseMap*)destNoiseMap);
}
void nu_noise_utils_NoiseMapBuilder_SetSourceModule(nu_noise_utils_NoiseMapBuilder* self, no_noise_module_Module* sourceModule) {
	((noise::utils::NoiseMapBuilder*)self)->SetSourceModule(*(noise::module::Module*)sourceModule);
}
void nu_noise_utils_NoiseMapBuilder_SetDestSize(nu_noise_utils_NoiseMapBuilder* self, int destWidth, int destHeight) {
	((noise::utils::NoiseMapBuilder*)self)->SetDestSize(destWidth, destHeight);
}
/* END CLASS: NoiseMapBuilder */

/* BEGIN CLASS: NoiseMapBuilderCylinder */
nu_noise_utils_NoiseMapBuilderCylinder* nu_noise_utils_NoiseMapBuilderCylinder_new() {
	return (nu_noise_utils_NoiseMapBuilderCylinder*)(new noise::utils::NoiseMapBuilderCylinder());
}
void nu_noise_utils_NoiseMapBuilderCylinder_Build(nu_noise_utils_NoiseMapBuilderCylinder* self) {
	((noise::utils::NoiseMapBuilderCylinder*)self)->Build();
}
double nu_noise_utils_NoiseMapBuilderCylinder_GetLowerAngleBound(nu_noise_utils_NoiseMapBuilderCylinder* self) {
	return ((noise::utils::NoiseMapBuilderCylinder*)self)->GetLowerAngleBound();
}
double nu_noise_utils_NoiseMapBuilderCylinder_GetLowerHeightBound(nu_noise_utils_NoiseMapBuilderCylinder* self) {
	return ((noise::utils::NoiseMapBuilderCylinder*)self)->GetLowerHeightBound();
}
double nu_noise_utils_NoiseMapBuilderCylinder_GetUpperAngleBound(nu_noise_utils_NoiseMapBuilderCylinder* self) {
	return ((noise::utils::NoiseMapBuilderCylinder*)self)->GetUpperAngleBound();
}
double nu_noise_utils_NoiseMapBuilderCylinder_GetUpperHeightBound(nu_noise_utils_NoiseMapBuilderCylinder* self) {
	return ((noise::utils::NoiseMapBuilderCylinder*)self)->GetUpperHeightBound();
}
void nu_noise_utils_NoiseMapBuilderCylinder_SetBounds(nu_noise_utils_NoiseMapBuilderCylinder* self, double lowerAngleBound, double upperAngleBound, double lowerHeightBound, double upperHeightBound) {
	((noise::utils::NoiseMapBuilderCylinder*)self)->SetBounds(lowerAngleBound, upperAngleBound, lowerHeightBound, upperHeightBound);
}
void nu_noise_utils_NoiseMapBuilderCylinder_dispose(nu_noise_utils_NoiseMapBuilderCylinder* self) {
	delete (noise::utils::NoiseMapBuilderCylinder*)self;
}
/* END CLASS: NoiseMapBuilderCylinder */

/* BEGIN CLASS: NoiseMapBuilderPlane */
nu_noise_utils_NoiseMapBuilderPlane* nu_noise_utils_NoiseMapBuilderPlane_new() {
	return (nu_noise_utils_NoiseMapBuilderPlane*)(new noise::utils::NoiseMapBuilderPlane());
}
void nu_noise_utils_NoiseMapBuilderPlane_Build(nu_noise_utils_NoiseMapBuilderPlane* self) {
	((noise::utils::NoiseMapBuilderPlane*)self)->Build();
}
void nu_noise_utils_NoiseMapBuilderPlane_EnableSeamless(nu_noise_utils_NoiseMapBuilderPlane* self, bool enable) {
	((noise::utils::NoiseMapBuilderPlane*)self)->EnableSeamless(enable);
}
double nu_noise_utils_NoiseMapBuilderPlane_GetLowerXBound(nu_noise_utils_NoiseMapBuilderPlane* self) {
	return ((noise::utils::NoiseMapBuilderPlane*)self)->GetLowerXBound();
}
double nu_noise_utils_NoiseMapBuilderPlane_GetLowerZBound(nu_noise_utils_NoiseMapBuilderPlane* self) {
	return ((noise::utils::NoiseMapBuilderPlane*)self)->GetLowerZBound();
}
double nu_noise_utils_NoiseMapBuilderPlane_GetUpperXBound(nu_noise_utils_NoiseMapBuilderPlane* self) {
	return ((noise::utils::NoiseMapBuilderPlane*)self)->GetUpperXBound();
}
double nu_noise_utils_NoiseMapBuilderPlane_GetUpperZBound(nu_noise_utils_NoiseMapBuilderPlane* self) {
	return ((noise::utils::NoiseMapBuilderPlane*)self)->GetUpperZBound();
}
bool nu_noise_utils_NoiseMapBuilderPlane_IsSeamlessEnabled(nu_noise_utils_NoiseMapBuilderPlane* self) {
	return ((noise::utils::NoiseMapBuilderPlane*)self)->IsSeamlessEnabled();
}
void nu_noise_utils_NoiseMapBuilderPlane_SetBounds(nu_noise_utils_NoiseMapBuilderPlane* self, double lowerXBound, double upperXBound, double lowerZBound, double upperZBound) {
	((noise::utils::NoiseMapBuilderPlane*)self)->SetBounds(lowerXBound, upperXBound, lowerZBound, upperZBound);
}
void nu_noise_utils_NoiseMapBuilderPlane_dispose(nu_noise_utils_NoiseMapBuilderPlane* self) {
	delete (noise::utils::NoiseMapBuilderPlane*)self;
}
/* END CLASS: NoiseMapBuilderPlane */

/* BEGIN CLASS: NoiseMapBuilderSphere */
nu_noise_utils_NoiseMapBuilderSphere* nu_noise_utils_NoiseMapBuilderSphere_new() {
	return (nu_noise_utils_NoiseMapBuilderSphere*)(new noise::utils::NoiseMapBuilderSphere());
}
void nu_noise_utils_NoiseMapBuilderSphere_Build(nu_noise_utils_NoiseMapBuilderSphere* self) {
	((noise::utils::NoiseMapBuilderSphere*)self)->Build();
}
double nu_noise_utils_NoiseMapBuilderSphere_GetEastLonBound(nu_noise_utils_NoiseMapBuilderSphere* self) {
	return ((noise::utils::NoiseMapBuilderSphere*)self)->GetEastLonBound();
}
double nu_noise_utils_NoiseMapBuilderSphere_GetNorthLatBound(nu_noise_utils_NoiseMapBuilderSphere* self) {
	return ((noise::utils::NoiseMapBuilderSphere*)self)->GetNorthLatBound();
}
double nu_noise_utils_NoiseMapBuilderSphere_GetSouthLatBound(nu_noise_utils_NoiseMapBuilderSphere* self) {
	return ((noise::utils::NoiseMapBuilderSphere*)self)->GetSouthLatBound();
}
double nu_noise_utils_NoiseMapBuilderSphere_GetWestLonBound(nu_noise_utils_NoiseMapBuilderSphere* self) {
	return ((noise::utils::NoiseMapBuilderSphere*)self)->GetWestLonBound();
}
void nu_noise_utils_NoiseMapBuilderSphere_SetBounds(nu_noise_utils_NoiseMapBuilderSphere* self, double southLatBound, double northLatBound, double westLonBound, double eastLonBound) {
	((noise::utils::NoiseMapBuilderSphere*)self)->SetBounds(southLatBound, northLatBound, westLonBound, eastLonBound);
}
void nu_noise_utils_NoiseMapBuilderSphere_dispose(nu_noise_utils_NoiseMapBuilderSphere* self) {
	delete (noise::utils::NoiseMapBuilderSphere*)self;
}
/* END CLASS: NoiseMapBuilderSphere */

/* BEGIN CLASS: RendererImage */
nu_noise_utils_RendererImage* nu_noise_utils_RendererImage_new() {
	return (nu_noise_utils_RendererImage*)(new noise::utils::RendererImage());
}
void nu_noise_utils_RendererImage_AddGradientPoint(nu_noise_utils_RendererImage* self, double gradientPos, nu_noise_utils_Color* gradientColor) {
	((noise::utils::RendererImage*)self)->AddGradientPoint(gradientPos, *(noise::utils::Color*)gradientColor);
}
void nu_noise_utils_RendererImage_BuildGrayscaleGradient(nu_noise_utils_RendererImage* self) {
	((noise::utils::RendererImage*)self)->BuildGrayscaleGradient();
}
void nu_noise_utils_RendererImage_BuildTerrainGradient(nu_noise_utils_RendererImage* self) {
	((noise::utils::RendererImage*)self)->BuildTerrainGradient();
}
void nu_noise_utils_RendererImage_ClearGradient(nu_noise_utils_RendererImage* self) {
	((noise::utils::RendererImage*)self)->ClearGradient();
}
void nu_noise_utils_RendererImage_EnableLight(nu_noise_utils_RendererImage* self, bool enable) {
	((noise::utils::RendererImage*)self)->EnableLight(enable);
}
void nu_noise_utils_RendererImage_EnableWrap(nu_noise_utils_RendererImage* self, bool enable) {
	((noise::utils::RendererImage*)self)->EnableWrap(enable);
}
double nu_noise_utils_RendererImage_GetLightAzimuth(nu_noise_utils_RendererImage* self) {
	return ((noise::utils::RendererImage*)self)->GetLightAzimuth();
}
double nu_noise_utils_RendererImage_GetLightBrightness(nu_noise_utils_RendererImage* self) {
	return ((noise::utils::RendererImage*)self)->GetLightBrightness();
}
nu_noise_utils_Color* nu_noise_utils_RendererImage_GetLightColor(nu_noise_utils_RendererImage* self) {
	auto _tmp = ((noise::utils::RendererImage*)self)->GetLightColor();
	auto _result = std::make_unique<noise::utils::Color>(_tmp);
	return (nu_noise_utils_Color*)_result.release();
}
double nu_noise_utils_RendererImage_GetLightContrast(nu_noise_utils_RendererImage* self) {
	return ((noise::utils::RendererImage*)self)->GetLightContrast();
}
double nu_noise_utils_RendererImage_GetLightElev(nu_noise_utils_RendererImage* self) {
	return ((noise::utils::RendererImage*)self)->GetLightElev();
}
double nu_noise_utils_RendererImage_GetLightIntensity(nu_noise_utils_RendererImage* self) {
	return ((noise::utils::RendererImage*)self)->GetLightIntensity();
}
bool nu_noise_utils_RendererImage_IsLightEnabled(nu_noise_utils_RendererImage* self) {
	return ((noise::utils::RendererImage*)self)->IsLightEnabled();
}
bool nu_noise_utils_RendererImage_IsWrapEnabled(nu_noise_utils_RendererImage* self) {
	return ((noise::utils::RendererImage*)self)->IsWrapEnabled();
}
void nu_noise_utils_RendererImage_Render(nu_noise_utils_RendererImage* self) {
	((noise::utils::RendererImage*)self)->Render();
}
void nu_noise_utils_RendererImage_SetBackgroundImage(nu_noise_utils_RendererImage* self, nu_noise_utils_Image* backgroundImage) {
	((noise::utils::RendererImage*)self)->SetBackgroundImage(*(noise::utils::Image*)backgroundImage);
}
void nu_noise_utils_RendererImage_SetDestImage(nu_noise_utils_RendererImage* self, nu_noise_utils_Image* destImage) {
	((noise::utils::RendererImage*)self)->SetDestImage(*(noise::utils::Image*)destImage);
}
void nu_noise_utils_RendererImage_SetLightAzimuth(nu_noise_utils_RendererImage* self, double lightAzimuth) {
	((noise::utils::RendererImage*)self)->SetLightAzimuth(lightAzimuth);
}
void nu_noise_utils_RendererImage_SetLightBrightness(nu_noise_utils_RendererImage* self, double lightBrightness) {
	((noise::utils::RendererImage*)self)->SetLightBrightness(lightBrightness);
}
void nu_noise_utils_RendererImage_SetLightColor(nu_noise_utils_RendererImage* self, nu_noise_utils_Color* lightColor) {
	((noise::utils::RendererImage*)self)->SetLightColor(*(noise::utils::Color*)lightColor);
}
void nu_noise_utils_RendererImage_SetLightContrast(nu_noise_utils_RendererImage* self, double lightContrast) {
	((noise::utils::RendererImage*)self)->SetLightContrast(lightContrast);
}
void nu_noise_utils_RendererImage_SetLightElev(nu_noise_utils_RendererImage* self, double lightElev) {
	((noise::utils::RendererImage*)self)->SetLightElev(lightElev);
}
void nu_noise_utils_RendererImage_SetLightIntensity(nu_noise_utils_RendererImage* self, double lightIntensity) {
	((noise::utils::RendererImage*)self)->SetLightIntensity(lightIntensity);
}
void nu_noise_utils_RendererImage_SetSourceNoiseMap(nu_noise_utils_RendererImage* self, nu_noise_utils_NoiseMap* sourceNoiseMap) {
	((noise::utils::RendererImage*)self)->SetSourceNoiseMap(*(noise::utils::NoiseMap*)sourceNoiseMap);
}
void nu_noise_utils_RendererImage_dispose(nu_noise_utils_RendererImage* self) {
	delete (noise::utils::RendererImage*)self;
}
/* END CLASS: RendererImage */

/* BEGIN CLASS: RendererNormalMap */
nu_noise_utils_RendererNormalMap* nu_noise_utils_RendererNormalMap_new() {
	return (nu_noise_utils_RendererNormalMap*)(new noise::utils::RendererNormalMap());
}
void nu_noise_utils_RendererNormalMap_EnableWrap(nu_noise_utils_RendererNormalMap* self, bool enable) {
	((noise::utils::RendererNormalMap*)self)->EnableWrap(enable);
}
double nu_noise_utils_RendererNormalMap_GetBumpHeight(nu_noise_utils_RendererNormalMap* self) {
	return ((noise::utils::RendererNormalMap*)self)->GetBumpHeight();
}
bool nu_noise_utils_RendererNormalMap_IsWrapEnabled(nu_noise_utils_RendererNormalMap* self) {
	return ((noise::utils::RendererNormalMap*)self)->IsWrapEnabled();
}
void nu_noise_utils_RendererNormalMap_Render(nu_noise_utils_RendererNormalMap* self) {
	((noise::utils::RendererNormalMap*)self)->Render();
}
void nu_noise_utils_RendererNormalMap_SetBumpHeight(nu_noise_utils_RendererNormalMap* self, double bumpHeight) {
	((noise::utils::RendererNormalMap*)self)->SetBumpHeight(bumpHeight);
}
void nu_noise_utils_RendererNormalMap_SetDestImage(nu_noise_utils_RendererNormalMap* self, nu_noise_utils_Image* destImage) {
	((noise::utils::RendererNormalMap*)self)->SetDestImage(*(noise::utils::Image*)destImage);
}
void nu_noise_utils_RendererNormalMap_SetSourceNoiseMap(nu_noise_utils_RendererNormalMap* self, nu_noise_utils_NoiseMap* sourceNoiseMap) {
	((noise::utils::RendererNormalMap*)self)->SetSourceNoiseMap(*(noise::utils::NoiseMap*)sourceNoiseMap);
}
void nu_noise_utils_RendererNormalMap_dispose(nu_noise_utils_RendererNormalMap* self) {
	delete (noise::utils::RendererNormalMap*)self;
}
/* END CLASS: RendererNormalMap */

/* END NAMESPACE: utils */

}
