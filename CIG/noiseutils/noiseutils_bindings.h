#ifndef NOISEUTILS_BINDINGS
#define NOISEUTILS_BINDINGS

#include "noise_bindings.h"

#include <noiseutils.h>

extern "C" {

/* BEGIN SECTION: DECLARATIONS */
typedef void* nu_noise_utils_NoiseMapCallback;
typedef void nu_noise_utils_Color;
typedef void nu_noise_utils_GradientPoint;
typedef void nu_noise_utils_GradientColor;
typedef void nu_noise_utils_NoiseMap;
typedef void nu_noise_utils_Image;
typedef void nu_noise_utils_WriterBMP;
typedef void nu_noise_utils_WriterTER;
typedef void nu_noise_utils_NoiseMapBuilder;
typedef void nu_noise_utils_NoiseMapBuilderCylinder;
typedef void nu_noise_utils_NoiseMapBuilderPlane;
typedef void nu_noise_utils_NoiseMapBuilderSphere;
typedef void nu_noise_utils_RendererImage;
typedef void nu_noise_utils_RendererNormalMap;
/* END SECTION: DECLARATIONS */

/* BEGIN CLASS: Color */
nu_noise_utils_Color* nu_noise_utils_Color_new_1();
nu_noise_utils_Color* nu_noise_utils_Color_new_2(no_noise_uint8 r, no_noise_uint8 g, no_noise_uint8 b, no_noise_uint8 a);
void nu_noise_utils_Color_dispose(nu_noise_utils_Color* self);
/* END CLASS: Color */

/* BEGIN CLASS: GradientPoint */
void nu_noise_utils_GradientPoint_dispose(nu_noise_utils_GradientPoint* self);
/* END CLASS: GradientPoint */

/* BEGIN CLASS: GradientColor */
nu_noise_utils_GradientColor* nu_noise_utils_GradientColor_new();
void nu_noise_utils_GradientColor_AddGradientPoint(nu_noise_utils_GradientColor* self, double gradientPos, nu_noise_utils_Color* gradientColor);
void nu_noise_utils_GradientColor_Clear(nu_noise_utils_GradientColor* self);
nu_noise_utils_Color* nu_noise_utils_GradientColor_GetColor(nu_noise_utils_GradientColor* self, double gradientPos);
nu_noise_utils_GradientPoint* nu_noise_utils_GradientColor_GetGradientPointArray(nu_noise_utils_GradientColor* self);
int nu_noise_utils_GradientColor_GetGradientPointCount(nu_noise_utils_GradientColor* self);
void nu_noise_utils_GradientColor_dispose(nu_noise_utils_GradientColor* self);
/* END CLASS: GradientColor */

/* BEGIN CLASS: NoiseMap */
nu_noise_utils_NoiseMap* nu_noise_utils_NoiseMap_new_1();
nu_noise_utils_NoiseMap* nu_noise_utils_NoiseMap_new_2(int width, int height);
nu_noise_utils_NoiseMap* nu_noise_utils_NoiseMap_new_3(nu_noise_utils_NoiseMap* rhs);
void nu_noise_utils_NoiseMap_Clear(nu_noise_utils_NoiseMap* self, float value);
float nu_noise_utils_NoiseMap_GetBorderValue(nu_noise_utils_NoiseMap* self);
const float* nu_noise_utils_NoiseMap_GetConstSlabPtr_1(nu_noise_utils_NoiseMap* self);
const float* nu_noise_utils_NoiseMap_GetConstSlabPtr_2(nu_noise_utils_NoiseMap* self, int row);
const float* nu_noise_utils_NoiseMap_GetConstSlabPtr_3(nu_noise_utils_NoiseMap* self, int x, int y);
int nu_noise_utils_NoiseMap_GetHeight(nu_noise_utils_NoiseMap* self);
size_t nu_noise_utils_NoiseMap_GetMemUsed(nu_noise_utils_NoiseMap* self);
float* nu_noise_utils_NoiseMap_GetSlabPtr_1(nu_noise_utils_NoiseMap* self);
float* nu_noise_utils_NoiseMap_GetSlabPtr_2(nu_noise_utils_NoiseMap* self, int row);
float* nu_noise_utils_NoiseMap_GetSlabPtr_3(nu_noise_utils_NoiseMap* self, int x, int y);
int nu_noise_utils_NoiseMap_GetStride(nu_noise_utils_NoiseMap* self);
float nu_noise_utils_NoiseMap_GetValue(nu_noise_utils_NoiseMap* self, int x, int y);
int nu_noise_utils_NoiseMap_GetWidth(nu_noise_utils_NoiseMap* self);
void nu_noise_utils_NoiseMap_ReclaimMem(nu_noise_utils_NoiseMap* self);
void nu_noise_utils_NoiseMap_SetBorderValue(nu_noise_utils_NoiseMap* self, float borderValue);
void nu_noise_utils_NoiseMap_SetSize(nu_noise_utils_NoiseMap* self, int width, int height);
void nu_noise_utils_NoiseMap_SetValue(nu_noise_utils_NoiseMap* self, int x, int y, float value);
void nu_noise_utils_NoiseMap_TakeOwnership(nu_noise_utils_NoiseMap* self, nu_noise_utils_NoiseMap* source);
void nu_noise_utils_NoiseMap_dispose(nu_noise_utils_NoiseMap* self);
/* END CLASS: NoiseMap */

/* BEGIN CLASS: Image */
nu_noise_utils_Image* nu_noise_utils_Image_new_1();
nu_noise_utils_Image* nu_noise_utils_Image_new_2(int width, int height);
nu_noise_utils_Image* nu_noise_utils_Image_new_3(nu_noise_utils_Image* rhs);
void nu_noise_utils_Image_Clear(nu_noise_utils_Image* self, nu_noise_utils_Color* value);
nu_noise_utils_Color* nu_noise_utils_Image_GetBorderValue(nu_noise_utils_Image* self);
nu_noise_utils_Color* nu_noise_utils_Image_GetConstSlabPtr_1(nu_noise_utils_Image* self);
nu_noise_utils_Color* nu_noise_utils_Image_GetConstSlabPtr_2(nu_noise_utils_Image* self, int row);
nu_noise_utils_Color* nu_noise_utils_Image_GetConstSlabPtr_3(nu_noise_utils_Image* self, int x, int y);
int nu_noise_utils_Image_GetHeight(nu_noise_utils_Image* self);
size_t nu_noise_utils_Image_GetMemUsed(nu_noise_utils_Image* self);
nu_noise_utils_Color* nu_noise_utils_Image_GetSlabPtr_1(nu_noise_utils_Image* self);
nu_noise_utils_Color* nu_noise_utils_Image_GetSlabPtr_2(nu_noise_utils_Image* self, int row);
nu_noise_utils_Color* nu_noise_utils_Image_GetSlabPtr_3(nu_noise_utils_Image* self, int x, int y);
int nu_noise_utils_Image_GetStride(nu_noise_utils_Image* self);
nu_noise_utils_Color* nu_noise_utils_Image_GetValue(nu_noise_utils_Image* self, int x, int y);
int nu_noise_utils_Image_GetWidth(nu_noise_utils_Image* self);
void nu_noise_utils_Image_ReclaimMem(nu_noise_utils_Image* self);
void nu_noise_utils_Image_SetBorderValue(nu_noise_utils_Image* self, nu_noise_utils_Color* borderValue);
void nu_noise_utils_Image_SetSize(nu_noise_utils_Image* self, int width, int height);
void nu_noise_utils_Image_SetValue(nu_noise_utils_Image* self, int x, int y, nu_noise_utils_Color* value);
void nu_noise_utils_Image_TakeOwnership(nu_noise_utils_Image* self, nu_noise_utils_Image* source);
void nu_noise_utils_Image_dispose(nu_noise_utils_Image* self);
/* END CLASS: Image */

/* BEGIN CLASS: WriterBMP */
nu_noise_utils_WriterBMP* nu_noise_utils_WriterBMP_new();
char* nu_noise_utils_WriterBMP_GetDestFilename(nu_noise_utils_WriterBMP* self);
void nu_noise_utils_WriterBMP_SetDestFilename(nu_noise_utils_WriterBMP* self, char* filename);
void nu_noise_utils_WriterBMP_SetSourceImage(nu_noise_utils_WriterBMP* self, nu_noise_utils_Image* sourceImage);
void nu_noise_utils_WriterBMP_WriteDestFile(nu_noise_utils_WriterBMP* self);
void nu_noise_utils_WriterBMP_dispose(nu_noise_utils_WriterBMP* self);
/* END CLASS: WriterBMP */

/* BEGIN CLASS: WriterTER */
nu_noise_utils_WriterTER* nu_noise_utils_WriterTER_new();
char* nu_noise_utils_WriterTER_GetDestFilename(nu_noise_utils_WriterTER* self);
float nu_noise_utils_WriterTER_GetMetersPerPoint(nu_noise_utils_WriterTER* self);
void nu_noise_utils_WriterTER_SetDestFilename(nu_noise_utils_WriterTER* self, char* filename);
void nu_noise_utils_WriterTER_SetMetersPerPoint(nu_noise_utils_WriterTER* self, float metersPerPoint);
void nu_noise_utils_WriterTER_SetSourceNoiseMap(nu_noise_utils_WriterTER* self, nu_noise_utils_NoiseMap* sourceNoiseMap);
void nu_noise_utils_WriterTER_WriteDestFile(nu_noise_utils_WriterTER* self);
void nu_noise_utils_WriterTER_dispose(nu_noise_utils_WriterTER* self);
/* END CLASS: WriterTER */

/* BEGIN CLASS: NoiseMapBuilder */
void nu_noise_utils_NoiseMapBuilder_Build(nu_noise_utils_NoiseMapBuilder* self);
double nu_noise_utils_NoiseMapBuilder_GetDestHeight(nu_noise_utils_NoiseMapBuilder* self);
double nu_noise_utils_NoiseMapBuilder_GetDestWidth(nu_noise_utils_NoiseMapBuilder* self);
void nu_noise_utils_NoiseMapBuilder_SetCallback(nu_noise_utils_NoiseMapBuilder* self, nu_noise_utils_NoiseMapCallback pCallback);
void nu_noise_utils_NoiseMapBuilder_SetDestNoiseMap(nu_noise_utils_NoiseMapBuilder* self, nu_noise_utils_NoiseMap* destNoiseMap);
void nu_noise_utils_NoiseMapBuilder_SetSourceModule(nu_noise_utils_NoiseMapBuilder* self, no_noise_module_Module* sourceModule);
void nu_noise_utils_NoiseMapBuilder_SetDestSize(nu_noise_utils_NoiseMapBuilder* self, int destWidth, int destHeight);
/* END CLASS: NoiseMapBuilder */

/* BEGIN CLASS: NoiseMapBuilderCylinder */
nu_noise_utils_NoiseMapBuilderCylinder* nu_noise_utils_NoiseMapBuilderCylinder_new();
void nu_noise_utils_NoiseMapBuilderCylinder_Build(nu_noise_utils_NoiseMapBuilderCylinder* self);
double nu_noise_utils_NoiseMapBuilderCylinder_GetLowerAngleBound(nu_noise_utils_NoiseMapBuilderCylinder* self);
double nu_noise_utils_NoiseMapBuilderCylinder_GetLowerHeightBound(nu_noise_utils_NoiseMapBuilderCylinder* self);
double nu_noise_utils_NoiseMapBuilderCylinder_GetUpperAngleBound(nu_noise_utils_NoiseMapBuilderCylinder* self);
double nu_noise_utils_NoiseMapBuilderCylinder_GetUpperHeightBound(nu_noise_utils_NoiseMapBuilderCylinder* self);
void nu_noise_utils_NoiseMapBuilderCylinder_SetBounds(nu_noise_utils_NoiseMapBuilderCylinder* self, double lowerAngleBound, double upperAngleBound, double lowerHeightBound, double upperHeightBound);
void nu_noise_utils_NoiseMapBuilderCylinder_dispose(nu_noise_utils_NoiseMapBuilderCylinder* self);
/* END CLASS: NoiseMapBuilderCylinder */

/* BEGIN CLASS: NoiseMapBuilderPlane */
nu_noise_utils_NoiseMapBuilderPlane* nu_noise_utils_NoiseMapBuilderPlane_new();
void nu_noise_utils_NoiseMapBuilderPlane_Build(nu_noise_utils_NoiseMapBuilderPlane* self);
void nu_noise_utils_NoiseMapBuilderPlane_EnableSeamless(nu_noise_utils_NoiseMapBuilderPlane* self, bool enable);
double nu_noise_utils_NoiseMapBuilderPlane_GetLowerXBound(nu_noise_utils_NoiseMapBuilderPlane* self);
double nu_noise_utils_NoiseMapBuilderPlane_GetLowerZBound(nu_noise_utils_NoiseMapBuilderPlane* self);
double nu_noise_utils_NoiseMapBuilderPlane_GetUpperXBound(nu_noise_utils_NoiseMapBuilderPlane* self);
double nu_noise_utils_NoiseMapBuilderPlane_GetUpperZBound(nu_noise_utils_NoiseMapBuilderPlane* self);
bool nu_noise_utils_NoiseMapBuilderPlane_IsSeamlessEnabled(nu_noise_utils_NoiseMapBuilderPlane* self);
void nu_noise_utils_NoiseMapBuilderPlane_SetBounds(nu_noise_utils_NoiseMapBuilderPlane* self, double lowerXBound, double upperXBound, double lowerZBound, double upperZBound);
void nu_noise_utils_NoiseMapBuilderPlane_dispose(nu_noise_utils_NoiseMapBuilderPlane* self);
/* END CLASS: NoiseMapBuilderPlane */

/* BEGIN CLASS: NoiseMapBuilderSphere */
nu_noise_utils_NoiseMapBuilderSphere* nu_noise_utils_NoiseMapBuilderSphere_new();
void nu_noise_utils_NoiseMapBuilderSphere_Build(nu_noise_utils_NoiseMapBuilderSphere* self);
double nu_noise_utils_NoiseMapBuilderSphere_GetEastLonBound(nu_noise_utils_NoiseMapBuilderSphere* self);
double nu_noise_utils_NoiseMapBuilderSphere_GetNorthLatBound(nu_noise_utils_NoiseMapBuilderSphere* self);
double nu_noise_utils_NoiseMapBuilderSphere_GetSouthLatBound(nu_noise_utils_NoiseMapBuilderSphere* self);
double nu_noise_utils_NoiseMapBuilderSphere_GetWestLonBound(nu_noise_utils_NoiseMapBuilderSphere* self);
void nu_noise_utils_NoiseMapBuilderSphere_SetBounds(nu_noise_utils_NoiseMapBuilderSphere* self, double southLatBound, double northLatBound, double westLonBound, double eastLonBound);
void nu_noise_utils_NoiseMapBuilderSphere_dispose(nu_noise_utils_NoiseMapBuilderSphere* self);
/* END CLASS: NoiseMapBuilderSphere */

/* BEGIN CLASS: RendererImage */
nu_noise_utils_RendererImage* nu_noise_utils_RendererImage_new();
void nu_noise_utils_RendererImage_AddGradientPoint(nu_noise_utils_RendererImage* self, double gradientPos, nu_noise_utils_Color* gradientColor);
void nu_noise_utils_RendererImage_BuildGrayscaleGradient(nu_noise_utils_RendererImage* self);
void nu_noise_utils_RendererImage_BuildTerrainGradient(nu_noise_utils_RendererImage* self);
void nu_noise_utils_RendererImage_ClearGradient(nu_noise_utils_RendererImage* self);
void nu_noise_utils_RendererImage_EnableLight(nu_noise_utils_RendererImage* self, bool enable);
void nu_noise_utils_RendererImage_EnableWrap(nu_noise_utils_RendererImage* self, bool enable);
double nu_noise_utils_RendererImage_GetLightAzimuth(nu_noise_utils_RendererImage* self);
double nu_noise_utils_RendererImage_GetLightBrightness(nu_noise_utils_RendererImage* self);
nu_noise_utils_Color* nu_noise_utils_RendererImage_GetLightColor(nu_noise_utils_RendererImage* self);
double nu_noise_utils_RendererImage_GetLightContrast(nu_noise_utils_RendererImage* self);
double nu_noise_utils_RendererImage_GetLightElev(nu_noise_utils_RendererImage* self);
double nu_noise_utils_RendererImage_GetLightIntensity(nu_noise_utils_RendererImage* self);
bool nu_noise_utils_RendererImage_IsLightEnabled(nu_noise_utils_RendererImage* self);
bool nu_noise_utils_RendererImage_IsWrapEnabled(nu_noise_utils_RendererImage* self);
void nu_noise_utils_RendererImage_Render(nu_noise_utils_RendererImage* self);
void nu_noise_utils_RendererImage_SetBackgroundImage(nu_noise_utils_RendererImage* self, nu_noise_utils_Image* backgroundImage);
void nu_noise_utils_RendererImage_SetDestImage(nu_noise_utils_RendererImage* self, nu_noise_utils_Image* destImage);
void nu_noise_utils_RendererImage_SetLightAzimuth(nu_noise_utils_RendererImage* self, double lightAzimuth);
void nu_noise_utils_RendererImage_SetLightBrightness(nu_noise_utils_RendererImage* self, double lightBrightness);
void nu_noise_utils_RendererImage_SetLightColor(nu_noise_utils_RendererImage* self, nu_noise_utils_Color* lightColor);
void nu_noise_utils_RendererImage_SetLightContrast(nu_noise_utils_RendererImage* self, double lightContrast);
void nu_noise_utils_RendererImage_SetLightElev(nu_noise_utils_RendererImage* self, double lightElev);
void nu_noise_utils_RendererImage_SetLightIntensity(nu_noise_utils_RendererImage* self, double lightIntensity);
void nu_noise_utils_RendererImage_SetSourceNoiseMap(nu_noise_utils_RendererImage* self, nu_noise_utils_NoiseMap* sourceNoiseMap);
void nu_noise_utils_RendererImage_dispose(nu_noise_utils_RendererImage* self);
/* END CLASS: RendererImage */

/* BEGIN CLASS: RendererNormalMap */
nu_noise_utils_RendererNormalMap* nu_noise_utils_RendererNormalMap_new();
void nu_noise_utils_RendererNormalMap_EnableWrap(nu_noise_utils_RendererNormalMap* self, bool enable);
double nu_noise_utils_RendererNormalMap_GetBumpHeight(nu_noise_utils_RendererNormalMap* self);
bool nu_noise_utils_RendererNormalMap_IsWrapEnabled(nu_noise_utils_RendererNormalMap* self);
void nu_noise_utils_RendererNormalMap_Render(nu_noise_utils_RendererNormalMap* self);
void nu_noise_utils_RendererNormalMap_SetBumpHeight(nu_noise_utils_RendererNormalMap* self, double bumpHeight);
void nu_noise_utils_RendererNormalMap_SetDestImage(nu_noise_utils_RendererNormalMap* self, nu_noise_utils_Image* destImage);
void nu_noise_utils_RendererNormalMap_SetSourceNoiseMap(nu_noise_utils_RendererNormalMap* self, nu_noise_utils_NoiseMap* sourceNoiseMap);
void nu_noise_utils_RendererNormalMap_dispose(nu_noise_utils_RendererNormalMap* self);
/* END CLASS: RendererNormalMap */


}
	
#endif /* NOISEUTILS_BINDINGS*/