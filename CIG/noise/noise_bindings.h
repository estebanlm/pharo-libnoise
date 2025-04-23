#ifndef NOISE_BINDINGS
#define NOISE_BINDINGS


#include <noise.h>

extern "C" {

/* BEGIN SECTION: DECLARATIONS */
typedef unsigned int no_noise_uint;
typedef unsigned int no_noise_uint32;
typedef unsigned short no_noise_uint16;
typedef unsigned char no_noise_uint8;
typedef int no_noise_int32;
typedef short no_noise_int16;
typedef char no_noise_int8;
typedef void no_noise_Exception;
typedef void no_noise_ExceptionInvalidParam;
typedef void no_noise_ExceptionNoModule;
typedef void no_noise_ExceptionOutOfMemory;
typedef void no_noise_ExceptionUnknown;
typedef noise::NoiseQuality no_noise_NoiseQuality;
typedef void no_noise_module_Module;
typedef void no_noise_module_Add;
typedef void no_noise_module_Abs;
typedef void no_noise_module_Billow;
typedef void no_noise_module_Blend;
typedef void no_noise_module_Cache;
typedef void no_noise_module_Checkerboard;
typedef void no_noise_module_Clamp;
typedef void no_noise_module_Const;
typedef void no_noise_module_Curve;
typedef void no_noise_module_Cylinders;
typedef void no_noise_module_Displace;
typedef void no_noise_module_Exponent;
typedef void no_noise_module_Invert;
typedef void no_noise_module_Max;
typedef void no_noise_module_Min;
typedef void no_noise_module_Multiply;
typedef void no_noise_module_Perlin;
typedef void no_noise_module_Power;
typedef void no_noise_module_RidgedMulti;
typedef void no_noise_module_RotatePoint;
typedef void no_noise_module_ScaleBias;
typedef void no_noise_module_ScalePoint;
typedef void no_noise_module_Select;
typedef void no_noise_module_Spheres;
typedef void no_noise_module_Terrace;
typedef void no_noise_module_TranslatePoint;
typedef void no_noise_module_Turbulence;
typedef void no_noise_module_Voronoi;
typedef void no_noise_model_Cylinder;
typedef void no_noise_model_Line;
typedef void no_noise_model_Plane;
typedef void no_noise_model_Sphere;
/* END SECTION: DECLARATIONS */

/* BEGIN CLASS: Exception */
void no_noise_Exception_dispose(no_noise_Exception* self);
/* END CLASS: Exception */

/* BEGIN CLASS: ExceptionInvalidParam */
void no_noise_ExceptionInvalidParam_dispose(no_noise_ExceptionInvalidParam* self);
/* END CLASS: ExceptionInvalidParam */

/* BEGIN CLASS: ExceptionNoModule */
void no_noise_ExceptionNoModule_dispose(no_noise_ExceptionNoModule* self);
/* END CLASS: ExceptionNoModule */

/* BEGIN CLASS: ExceptionOutOfMemory */
void no_noise_ExceptionOutOfMemory_dispose(no_noise_ExceptionOutOfMemory* self);
/* END CLASS: ExceptionOutOfMemory */

/* BEGIN CLASS: ExceptionUnknown */
void no_noise_ExceptionUnknown_dispose(no_noise_ExceptionUnknown* self);
/* END CLASS: ExceptionUnknown */

double no_noise_GradientCoherentNoise3D(double x, double y, double z, int seed, no_noise_NoiseQuality noiseQuality);
double no_noise_GradientNoise3D(double fx, double fy, double fz, int ix, int iy, int iz, int seed);
int no_noise_IntValueNoise3D(int x, int y, int z, int seed);
double no_noise_MakeInt32Range(double n);
double no_noise_ValueCoherentNoise3D(double x, double y, double z, int seed, no_noise_NoiseQuality noiseQuality);
double no_noise_ValueNoise3D(int x, int y, int z, int seed);
/* BEGIN CLASS: Module */
no_noise_module_Module* no_noise_module_Module_GetSourceModule(no_noise_module_Module* self, int index);
int no_noise_module_Module_GetSourceModuleCount(no_noise_module_Module* self);
double no_noise_module_Module_GetValue(no_noise_module_Module* self, double x, double y, double z);
void no_noise_module_Module_SetSourceModule(no_noise_module_Module* self, int index, no_noise_module_Module* sourceModule);
/* END CLASS: Module */

/* BEGIN CLASS: Add */
no_noise_module_Add* no_noise_module_Add_new();
int no_noise_module_Add_GetSourceModuleCount(no_noise_module_Add* self);
double no_noise_module_Add_GetValue(no_noise_module_Add* self, double x, double y, double z);
void no_noise_module_Add_dispose(no_noise_module_Add* self);
/* END CLASS: Add */

/* BEGIN CLASS: Abs */
no_noise_module_Abs* no_noise_module_Abs_new();
int no_noise_module_Abs_GetSourceModuleCount(no_noise_module_Abs* self);
double no_noise_module_Abs_GetValue(no_noise_module_Abs* self, double x, double y, double z);
void no_noise_module_Abs_dispose(no_noise_module_Abs* self);
/* END CLASS: Abs */

/* BEGIN CLASS: Billow */
no_noise_module_Billow* no_noise_module_Billow_new();
double no_noise_module_Billow_GetFrequency(no_noise_module_Billow* self);
double no_noise_module_Billow_GetLacunarity(no_noise_module_Billow* self);
no_noise_NoiseQuality no_noise_module_Billow_GetNoiseQuality(no_noise_module_Billow* self);
int no_noise_module_Billow_GetOctaveCount(no_noise_module_Billow* self);
double no_noise_module_Billow_GetPersistence(no_noise_module_Billow* self);
int no_noise_module_Billow_GetSeed(no_noise_module_Billow* self);
int no_noise_module_Billow_GetSourceModuleCount(no_noise_module_Billow* self);
double no_noise_module_Billow_GetValue(no_noise_module_Billow* self, double x, double y, double z);
void no_noise_module_Billow_SetFrequency(no_noise_module_Billow* self, double frequency);
void no_noise_module_Billow_SetLacunarity(no_noise_module_Billow* self, double lacunarity);
void no_noise_module_Billow_SetNoiseQuality(no_noise_module_Billow* self, no_noise_NoiseQuality noiseQuality);
void no_noise_module_Billow_SetOctaveCount(no_noise_module_Billow* self, int octaveCount);
void no_noise_module_Billow_SetPersistence(no_noise_module_Billow* self, double persistence);
void no_noise_module_Billow_SetSeed(no_noise_module_Billow* self, int seed);
void no_noise_module_Billow_dispose(no_noise_module_Billow* self);
/* END CLASS: Billow */

/* BEGIN CLASS: Blend */
no_noise_module_Blend* no_noise_module_Blend_new();
no_noise_module_Module* no_noise_module_Blend_GetControlModule(no_noise_module_Blend* self);
int no_noise_module_Blend_GetSourceModuleCount(no_noise_module_Blend* self);
double no_noise_module_Blend_GetValue(no_noise_module_Blend* self, double x, double y, double z);
void no_noise_module_Blend_SetControlModule(no_noise_module_Blend* self, no_noise_module_Module* controlModule);
void no_noise_module_Blend_dispose(no_noise_module_Blend* self);
/* END CLASS: Blend */

/* BEGIN CLASS: Cache */
no_noise_module_Cache* no_noise_module_Cache_new();
int no_noise_module_Cache_GetSourceModuleCount(no_noise_module_Cache* self);
double no_noise_module_Cache_GetValue(no_noise_module_Cache* self, double x, double y, double z);
void no_noise_module_Cache_SetSourceModule(no_noise_module_Cache* self, int index, no_noise_module_Module* sourceModule);
void no_noise_module_Cache_dispose(no_noise_module_Cache* self);
/* END CLASS: Cache */

/* BEGIN CLASS: Checkerboard */
no_noise_module_Checkerboard* no_noise_module_Checkerboard_new();
int no_noise_module_Checkerboard_GetSourceModuleCount(no_noise_module_Checkerboard* self);
double no_noise_module_Checkerboard_GetValue(no_noise_module_Checkerboard* self, double x, double y, double z);
void no_noise_module_Checkerboard_dispose(no_noise_module_Checkerboard* self);
/* END CLASS: Checkerboard */

/* BEGIN CLASS: Clamp */
no_noise_module_Clamp* no_noise_module_Clamp_new();
double no_noise_module_Clamp_GetLowerBound(no_noise_module_Clamp* self);
int no_noise_module_Clamp_GetSourceModuleCount(no_noise_module_Clamp* self);
double no_noise_module_Clamp_GetUpperBound(no_noise_module_Clamp* self);
double no_noise_module_Clamp_GetValue(no_noise_module_Clamp* self, double x, double y, double z);
void no_noise_module_Clamp_SetBounds(no_noise_module_Clamp* self, double lowerBound, double upperBound);
void no_noise_module_Clamp_dispose(no_noise_module_Clamp* self);
/* END CLASS: Clamp */

/* BEGIN CLASS: Const */
no_noise_module_Const* no_noise_module_Const_new();
double no_noise_module_Const_GetConstValue(no_noise_module_Const* self);
int no_noise_module_Const_GetSourceModuleCount(no_noise_module_Const* self);
double no_noise_module_Const_GetValue(no_noise_module_Const* self, double x, double y, double z);
void no_noise_module_Const_SetConstValue(no_noise_module_Const* self, double constValue);
void no_noise_module_Const_dispose(no_noise_module_Const* self);
/* END CLASS: Const */

struct no_noise_module_ControlPoint {
	double inputValue;
	double outputValue;
};
/* BEGIN CLASS: Curve */
no_noise_module_Curve* no_noise_module_Curve_new();
void no_noise_module_Curve_AddControlPoint(no_noise_module_Curve* self, double inputValue, double outputValue);
void no_noise_module_Curve_ClearAllControlPoints(no_noise_module_Curve* self);
struct no_noise_module_ControlPoint* no_noise_module_Curve_GetControlPointArray(no_noise_module_Curve* self);
int no_noise_module_Curve_GetControlPointCount(no_noise_module_Curve* self);
int no_noise_module_Curve_GetSourceModuleCount(no_noise_module_Curve* self);
double no_noise_module_Curve_GetValue(no_noise_module_Curve* self, double x, double y, double z);
void no_noise_module_Curve_dispose(no_noise_module_Curve* self);
/* END CLASS: Curve */

/* BEGIN CLASS: Cylinders */
no_noise_module_Cylinders* no_noise_module_Cylinders_new();
double no_noise_module_Cylinders_GetFrequency(no_noise_module_Cylinders* self);
int no_noise_module_Cylinders_GetSourceModuleCount(no_noise_module_Cylinders* self);
double no_noise_module_Cylinders_GetValue(no_noise_module_Cylinders* self, double x, double y, double z);
void no_noise_module_Cylinders_SetFrequency(no_noise_module_Cylinders* self, double frequency);
void no_noise_module_Cylinders_dispose(no_noise_module_Cylinders* self);
/* END CLASS: Cylinders */

/* BEGIN CLASS: Displace */
no_noise_module_Displace* no_noise_module_Displace_new();
int no_noise_module_Displace_GetSourceModuleCount(no_noise_module_Displace* self);
double no_noise_module_Displace_GetValue(no_noise_module_Displace* self, double x, double y, double z);
no_noise_module_Module* no_noise_module_Displace_GetXDisplaceModule(no_noise_module_Displace* self);
no_noise_module_Module* no_noise_module_Displace_GetYDisplaceModule(no_noise_module_Displace* self);
no_noise_module_Module* no_noise_module_Displace_GetZDisplaceModule(no_noise_module_Displace* self);
void no_noise_module_Displace_SetDisplaceModules(no_noise_module_Displace* self, no_noise_module_Module* xDisplaceModule, no_noise_module_Module* yDisplaceModule, no_noise_module_Module* zDisplaceModule);
void no_noise_module_Displace_SetXDisplaceModule(no_noise_module_Displace* self, no_noise_module_Module* xDisplaceModule);
void no_noise_module_Displace_SetYDisplaceModule(no_noise_module_Displace* self, no_noise_module_Module* yDisplaceModule);
void no_noise_module_Displace_SetZDisplaceModule(no_noise_module_Displace* self, no_noise_module_Module* zDisplaceModule);
void no_noise_module_Displace_dispose(no_noise_module_Displace* self);
/* END CLASS: Displace */

/* BEGIN CLASS: Exponent */
no_noise_module_Exponent* no_noise_module_Exponent_new();
double no_noise_module_Exponent_GetExponent(no_noise_module_Exponent* self);
int no_noise_module_Exponent_GetSourceModuleCount(no_noise_module_Exponent* self);
double no_noise_module_Exponent_GetValue(no_noise_module_Exponent* self, double x, double y, double z);
void no_noise_module_Exponent_SetExponent(no_noise_module_Exponent* self, double exponent);
void no_noise_module_Exponent_dispose(no_noise_module_Exponent* self);
/* END CLASS: Exponent */

/* BEGIN CLASS: Invert */
no_noise_module_Invert* no_noise_module_Invert_new();
int no_noise_module_Invert_GetSourceModuleCount(no_noise_module_Invert* self);
double no_noise_module_Invert_GetValue(no_noise_module_Invert* self, double x, double y, double z);
void no_noise_module_Invert_dispose(no_noise_module_Invert* self);
/* END CLASS: Invert */

/* BEGIN CLASS: Max */
no_noise_module_Max* no_noise_module_Max_new();
int no_noise_module_Max_GetSourceModuleCount(no_noise_module_Max* self);
double no_noise_module_Max_GetValue(no_noise_module_Max* self, double x, double y, double z);
void no_noise_module_Max_dispose(no_noise_module_Max* self);
/* END CLASS: Max */

/* BEGIN CLASS: Min */
no_noise_module_Min* no_noise_module_Min_new();
int no_noise_module_Min_GetSourceModuleCount(no_noise_module_Min* self);
double no_noise_module_Min_GetValue(no_noise_module_Min* self, double x, double y, double z);
void no_noise_module_Min_dispose(no_noise_module_Min* self);
/* END CLASS: Min */

/* BEGIN CLASS: Multiply */
no_noise_module_Multiply* no_noise_module_Multiply_new();
int no_noise_module_Multiply_GetSourceModuleCount(no_noise_module_Multiply* self);
double no_noise_module_Multiply_GetValue(no_noise_module_Multiply* self, double x, double y, double z);
void no_noise_module_Multiply_dispose(no_noise_module_Multiply* self);
/* END CLASS: Multiply */

/* BEGIN CLASS: Perlin */
no_noise_module_Perlin* no_noise_module_Perlin_new();
double no_noise_module_Perlin_GetFrequency(no_noise_module_Perlin* self);
double no_noise_module_Perlin_GetLacunarity(no_noise_module_Perlin* self);
no_noise_NoiseQuality no_noise_module_Perlin_GetNoiseQuality(no_noise_module_Perlin* self);
int no_noise_module_Perlin_GetOctaveCount(no_noise_module_Perlin* self);
double no_noise_module_Perlin_GetPersistence(no_noise_module_Perlin* self);
int no_noise_module_Perlin_GetSeed(no_noise_module_Perlin* self);
int no_noise_module_Perlin_GetSourceModuleCount(no_noise_module_Perlin* self);
double no_noise_module_Perlin_GetValue(no_noise_module_Perlin* self, double x, double y, double z);
void no_noise_module_Perlin_SetFrequency(no_noise_module_Perlin* self, double frequency);
void no_noise_module_Perlin_SetLacunarity(no_noise_module_Perlin* self, double lacunarity);
void no_noise_module_Perlin_SetNoiseQuality(no_noise_module_Perlin* self, no_noise_NoiseQuality noiseQuality);
void no_noise_module_Perlin_SetOctaveCount(no_noise_module_Perlin* self, int octaveCount);
void no_noise_module_Perlin_SetPersistence(no_noise_module_Perlin* self, double persistence);
void no_noise_module_Perlin_SetSeed(no_noise_module_Perlin* self, int seed);
void no_noise_module_Perlin_dispose(no_noise_module_Perlin* self);
/* END CLASS: Perlin */

/* BEGIN CLASS: Power */
no_noise_module_Power* no_noise_module_Power_new();
int no_noise_module_Power_GetSourceModuleCount(no_noise_module_Power* self);
double no_noise_module_Power_GetValue(no_noise_module_Power* self, double x, double y, double z);
void no_noise_module_Power_dispose(no_noise_module_Power* self);
/* END CLASS: Power */

/* BEGIN CLASS: RidgedMulti */
no_noise_module_RidgedMulti* no_noise_module_RidgedMulti_new();
double no_noise_module_RidgedMulti_GetFrequency(no_noise_module_RidgedMulti* self);
double no_noise_module_RidgedMulti_GetLacunarity(no_noise_module_RidgedMulti* self);
no_noise_NoiseQuality no_noise_module_RidgedMulti_GetNoiseQuality(no_noise_module_RidgedMulti* self);
int no_noise_module_RidgedMulti_GetOctaveCount(no_noise_module_RidgedMulti* self);
int no_noise_module_RidgedMulti_GetSeed(no_noise_module_RidgedMulti* self);
int no_noise_module_RidgedMulti_GetSourceModuleCount(no_noise_module_RidgedMulti* self);
double no_noise_module_RidgedMulti_GetValue(no_noise_module_RidgedMulti* self, double x, double y, double z);
void no_noise_module_RidgedMulti_SetFrequency(no_noise_module_RidgedMulti* self, double frequency);
void no_noise_module_RidgedMulti_SetLacunarity(no_noise_module_RidgedMulti* self, double lacunarity);
void no_noise_module_RidgedMulti_SetNoiseQuality(no_noise_module_RidgedMulti* self, no_noise_NoiseQuality noiseQuality);
void no_noise_module_RidgedMulti_SetOctaveCount(no_noise_module_RidgedMulti* self, int octaveCount);
void no_noise_module_RidgedMulti_SetSeed(no_noise_module_RidgedMulti* self, int seed);
void no_noise_module_RidgedMulti_dispose(no_noise_module_RidgedMulti* self);
/* END CLASS: RidgedMulti */

/* BEGIN CLASS: RotatePoint */
no_noise_module_RotatePoint* no_noise_module_RotatePoint_new();
int no_noise_module_RotatePoint_GetSourceModuleCount(no_noise_module_RotatePoint* self);
double no_noise_module_RotatePoint_GetValue(no_noise_module_RotatePoint* self, double x, double y, double z);
double no_noise_module_RotatePoint_GetXAngle(no_noise_module_RotatePoint* self);
double no_noise_module_RotatePoint_GetYAngle(no_noise_module_RotatePoint* self);
double no_noise_module_RotatePoint_GetZAngle(no_noise_module_RotatePoint* self);
void no_noise_module_RotatePoint_SetAngles(no_noise_module_RotatePoint* self, double xAngle, double yAngle, double zAngle);
void no_noise_module_RotatePoint_SetXAngle(no_noise_module_RotatePoint* self, double xAngle);
void no_noise_module_RotatePoint_SetYAngle(no_noise_module_RotatePoint* self, double yAngle);
void no_noise_module_RotatePoint_SetZAngle(no_noise_module_RotatePoint* self, double zAngle);
void no_noise_module_RotatePoint_dispose(no_noise_module_RotatePoint* self);
/* END CLASS: RotatePoint */

/* BEGIN CLASS: ScaleBias */
no_noise_module_ScaleBias* no_noise_module_ScaleBias_new();
double no_noise_module_ScaleBias_GetBias(no_noise_module_ScaleBias* self);
double no_noise_module_ScaleBias_GetScale(no_noise_module_ScaleBias* self);
int no_noise_module_ScaleBias_GetSourceModuleCount(no_noise_module_ScaleBias* self);
double no_noise_module_ScaleBias_GetValue(no_noise_module_ScaleBias* self, double x, double y, double z);
void no_noise_module_ScaleBias_SetBias(no_noise_module_ScaleBias* self, double bias);
void no_noise_module_ScaleBias_SetScale(no_noise_module_ScaleBias* self, double scale);
void no_noise_module_ScaleBias_dispose(no_noise_module_ScaleBias* self);
/* END CLASS: ScaleBias */

/* BEGIN CLASS: ScalePoint */
no_noise_module_ScalePoint* no_noise_module_ScalePoint_new();
int no_noise_module_ScalePoint_GetSourceModuleCount(no_noise_module_ScalePoint* self);
double no_noise_module_ScalePoint_GetValue(no_noise_module_ScalePoint* self, double x, double y, double z);
double no_noise_module_ScalePoint_GetXScale(no_noise_module_ScalePoint* self);
double no_noise_module_ScalePoint_GetYScale(no_noise_module_ScalePoint* self);
double no_noise_module_ScalePoint_GetZScale(no_noise_module_ScalePoint* self);
void no_noise_module_ScalePoint_SetScale_1(no_noise_module_ScalePoint* self, double scale);
void no_noise_module_ScalePoint_SetScale_2(no_noise_module_ScalePoint* self, double xScale, double yScale, double zScale);
void no_noise_module_ScalePoint_SetXScale(no_noise_module_ScalePoint* self, double xScale);
void no_noise_module_ScalePoint_SetYScale(no_noise_module_ScalePoint* self, double yScale);
void no_noise_module_ScalePoint_SetZScale(no_noise_module_ScalePoint* self, double zScale);
void no_noise_module_ScalePoint_dispose(no_noise_module_ScalePoint* self);
/* END CLASS: ScalePoint */

/* BEGIN CLASS: Select */
no_noise_module_Select* no_noise_module_Select_new();
no_noise_module_Module* no_noise_module_Select_GetControlModule(no_noise_module_Select* self);
double no_noise_module_Select_GetEdgeFalloff(no_noise_module_Select* self);
double no_noise_module_Select_GetLowerBound(no_noise_module_Select* self);
int no_noise_module_Select_GetSourceModuleCount(no_noise_module_Select* self);
double no_noise_module_Select_GetUpperBound(no_noise_module_Select* self);
double no_noise_module_Select_GetValue(no_noise_module_Select* self, double x, double y, double z);
void no_noise_module_Select_SetBounds(no_noise_module_Select* self, double lowerBound, double upperBound);
void no_noise_module_Select_SetControlModule(no_noise_module_Select* self, no_noise_module_Module* controlModule);
void no_noise_module_Select_SetEdgeFalloff(no_noise_module_Select* self, double edgeFalloff);
void no_noise_module_Select_dispose(no_noise_module_Select* self);
/* END CLASS: Select */

/* BEGIN CLASS: Spheres */
no_noise_module_Spheres* no_noise_module_Spheres_new();
double no_noise_module_Spheres_GetFrequency(no_noise_module_Spheres* self);
int no_noise_module_Spheres_GetSourceModuleCount(no_noise_module_Spheres* self);
double no_noise_module_Spheres_GetValue(no_noise_module_Spheres* self, double x, double y, double z);
void no_noise_module_Spheres_SetFrequency(no_noise_module_Spheres* self, double frequency);
void no_noise_module_Spheres_dispose(no_noise_module_Spheres* self);
/* END CLASS: Spheres */

/* BEGIN CLASS: Terrace */
no_noise_module_Terrace* no_noise_module_Terrace_new();
void no_noise_module_Terrace_AddControlPoint(no_noise_module_Terrace* self, double value);
void no_noise_module_Terrace_ClearAllControlPoints(no_noise_module_Terrace* self);
const double* no_noise_module_Terrace_GetControlPointArray(no_noise_module_Terrace* self);
int no_noise_module_Terrace_GetControlPointCount(no_noise_module_Terrace* self);
int no_noise_module_Terrace_GetSourceModuleCount(no_noise_module_Terrace* self);
void no_noise_module_Terrace_InvertTerraces(no_noise_module_Terrace* self, bool invert);
bool no_noise_module_Terrace_IsTerracesInverted(no_noise_module_Terrace* self);
double no_noise_module_Terrace_GetValue(no_noise_module_Terrace* self, double x, double y, double z);
void no_noise_module_Terrace_MakeControlPoints(no_noise_module_Terrace* self, int controlPointCount);
void no_noise_module_Terrace_dispose(no_noise_module_Terrace* self);
/* END CLASS: Terrace */

/* BEGIN CLASS: TranslatePoint */
no_noise_module_TranslatePoint* no_noise_module_TranslatePoint_new();
int no_noise_module_TranslatePoint_GetSourceModuleCount(no_noise_module_TranslatePoint* self);
double no_noise_module_TranslatePoint_GetValue(no_noise_module_TranslatePoint* self, double x, double y, double z);
double no_noise_module_TranslatePoint_GetXTranslation(no_noise_module_TranslatePoint* self);
double no_noise_module_TranslatePoint_GetYTranslation(no_noise_module_TranslatePoint* self);
double no_noise_module_TranslatePoint_GetZTranslation(no_noise_module_TranslatePoint* self);
void no_noise_module_TranslatePoint_SetTranslation_1(no_noise_module_TranslatePoint* self, double translation);
void no_noise_module_TranslatePoint_SetTranslation_2(no_noise_module_TranslatePoint* self, double xTranslation, double yTranslation, double zTranslation);
void no_noise_module_TranslatePoint_SetXTranslation(no_noise_module_TranslatePoint* self, double xTranslation);
void no_noise_module_TranslatePoint_SetYTranslation(no_noise_module_TranslatePoint* self, double yTranslation);
void no_noise_module_TranslatePoint_SetZTranslation(no_noise_module_TranslatePoint* self, double zTranslation);
void no_noise_module_TranslatePoint_dispose(no_noise_module_TranslatePoint* self);
/* END CLASS: TranslatePoint */

/* BEGIN CLASS: Turbulence */
no_noise_module_Turbulence* no_noise_module_Turbulence_new();
double no_noise_module_Turbulence_GetFrequency(no_noise_module_Turbulence* self);
double no_noise_module_Turbulence_GetPower(no_noise_module_Turbulence* self);
int no_noise_module_Turbulence_GetRoughnessCount(no_noise_module_Turbulence* self);
int no_noise_module_Turbulence_GetSeed(no_noise_module_Turbulence* self);
int no_noise_module_Turbulence_GetSourceModuleCount(no_noise_module_Turbulence* self);
double no_noise_module_Turbulence_GetValue(no_noise_module_Turbulence* self, double x, double y, double z);
void no_noise_module_Turbulence_SetFrequency(no_noise_module_Turbulence* self, double frequency);
void no_noise_module_Turbulence_SetPower(no_noise_module_Turbulence* self, double power);
void no_noise_module_Turbulence_SetRoughness(no_noise_module_Turbulence* self, int roughness);
void no_noise_module_Turbulence_SetSeed(no_noise_module_Turbulence* self, int seed);
void no_noise_module_Turbulence_dispose(no_noise_module_Turbulence* self);
/* END CLASS: Turbulence */

/* BEGIN CLASS: Voronoi */
no_noise_module_Voronoi* no_noise_module_Voronoi_new();
void no_noise_module_Voronoi_EnableDistance(no_noise_module_Voronoi* self, bool enable);
double no_noise_module_Voronoi_GetDisplacement(no_noise_module_Voronoi* self);
double no_noise_module_Voronoi_GetFrequency(no_noise_module_Voronoi* self);
int no_noise_module_Voronoi_GetSourceModuleCount(no_noise_module_Voronoi* self);
int no_noise_module_Voronoi_GetSeed(no_noise_module_Voronoi* self);
bool no_noise_module_Voronoi_IsDistanceEnabled(no_noise_module_Voronoi* self);
double no_noise_module_Voronoi_GetValue(no_noise_module_Voronoi* self, double x, double y, double z);
void no_noise_module_Voronoi_SetDisplacement(no_noise_module_Voronoi* self, double displacement);
void no_noise_module_Voronoi_SetFrequency(no_noise_module_Voronoi* self, double frequency);
void no_noise_module_Voronoi_SetSeed(no_noise_module_Voronoi* self, int seed);
void no_noise_module_Voronoi_dispose(no_noise_module_Voronoi* self);
/* END CLASS: Voronoi */

/* BEGIN CLASS: Cylinder */
no_noise_model_Cylinder* no_noise_model_Cylinder_new_1();
no_noise_model_Cylinder* no_noise_model_Cylinder_new_2(no_noise_module_Module* module);
no_noise_module_Module* no_noise_model_Cylinder_GetModule(no_noise_model_Cylinder* self);
double no_noise_model_Cylinder_GetValue(no_noise_model_Cylinder* self, double angle, double height);
void no_noise_model_Cylinder_SetModule(no_noise_model_Cylinder* self, no_noise_module_Module* module);
void no_noise_model_Cylinder_dispose(no_noise_model_Cylinder* self);
/* END CLASS: Cylinder */

/* BEGIN CLASS: Line */
no_noise_model_Line* no_noise_model_Line_new_1();
no_noise_model_Line* no_noise_model_Line_new_2(no_noise_module_Module* module);
bool no_noise_model_Line_GetAttenuate(no_noise_model_Line* self);
no_noise_module_Module* no_noise_model_Line_GetModule(no_noise_model_Line* self);
double no_noise_model_Line_GetValue(no_noise_model_Line* self, double p);
void no_noise_model_Line_SetAttenuate(no_noise_model_Line* self, bool att);
void no_noise_model_Line_SetEndPoint(no_noise_model_Line* self, double x, double y, double z);
void no_noise_model_Line_SetModule(no_noise_model_Line* self, no_noise_module_Module* module);
void no_noise_model_Line_SetStartPoint(no_noise_model_Line* self, double x, double y, double z);
void no_noise_model_Line_dispose(no_noise_model_Line* self);
/* END CLASS: Line */

/* BEGIN CLASS: Plane */
no_noise_model_Plane* no_noise_model_Plane_new_1();
no_noise_model_Plane* no_noise_model_Plane_new_2(no_noise_module_Module* module);
no_noise_module_Module* no_noise_model_Plane_GetModule(no_noise_model_Plane* self);
double no_noise_model_Plane_GetValue(no_noise_model_Plane* self, double x, double z);
void no_noise_model_Plane_SetModule(no_noise_model_Plane* self, no_noise_module_Module* module);
void no_noise_model_Plane_dispose(no_noise_model_Plane* self);
/* END CLASS: Plane */

/* BEGIN CLASS: Sphere */
no_noise_model_Sphere* no_noise_model_Sphere_new_1();
no_noise_model_Sphere* no_noise_model_Sphere_new_2(no_noise_module_Module* module);
no_noise_module_Module* no_noise_model_Sphere_GetModule(no_noise_model_Sphere* self);
double no_noise_model_Sphere_GetValue(no_noise_model_Sphere* self, double lat, double lon);
void no_noise_model_Sphere_SetModule(no_noise_model_Sphere* self, no_noise_module_Module* module);
void no_noise_model_Sphere_dispose(no_noise_model_Sphere* self);
/* END CLASS: Sphere */

int no_noise_ClampValue(int value, int lowerBound, int upperBound);

}
	
#endif /* NOISE_BINDINGS*/