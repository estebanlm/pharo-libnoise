#include "noise_bindings.h"

extern "C" {

/* BEGIN NAMESPACE: noise */

/* BEGIN CLASS: Exception */
void no_noise_Exception_dispose(no_noise_Exception* self) {
	delete (noise::Exception*)self;
}
/* END CLASS: Exception */

/* BEGIN CLASS: ExceptionInvalidParam */
void no_noise_ExceptionInvalidParam_dispose(no_noise_ExceptionInvalidParam* self) {
	delete (noise::ExceptionInvalidParam*)self;
}
/* END CLASS: ExceptionInvalidParam */

/* BEGIN CLASS: ExceptionNoModule */
void no_noise_ExceptionNoModule_dispose(no_noise_ExceptionNoModule* self) {
	delete (noise::ExceptionNoModule*)self;
}
/* END CLASS: ExceptionNoModule */

/* BEGIN CLASS: ExceptionOutOfMemory */
void no_noise_ExceptionOutOfMemory_dispose(no_noise_ExceptionOutOfMemory* self) {
	delete (noise::ExceptionOutOfMemory*)self;
}
/* END CLASS: ExceptionOutOfMemory */

/* BEGIN CLASS: ExceptionUnknown */
void no_noise_ExceptionUnknown_dispose(no_noise_ExceptionUnknown* self) {
	delete (noise::ExceptionUnknown*)self;
}
/* END CLASS: ExceptionUnknown */

double no_noise_GradientCoherentNoise3D(double x, double y, double z, int seed, no_noise_NoiseQuality noiseQuality) {
	return noise::GradientCoherentNoise3D(x, y, z, seed, (noise::NoiseQuality)noiseQuality);
}
double no_noise_GradientNoise3D(double fx, double fy, double fz, int ix, int iy, int iz, int seed) {
	return noise::GradientNoise3D(fx, fy, fz, ix, iy, iz, seed);
}
int no_noise_IntValueNoise3D(int x, int y, int z, int seed) {
	return noise::IntValueNoise3D(x, y, z, seed);
}
double no_noise_MakeInt32Range(double n) {
	return noise::MakeInt32Range(n);
}
double no_noise_ValueCoherentNoise3D(double x, double y, double z, int seed, no_noise_NoiseQuality noiseQuality) {
	return noise::ValueCoherentNoise3D(x, y, z, seed, (noise::NoiseQuality)noiseQuality);
}
double no_noise_ValueNoise3D(int x, int y, int z, int seed) {
	return noise::ValueNoise3D(x, y, z, seed);
}
/* BEGIN NAMESPACE: module */

/* BEGIN CLASS: Module */
no_noise_module_Module* no_noise_module_Module_GetSourceModule(no_noise_module_Module* self, int index) {
	return (no_noise_module_Module*)&(((noise::module::Module*)self)->GetSourceModule(index));
}
int no_noise_module_Module_GetSourceModuleCount(no_noise_module_Module* self) {
	return ((noise::module::Module*)self)->GetSourceModuleCount();
}
double no_noise_module_Module_GetValue(no_noise_module_Module* self, double x, double y, double z) {
	return ((noise::module::Module*)self)->GetValue(x, y, z);
}
void no_noise_module_Module_SetSourceModule(no_noise_module_Module* self, int index, no_noise_module_Module* sourceModule) {
	((noise::module::Module*)self)->SetSourceModule(index, *(noise::module::Module*)sourceModule);
}
/* END CLASS: Module */

/* BEGIN CLASS: Add */
no_noise_module_Add* no_noise_module_Add_new() {
	return (no_noise_module_Add*)(new noise::module::Add());
}
int no_noise_module_Add_GetSourceModuleCount(no_noise_module_Add* self) {
	return ((noise::module::Add*)self)->GetSourceModuleCount();
}
double no_noise_module_Add_GetValue(no_noise_module_Add* self, double x, double y, double z) {
	return ((noise::module::Add*)self)->GetValue(x, y, z);
}
void no_noise_module_Add_dispose(no_noise_module_Add* self) {
	delete (noise::module::Add*)self;
}
/* END CLASS: Add */

/* BEGIN CLASS: Abs */
no_noise_module_Abs* no_noise_module_Abs_new() {
	return (no_noise_module_Abs*)(new noise::module::Abs());
}
int no_noise_module_Abs_GetSourceModuleCount(no_noise_module_Abs* self) {
	return ((noise::module::Abs*)self)->GetSourceModuleCount();
}
double no_noise_module_Abs_GetValue(no_noise_module_Abs* self, double x, double y, double z) {
	return ((noise::module::Abs*)self)->GetValue(x, y, z);
}
void no_noise_module_Abs_dispose(no_noise_module_Abs* self) {
	delete (noise::module::Abs*)self;
}
/* END CLASS: Abs */

/* BEGIN CLASS: Billow */
no_noise_module_Billow* no_noise_module_Billow_new() {
	return (no_noise_module_Billow*)(new noise::module::Billow());
}
double no_noise_module_Billow_GetFrequency(no_noise_module_Billow* self) {
	return ((noise::module::Billow*)self)->GetFrequency();
}
double no_noise_module_Billow_GetLacunarity(no_noise_module_Billow* self) {
	return ((noise::module::Billow*)self)->GetLacunarity();
}
no_noise_NoiseQuality no_noise_module_Billow_GetNoiseQuality(no_noise_module_Billow* self) {
	return (no_noise_NoiseQuality)(((noise::module::Billow*)self)->GetNoiseQuality());
}
int no_noise_module_Billow_GetOctaveCount(no_noise_module_Billow* self) {
	return ((noise::module::Billow*)self)->GetOctaveCount();
}
double no_noise_module_Billow_GetPersistence(no_noise_module_Billow* self) {
	return ((noise::module::Billow*)self)->GetPersistence();
}
int no_noise_module_Billow_GetSeed(no_noise_module_Billow* self) {
	return ((noise::module::Billow*)self)->GetSeed();
}
int no_noise_module_Billow_GetSourceModuleCount(no_noise_module_Billow* self) {
	return ((noise::module::Billow*)self)->GetSourceModuleCount();
}
double no_noise_module_Billow_GetValue(no_noise_module_Billow* self, double x, double y, double z) {
	return ((noise::module::Billow*)self)->GetValue(x, y, z);
}
void no_noise_module_Billow_SetFrequency(no_noise_module_Billow* self, double frequency) {
	((noise::module::Billow*)self)->SetFrequency(frequency);
}
void no_noise_module_Billow_SetLacunarity(no_noise_module_Billow* self, double lacunarity) {
	((noise::module::Billow*)self)->SetLacunarity(lacunarity);
}
void no_noise_module_Billow_SetNoiseQuality(no_noise_module_Billow* self, no_noise_NoiseQuality noiseQuality) {
	((noise::module::Billow*)self)->SetNoiseQuality((noise::NoiseQuality)noiseQuality);
}
void no_noise_module_Billow_SetOctaveCount(no_noise_module_Billow* self, int octaveCount) {
	((noise::module::Billow*)self)->SetOctaveCount(octaveCount);
}
void no_noise_module_Billow_SetPersistence(no_noise_module_Billow* self, double persistence) {
	((noise::module::Billow*)self)->SetPersistence(persistence);
}
void no_noise_module_Billow_SetSeed(no_noise_module_Billow* self, int seed) {
	((noise::module::Billow*)self)->SetSeed(seed);
}
void no_noise_module_Billow_dispose(no_noise_module_Billow* self) {
	delete (noise::module::Billow*)self;
}
/* END CLASS: Billow */

/* BEGIN CLASS: Blend */
no_noise_module_Blend* no_noise_module_Blend_new() {
	return (no_noise_module_Blend*)(new noise::module::Blend());
}
no_noise_module_Module* no_noise_module_Blend_GetControlModule(no_noise_module_Blend* self) {
	return (no_noise_module_Module*)&(((noise::module::Blend*)self)->GetControlModule());
}
int no_noise_module_Blend_GetSourceModuleCount(no_noise_module_Blend* self) {
	return ((noise::module::Blend*)self)->GetSourceModuleCount();
}
double no_noise_module_Blend_GetValue(no_noise_module_Blend* self, double x, double y, double z) {
	return ((noise::module::Blend*)self)->GetValue(x, y, z);
}
void no_noise_module_Blend_SetControlModule(no_noise_module_Blend* self, no_noise_module_Module* controlModule) {
	((noise::module::Blend*)self)->SetControlModule(*(noise::module::Module*)controlModule);
}
void no_noise_module_Blend_dispose(no_noise_module_Blend* self) {
	delete (noise::module::Blend*)self;
}
/* END CLASS: Blend */

/* BEGIN CLASS: Cache */
no_noise_module_Cache* no_noise_module_Cache_new() {
	return (no_noise_module_Cache*)(new noise::module::Cache());
}
int no_noise_module_Cache_GetSourceModuleCount(no_noise_module_Cache* self) {
	return ((noise::module::Cache*)self)->GetSourceModuleCount();
}
double no_noise_module_Cache_GetValue(no_noise_module_Cache* self, double x, double y, double z) {
	return ((noise::module::Cache*)self)->GetValue(x, y, z);
}
void no_noise_module_Cache_SetSourceModule(no_noise_module_Cache* self, int index, no_noise_module_Module* sourceModule) {
	((noise::module::Cache*)self)->SetSourceModule(index, *(noise::module::Module*)sourceModule);
}
void no_noise_module_Cache_dispose(no_noise_module_Cache* self) {
	delete (noise::module::Cache*)self;
}
/* END CLASS: Cache */

/* BEGIN CLASS: Checkerboard */
no_noise_module_Checkerboard* no_noise_module_Checkerboard_new() {
	return (no_noise_module_Checkerboard*)(new noise::module::Checkerboard());
}
int no_noise_module_Checkerboard_GetSourceModuleCount(no_noise_module_Checkerboard* self) {
	return ((noise::module::Checkerboard*)self)->GetSourceModuleCount();
}
double no_noise_module_Checkerboard_GetValue(no_noise_module_Checkerboard* self, double x, double y, double z) {
	return ((noise::module::Checkerboard*)self)->GetValue(x, y, z);
}
void no_noise_module_Checkerboard_dispose(no_noise_module_Checkerboard* self) {
	delete (noise::module::Checkerboard*)self;
}
/* END CLASS: Checkerboard */

/* BEGIN CLASS: Clamp */
no_noise_module_Clamp* no_noise_module_Clamp_new() {
	return (no_noise_module_Clamp*)(new noise::module::Clamp());
}
double no_noise_module_Clamp_GetLowerBound(no_noise_module_Clamp* self) {
	return ((noise::module::Clamp*)self)->GetLowerBound();
}
int no_noise_module_Clamp_GetSourceModuleCount(no_noise_module_Clamp* self) {
	return ((noise::module::Clamp*)self)->GetSourceModuleCount();
}
double no_noise_module_Clamp_GetUpperBound(no_noise_module_Clamp* self) {
	return ((noise::module::Clamp*)self)->GetUpperBound();
}
double no_noise_module_Clamp_GetValue(no_noise_module_Clamp* self, double x, double y, double z) {
	return ((noise::module::Clamp*)self)->GetValue(x, y, z);
}
void no_noise_module_Clamp_SetBounds(no_noise_module_Clamp* self, double lowerBound, double upperBound) {
	((noise::module::Clamp*)self)->SetBounds(lowerBound, upperBound);
}
void no_noise_module_Clamp_dispose(no_noise_module_Clamp* self) {
	delete (noise::module::Clamp*)self;
}
/* END CLASS: Clamp */

/* BEGIN CLASS: Const */
no_noise_module_Const* no_noise_module_Const_new() {
	return (no_noise_module_Const*)(new noise::module::Const());
}
double no_noise_module_Const_GetConstValue(no_noise_module_Const* self) {
	return ((noise::module::Const*)self)->GetConstValue();
}
int no_noise_module_Const_GetSourceModuleCount(no_noise_module_Const* self) {
	return ((noise::module::Const*)self)->GetSourceModuleCount();
}
double no_noise_module_Const_GetValue(no_noise_module_Const* self, double x, double y, double z) {
	return ((noise::module::Const*)self)->GetValue(x, y, z);
}
void no_noise_module_Const_SetConstValue(no_noise_module_Const* self, double constValue) {
	((noise::module::Const*)self)->SetConstValue(constValue);
}
void no_noise_module_Const_dispose(no_noise_module_Const* self) {
	delete (noise::module::Const*)self;
}
/* END CLASS: Const */

/* BEGIN CLASS: Curve */
no_noise_module_Curve* no_noise_module_Curve_new() {
	return (no_noise_module_Curve*)(new noise::module::Curve());
}
void no_noise_module_Curve_AddControlPoint(no_noise_module_Curve* self, double inputValue, double outputValue) {
	((noise::module::Curve*)self)->AddControlPoint(inputValue, outputValue);
}
void no_noise_module_Curve_ClearAllControlPoints(no_noise_module_Curve* self) {
	((noise::module::Curve*)self)->ClearAllControlPoints();
}
struct no_noise_module_ControlPoint* no_noise_module_Curve_GetControlPointArray(no_noise_module_Curve* self) {
	return (struct no_noise_module_ControlPoint*)(((noise::module::Curve*)self)->GetControlPointArray());
}
int no_noise_module_Curve_GetControlPointCount(no_noise_module_Curve* self) {
	return ((noise::module::Curve*)self)->GetControlPointCount();
}
int no_noise_module_Curve_GetSourceModuleCount(no_noise_module_Curve* self) {
	return ((noise::module::Curve*)self)->GetSourceModuleCount();
}
double no_noise_module_Curve_GetValue(no_noise_module_Curve* self, double x, double y, double z) {
	return ((noise::module::Curve*)self)->GetValue(x, y, z);
}
void no_noise_module_Curve_dispose(no_noise_module_Curve* self) {
	delete (noise::module::Curve*)self;
}
/* END CLASS: Curve */

/* BEGIN CLASS: Cylinders */
no_noise_module_Cylinders* no_noise_module_Cylinders_new() {
	return (no_noise_module_Cylinders*)(new noise::module::Cylinders());
}
double no_noise_module_Cylinders_GetFrequency(no_noise_module_Cylinders* self) {
	return ((noise::module::Cylinders*)self)->GetFrequency();
}
int no_noise_module_Cylinders_GetSourceModuleCount(no_noise_module_Cylinders* self) {
	return ((noise::module::Cylinders*)self)->GetSourceModuleCount();
}
double no_noise_module_Cylinders_GetValue(no_noise_module_Cylinders* self, double x, double y, double z) {
	return ((noise::module::Cylinders*)self)->GetValue(x, y, z);
}
void no_noise_module_Cylinders_SetFrequency(no_noise_module_Cylinders* self, double frequency) {
	((noise::module::Cylinders*)self)->SetFrequency(frequency);
}
void no_noise_module_Cylinders_dispose(no_noise_module_Cylinders* self) {
	delete (noise::module::Cylinders*)self;
}
/* END CLASS: Cylinders */

/* BEGIN CLASS: Displace */
no_noise_module_Displace* no_noise_module_Displace_new() {
	return (no_noise_module_Displace*)(new noise::module::Displace());
}
int no_noise_module_Displace_GetSourceModuleCount(no_noise_module_Displace* self) {
	return ((noise::module::Displace*)self)->GetSourceModuleCount();
}
double no_noise_module_Displace_GetValue(no_noise_module_Displace* self, double x, double y, double z) {
	return ((noise::module::Displace*)self)->GetValue(x, y, z);
}
no_noise_module_Module* no_noise_module_Displace_GetXDisplaceModule(no_noise_module_Displace* self) {
	return (no_noise_module_Module*)&(((noise::module::Displace*)self)->GetXDisplaceModule());
}
no_noise_module_Module* no_noise_module_Displace_GetYDisplaceModule(no_noise_module_Displace* self) {
	return (no_noise_module_Module*)&(((noise::module::Displace*)self)->GetYDisplaceModule());
}
no_noise_module_Module* no_noise_module_Displace_GetZDisplaceModule(no_noise_module_Displace* self) {
	return (no_noise_module_Module*)&(((noise::module::Displace*)self)->GetZDisplaceModule());
}
void no_noise_module_Displace_SetDisplaceModules(no_noise_module_Displace* self, no_noise_module_Module* xDisplaceModule, no_noise_module_Module* yDisplaceModule, no_noise_module_Module* zDisplaceModule) {
	((noise::module::Displace*)self)->SetDisplaceModules(*(noise::module::Module*)xDisplaceModule, *(noise::module::Module*)yDisplaceModule, *(noise::module::Module*)zDisplaceModule);
}
void no_noise_module_Displace_SetXDisplaceModule(no_noise_module_Displace* self, no_noise_module_Module* xDisplaceModule) {
	((noise::module::Displace*)self)->SetXDisplaceModule(*(noise::module::Module*)xDisplaceModule);
}
void no_noise_module_Displace_SetYDisplaceModule(no_noise_module_Displace* self, no_noise_module_Module* yDisplaceModule) {
	((noise::module::Displace*)self)->SetYDisplaceModule(*(noise::module::Module*)yDisplaceModule);
}
void no_noise_module_Displace_SetZDisplaceModule(no_noise_module_Displace* self, no_noise_module_Module* zDisplaceModule) {
	((noise::module::Displace*)self)->SetZDisplaceModule(*(noise::module::Module*)zDisplaceModule);
}
void no_noise_module_Displace_dispose(no_noise_module_Displace* self) {
	delete (noise::module::Displace*)self;
}
/* END CLASS: Displace */

/* BEGIN CLASS: Exponent */
no_noise_module_Exponent* no_noise_module_Exponent_new() {
	return (no_noise_module_Exponent*)(new noise::module::Exponent());
}
double no_noise_module_Exponent_GetExponent(no_noise_module_Exponent* self) {
	return ((noise::module::Exponent*)self)->GetExponent();
}
int no_noise_module_Exponent_GetSourceModuleCount(no_noise_module_Exponent* self) {
	return ((noise::module::Exponent*)self)->GetSourceModuleCount();
}
double no_noise_module_Exponent_GetValue(no_noise_module_Exponent* self, double x, double y, double z) {
	return ((noise::module::Exponent*)self)->GetValue(x, y, z);
}
void no_noise_module_Exponent_SetExponent(no_noise_module_Exponent* self, double exponent) {
	((noise::module::Exponent*)self)->SetExponent(exponent);
}
void no_noise_module_Exponent_dispose(no_noise_module_Exponent* self) {
	delete (noise::module::Exponent*)self;
}
/* END CLASS: Exponent */

/* BEGIN CLASS: Invert */
no_noise_module_Invert* no_noise_module_Invert_new() {
	return (no_noise_module_Invert*)(new noise::module::Invert());
}
int no_noise_module_Invert_GetSourceModuleCount(no_noise_module_Invert* self) {
	return ((noise::module::Invert*)self)->GetSourceModuleCount();
}
double no_noise_module_Invert_GetValue(no_noise_module_Invert* self, double x, double y, double z) {
	return ((noise::module::Invert*)self)->GetValue(x, y, z);
}
void no_noise_module_Invert_dispose(no_noise_module_Invert* self) {
	delete (noise::module::Invert*)self;
}
/* END CLASS: Invert */

/* BEGIN CLASS: Max */
no_noise_module_Max* no_noise_module_Max_new() {
	return (no_noise_module_Max*)(new noise::module::Max());
}
int no_noise_module_Max_GetSourceModuleCount(no_noise_module_Max* self) {
	return ((noise::module::Max*)self)->GetSourceModuleCount();
}
double no_noise_module_Max_GetValue(no_noise_module_Max* self, double x, double y, double z) {
	return ((noise::module::Max*)self)->GetValue(x, y, z);
}
void no_noise_module_Max_dispose(no_noise_module_Max* self) {
	delete (noise::module::Max*)self;
}
/* END CLASS: Max */

/* BEGIN CLASS: Min */
no_noise_module_Min* no_noise_module_Min_new() {
	return (no_noise_module_Min*)(new noise::module::Min());
}
int no_noise_module_Min_GetSourceModuleCount(no_noise_module_Min* self) {
	return ((noise::module::Min*)self)->GetSourceModuleCount();
}
double no_noise_module_Min_GetValue(no_noise_module_Min* self, double x, double y, double z) {
	return ((noise::module::Min*)self)->GetValue(x, y, z);
}
void no_noise_module_Min_dispose(no_noise_module_Min* self) {
	delete (noise::module::Min*)self;
}
/* END CLASS: Min */

/* BEGIN CLASS: Multiply */
no_noise_module_Multiply* no_noise_module_Multiply_new() {
	return (no_noise_module_Multiply*)(new noise::module::Multiply());
}
int no_noise_module_Multiply_GetSourceModuleCount(no_noise_module_Multiply* self) {
	return ((noise::module::Multiply*)self)->GetSourceModuleCount();
}
double no_noise_module_Multiply_GetValue(no_noise_module_Multiply* self, double x, double y, double z) {
	return ((noise::module::Multiply*)self)->GetValue(x, y, z);
}
void no_noise_module_Multiply_dispose(no_noise_module_Multiply* self) {
	delete (noise::module::Multiply*)self;
}
/* END CLASS: Multiply */

/* BEGIN CLASS: Perlin */
no_noise_module_Perlin* no_noise_module_Perlin_new() {
	return (no_noise_module_Perlin*)(new noise::module::Perlin());
}
double no_noise_module_Perlin_GetFrequency(no_noise_module_Perlin* self) {
	return ((noise::module::Perlin*)self)->GetFrequency();
}
double no_noise_module_Perlin_GetLacunarity(no_noise_module_Perlin* self) {
	return ((noise::module::Perlin*)self)->GetLacunarity();
}
no_noise_NoiseQuality no_noise_module_Perlin_GetNoiseQuality(no_noise_module_Perlin* self) {
	return (no_noise_NoiseQuality)(((noise::module::Perlin*)self)->GetNoiseQuality());
}
int no_noise_module_Perlin_GetOctaveCount(no_noise_module_Perlin* self) {
	return ((noise::module::Perlin*)self)->GetOctaveCount();
}
double no_noise_module_Perlin_GetPersistence(no_noise_module_Perlin* self) {
	return ((noise::module::Perlin*)self)->GetPersistence();
}
int no_noise_module_Perlin_GetSeed(no_noise_module_Perlin* self) {
	return ((noise::module::Perlin*)self)->GetSeed();
}
int no_noise_module_Perlin_GetSourceModuleCount(no_noise_module_Perlin* self) {
	return ((noise::module::Perlin*)self)->GetSourceModuleCount();
}
double no_noise_module_Perlin_GetValue(no_noise_module_Perlin* self, double x, double y, double z) {
	return ((noise::module::Perlin*)self)->GetValue(x, y, z);
}
void no_noise_module_Perlin_SetFrequency(no_noise_module_Perlin* self, double frequency) {
	((noise::module::Perlin*)self)->SetFrequency(frequency);
}
void no_noise_module_Perlin_SetLacunarity(no_noise_module_Perlin* self, double lacunarity) {
	((noise::module::Perlin*)self)->SetLacunarity(lacunarity);
}
void no_noise_module_Perlin_SetNoiseQuality(no_noise_module_Perlin* self, no_noise_NoiseQuality noiseQuality) {
	((noise::module::Perlin*)self)->SetNoiseQuality((noise::NoiseQuality)noiseQuality);
}
void no_noise_module_Perlin_SetOctaveCount(no_noise_module_Perlin* self, int octaveCount) {
	((noise::module::Perlin*)self)->SetOctaveCount(octaveCount);
}
void no_noise_module_Perlin_SetPersistence(no_noise_module_Perlin* self, double persistence) {
	((noise::module::Perlin*)self)->SetPersistence(persistence);
}
void no_noise_module_Perlin_SetSeed(no_noise_module_Perlin* self, int seed) {
	((noise::module::Perlin*)self)->SetSeed(seed);
}
void no_noise_module_Perlin_dispose(no_noise_module_Perlin* self) {
	delete (noise::module::Perlin*)self;
}
/* END CLASS: Perlin */

/* BEGIN CLASS: Power */
no_noise_module_Power* no_noise_module_Power_new() {
	return (no_noise_module_Power*)(new noise::module::Power());
}
int no_noise_module_Power_GetSourceModuleCount(no_noise_module_Power* self) {
	return ((noise::module::Power*)self)->GetSourceModuleCount();
}
double no_noise_module_Power_GetValue(no_noise_module_Power* self, double x, double y, double z) {
	return ((noise::module::Power*)self)->GetValue(x, y, z);
}
void no_noise_module_Power_dispose(no_noise_module_Power* self) {
	delete (noise::module::Power*)self;
}
/* END CLASS: Power */

/* BEGIN CLASS: RidgedMulti */
no_noise_module_RidgedMulti* no_noise_module_RidgedMulti_new() {
	return (no_noise_module_RidgedMulti*)(new noise::module::RidgedMulti());
}
double no_noise_module_RidgedMulti_GetFrequency(no_noise_module_RidgedMulti* self) {
	return ((noise::module::RidgedMulti*)self)->GetFrequency();
}
double no_noise_module_RidgedMulti_GetLacunarity(no_noise_module_RidgedMulti* self) {
	return ((noise::module::RidgedMulti*)self)->GetLacunarity();
}
no_noise_NoiseQuality no_noise_module_RidgedMulti_GetNoiseQuality(no_noise_module_RidgedMulti* self) {
	return (no_noise_NoiseQuality)(((noise::module::RidgedMulti*)self)->GetNoiseQuality());
}
int no_noise_module_RidgedMulti_GetOctaveCount(no_noise_module_RidgedMulti* self) {
	return ((noise::module::RidgedMulti*)self)->GetOctaveCount();
}
int no_noise_module_RidgedMulti_GetSeed(no_noise_module_RidgedMulti* self) {
	return ((noise::module::RidgedMulti*)self)->GetSeed();
}
int no_noise_module_RidgedMulti_GetSourceModuleCount(no_noise_module_RidgedMulti* self) {
	return ((noise::module::RidgedMulti*)self)->GetSourceModuleCount();
}
double no_noise_module_RidgedMulti_GetValue(no_noise_module_RidgedMulti* self, double x, double y, double z) {
	return ((noise::module::RidgedMulti*)self)->GetValue(x, y, z);
}
void no_noise_module_RidgedMulti_SetFrequency(no_noise_module_RidgedMulti* self, double frequency) {
	((noise::module::RidgedMulti*)self)->SetFrequency(frequency);
}
void no_noise_module_RidgedMulti_SetLacunarity(no_noise_module_RidgedMulti* self, double lacunarity) {
	((noise::module::RidgedMulti*)self)->SetLacunarity(lacunarity);
}
void no_noise_module_RidgedMulti_SetNoiseQuality(no_noise_module_RidgedMulti* self, no_noise_NoiseQuality noiseQuality) {
	((noise::module::RidgedMulti*)self)->SetNoiseQuality((noise::NoiseQuality)noiseQuality);
}
void no_noise_module_RidgedMulti_SetOctaveCount(no_noise_module_RidgedMulti* self, int octaveCount) {
	((noise::module::RidgedMulti*)self)->SetOctaveCount(octaveCount);
}
void no_noise_module_RidgedMulti_SetSeed(no_noise_module_RidgedMulti* self, int seed) {
	((noise::module::RidgedMulti*)self)->SetSeed(seed);
}
void no_noise_module_RidgedMulti_dispose(no_noise_module_RidgedMulti* self) {
	delete (noise::module::RidgedMulti*)self;
}
/* END CLASS: RidgedMulti */

/* BEGIN CLASS: RotatePoint */
no_noise_module_RotatePoint* no_noise_module_RotatePoint_new() {
	return (no_noise_module_RotatePoint*)(new noise::module::RotatePoint());
}
int no_noise_module_RotatePoint_GetSourceModuleCount(no_noise_module_RotatePoint* self) {
	return ((noise::module::RotatePoint*)self)->GetSourceModuleCount();
}
double no_noise_module_RotatePoint_GetValue(no_noise_module_RotatePoint* self, double x, double y, double z) {
	return ((noise::module::RotatePoint*)self)->GetValue(x, y, z);
}
double no_noise_module_RotatePoint_GetXAngle(no_noise_module_RotatePoint* self) {
	return ((noise::module::RotatePoint*)self)->GetXAngle();
}
double no_noise_module_RotatePoint_GetYAngle(no_noise_module_RotatePoint* self) {
	return ((noise::module::RotatePoint*)self)->GetYAngle();
}
double no_noise_module_RotatePoint_GetZAngle(no_noise_module_RotatePoint* self) {
	return ((noise::module::RotatePoint*)self)->GetZAngle();
}
void no_noise_module_RotatePoint_SetAngles(no_noise_module_RotatePoint* self, double xAngle, double yAngle, double zAngle) {
	((noise::module::RotatePoint*)self)->SetAngles(xAngle, yAngle, zAngle);
}
void no_noise_module_RotatePoint_SetXAngle(no_noise_module_RotatePoint* self, double xAngle) {
	((noise::module::RotatePoint*)self)->SetXAngle(xAngle);
}
void no_noise_module_RotatePoint_SetYAngle(no_noise_module_RotatePoint* self, double yAngle) {
	((noise::module::RotatePoint*)self)->SetYAngle(yAngle);
}
void no_noise_module_RotatePoint_SetZAngle(no_noise_module_RotatePoint* self, double zAngle) {
	((noise::module::RotatePoint*)self)->SetZAngle(zAngle);
}
void no_noise_module_RotatePoint_dispose(no_noise_module_RotatePoint* self) {
	delete (noise::module::RotatePoint*)self;
}
/* END CLASS: RotatePoint */

/* BEGIN CLASS: ScaleBias */
no_noise_module_ScaleBias* no_noise_module_ScaleBias_new() {
	return (no_noise_module_ScaleBias*)(new noise::module::ScaleBias());
}
double no_noise_module_ScaleBias_GetBias(no_noise_module_ScaleBias* self) {
	return ((noise::module::ScaleBias*)self)->GetBias();
}
double no_noise_module_ScaleBias_GetScale(no_noise_module_ScaleBias* self) {
	return ((noise::module::ScaleBias*)self)->GetScale();
}
int no_noise_module_ScaleBias_GetSourceModuleCount(no_noise_module_ScaleBias* self) {
	return ((noise::module::ScaleBias*)self)->GetSourceModuleCount();
}
double no_noise_module_ScaleBias_GetValue(no_noise_module_ScaleBias* self, double x, double y, double z) {
	return ((noise::module::ScaleBias*)self)->GetValue(x, y, z);
}
void no_noise_module_ScaleBias_SetBias(no_noise_module_ScaleBias* self, double bias) {
	((noise::module::ScaleBias*)self)->SetBias(bias);
}
void no_noise_module_ScaleBias_SetScale(no_noise_module_ScaleBias* self, double scale) {
	((noise::module::ScaleBias*)self)->SetScale(scale);
}
void no_noise_module_ScaleBias_dispose(no_noise_module_ScaleBias* self) {
	delete (noise::module::ScaleBias*)self;
}
/* END CLASS: ScaleBias */

/* BEGIN CLASS: ScalePoint */
no_noise_module_ScalePoint* no_noise_module_ScalePoint_new() {
	return (no_noise_module_ScalePoint*)(new noise::module::ScalePoint());
}
int no_noise_module_ScalePoint_GetSourceModuleCount(no_noise_module_ScalePoint* self) {
	return ((noise::module::ScalePoint*)self)->GetSourceModuleCount();
}
double no_noise_module_ScalePoint_GetValue(no_noise_module_ScalePoint* self, double x, double y, double z) {
	return ((noise::module::ScalePoint*)self)->GetValue(x, y, z);
}
double no_noise_module_ScalePoint_GetXScale(no_noise_module_ScalePoint* self) {
	return ((noise::module::ScalePoint*)self)->GetXScale();
}
double no_noise_module_ScalePoint_GetYScale(no_noise_module_ScalePoint* self) {
	return ((noise::module::ScalePoint*)self)->GetYScale();
}
double no_noise_module_ScalePoint_GetZScale(no_noise_module_ScalePoint* self) {
	return ((noise::module::ScalePoint*)self)->GetZScale();
}
void no_noise_module_ScalePoint_SetScale_1(no_noise_module_ScalePoint* self, double scale) {
	((noise::module::ScalePoint*)self)->SetScale(scale);
}
void no_noise_module_ScalePoint_SetScale_2(no_noise_module_ScalePoint* self, double xScale, double yScale, double zScale) {
	((noise::module::ScalePoint*)self)->SetScale(xScale, yScale, zScale);
}
void no_noise_module_ScalePoint_SetXScale(no_noise_module_ScalePoint* self, double xScale) {
	((noise::module::ScalePoint*)self)->SetXScale(xScale);
}
void no_noise_module_ScalePoint_SetYScale(no_noise_module_ScalePoint* self, double yScale) {
	((noise::module::ScalePoint*)self)->SetYScale(yScale);
}
void no_noise_module_ScalePoint_SetZScale(no_noise_module_ScalePoint* self, double zScale) {
	((noise::module::ScalePoint*)self)->SetZScale(zScale);
}
void no_noise_module_ScalePoint_dispose(no_noise_module_ScalePoint* self) {
	delete (noise::module::ScalePoint*)self;
}
/* END CLASS: ScalePoint */

/* BEGIN CLASS: Select */
no_noise_module_Select* no_noise_module_Select_new() {
	return (no_noise_module_Select*)(new noise::module::Select());
}
no_noise_module_Module* no_noise_module_Select_GetControlModule(no_noise_module_Select* self) {
	return (no_noise_module_Module*)&(((noise::module::Select*)self)->GetControlModule());
}
double no_noise_module_Select_GetEdgeFalloff(no_noise_module_Select* self) {
	return ((noise::module::Select*)self)->GetEdgeFalloff();
}
double no_noise_module_Select_GetLowerBound(no_noise_module_Select* self) {
	return ((noise::module::Select*)self)->GetLowerBound();
}
int no_noise_module_Select_GetSourceModuleCount(no_noise_module_Select* self) {
	return ((noise::module::Select*)self)->GetSourceModuleCount();
}
double no_noise_module_Select_GetUpperBound(no_noise_module_Select* self) {
	return ((noise::module::Select*)self)->GetUpperBound();
}
double no_noise_module_Select_GetValue(no_noise_module_Select* self, double x, double y, double z) {
	return ((noise::module::Select*)self)->GetValue(x, y, z);
}
void no_noise_module_Select_SetBounds(no_noise_module_Select* self, double lowerBound, double upperBound) {
	((noise::module::Select*)self)->SetBounds(lowerBound, upperBound);
}
void no_noise_module_Select_SetControlModule(no_noise_module_Select* self, no_noise_module_Module* controlModule) {
	((noise::module::Select*)self)->SetControlModule(*(noise::module::Module*)controlModule);
}
void no_noise_module_Select_SetEdgeFalloff(no_noise_module_Select* self, double edgeFalloff) {
	((noise::module::Select*)self)->SetEdgeFalloff(edgeFalloff);
}
void no_noise_module_Select_dispose(no_noise_module_Select* self) {
	delete (noise::module::Select*)self;
}
/* END CLASS: Select */

/* BEGIN CLASS: Spheres */
no_noise_module_Spheres* no_noise_module_Spheres_new() {
	return (no_noise_module_Spheres*)(new noise::module::Spheres());
}
double no_noise_module_Spheres_GetFrequency(no_noise_module_Spheres* self) {
	return ((noise::module::Spheres*)self)->GetFrequency();
}
int no_noise_module_Spheres_GetSourceModuleCount(no_noise_module_Spheres* self) {
	return ((noise::module::Spheres*)self)->GetSourceModuleCount();
}
double no_noise_module_Spheres_GetValue(no_noise_module_Spheres* self, double x, double y, double z) {
	return ((noise::module::Spheres*)self)->GetValue(x, y, z);
}
void no_noise_module_Spheres_SetFrequency(no_noise_module_Spheres* self, double frequency) {
	((noise::module::Spheres*)self)->SetFrequency(frequency);
}
void no_noise_module_Spheres_dispose(no_noise_module_Spheres* self) {
	delete (noise::module::Spheres*)self;
}
/* END CLASS: Spheres */

/* BEGIN CLASS: Terrace */
no_noise_module_Terrace* no_noise_module_Terrace_new() {
	return (no_noise_module_Terrace*)(new noise::module::Terrace());
}
void no_noise_module_Terrace_AddControlPoint(no_noise_module_Terrace* self, double value) {
	((noise::module::Terrace*)self)->AddControlPoint(value);
}
void no_noise_module_Terrace_ClearAllControlPoints(no_noise_module_Terrace* self) {
	((noise::module::Terrace*)self)->ClearAllControlPoints();
}
const double* no_noise_module_Terrace_GetControlPointArray(no_noise_module_Terrace* self) {
	return (const double*)(((noise::module::Terrace*)self)->GetControlPointArray());
}
int no_noise_module_Terrace_GetControlPointCount(no_noise_module_Terrace* self) {
	return ((noise::module::Terrace*)self)->GetControlPointCount();
}
int no_noise_module_Terrace_GetSourceModuleCount(no_noise_module_Terrace* self) {
	return ((noise::module::Terrace*)self)->GetSourceModuleCount();
}
void no_noise_module_Terrace_InvertTerraces(no_noise_module_Terrace* self, bool invert) {
	((noise::module::Terrace*)self)->InvertTerraces(invert);
}
bool no_noise_module_Terrace_IsTerracesInverted(no_noise_module_Terrace* self) {
	return ((noise::module::Terrace*)self)->IsTerracesInverted();
}
double no_noise_module_Terrace_GetValue(no_noise_module_Terrace* self, double x, double y, double z) {
	return ((noise::module::Terrace*)self)->GetValue(x, y, z);
}
void no_noise_module_Terrace_MakeControlPoints(no_noise_module_Terrace* self, int controlPointCount) {
	((noise::module::Terrace*)self)->MakeControlPoints(controlPointCount);
}
void no_noise_module_Terrace_dispose(no_noise_module_Terrace* self) {
	delete (noise::module::Terrace*)self;
}
/* END CLASS: Terrace */

/* BEGIN CLASS: TranslatePoint */
no_noise_module_TranslatePoint* no_noise_module_TranslatePoint_new() {
	return (no_noise_module_TranslatePoint*)(new noise::module::TranslatePoint());
}
int no_noise_module_TranslatePoint_GetSourceModuleCount(no_noise_module_TranslatePoint* self) {
	return ((noise::module::TranslatePoint*)self)->GetSourceModuleCount();
}
double no_noise_module_TranslatePoint_GetValue(no_noise_module_TranslatePoint* self, double x, double y, double z) {
	return ((noise::module::TranslatePoint*)self)->GetValue(x, y, z);
}
double no_noise_module_TranslatePoint_GetXTranslation(no_noise_module_TranslatePoint* self) {
	return ((noise::module::TranslatePoint*)self)->GetXTranslation();
}
double no_noise_module_TranslatePoint_GetYTranslation(no_noise_module_TranslatePoint* self) {
	return ((noise::module::TranslatePoint*)self)->GetYTranslation();
}
double no_noise_module_TranslatePoint_GetZTranslation(no_noise_module_TranslatePoint* self) {
	return ((noise::module::TranslatePoint*)self)->GetZTranslation();
}
void no_noise_module_TranslatePoint_SetTranslation_1(no_noise_module_TranslatePoint* self, double translation) {
	((noise::module::TranslatePoint*)self)->SetTranslation(translation);
}
void no_noise_module_TranslatePoint_SetTranslation_2(no_noise_module_TranslatePoint* self, double xTranslation, double yTranslation, double zTranslation) {
	((noise::module::TranslatePoint*)self)->SetTranslation(xTranslation, yTranslation, zTranslation);
}
void no_noise_module_TranslatePoint_SetXTranslation(no_noise_module_TranslatePoint* self, double xTranslation) {
	((noise::module::TranslatePoint*)self)->SetXTranslation(xTranslation);
}
void no_noise_module_TranslatePoint_SetYTranslation(no_noise_module_TranslatePoint* self, double yTranslation) {
	((noise::module::TranslatePoint*)self)->SetYTranslation(yTranslation);
}
void no_noise_module_TranslatePoint_SetZTranslation(no_noise_module_TranslatePoint* self, double zTranslation) {
	((noise::module::TranslatePoint*)self)->SetZTranslation(zTranslation);
}
void no_noise_module_TranslatePoint_dispose(no_noise_module_TranslatePoint* self) {
	delete (noise::module::TranslatePoint*)self;
}
/* END CLASS: TranslatePoint */

/* BEGIN CLASS: Turbulence */
no_noise_module_Turbulence* no_noise_module_Turbulence_new() {
	return (no_noise_module_Turbulence*)(new noise::module::Turbulence());
}
double no_noise_module_Turbulence_GetFrequency(no_noise_module_Turbulence* self) {
	return ((noise::module::Turbulence*)self)->GetFrequency();
}
double no_noise_module_Turbulence_GetPower(no_noise_module_Turbulence* self) {
	return ((noise::module::Turbulence*)self)->GetPower();
}
int no_noise_module_Turbulence_GetRoughnessCount(no_noise_module_Turbulence* self) {
	return ((noise::module::Turbulence*)self)->GetRoughnessCount();
}
int no_noise_module_Turbulence_GetSeed(no_noise_module_Turbulence* self) {
	return ((noise::module::Turbulence*)self)->GetSeed();
}
int no_noise_module_Turbulence_GetSourceModuleCount(no_noise_module_Turbulence* self) {
	return ((noise::module::Turbulence*)self)->GetSourceModuleCount();
}
double no_noise_module_Turbulence_GetValue(no_noise_module_Turbulence* self, double x, double y, double z) {
	return ((noise::module::Turbulence*)self)->GetValue(x, y, z);
}
void no_noise_module_Turbulence_SetFrequency(no_noise_module_Turbulence* self, double frequency) {
	((noise::module::Turbulence*)self)->SetFrequency(frequency);
}
void no_noise_module_Turbulence_SetPower(no_noise_module_Turbulence* self, double power) {
	((noise::module::Turbulence*)self)->SetPower(power);
}
void no_noise_module_Turbulence_SetRoughness(no_noise_module_Turbulence* self, int roughness) {
	((noise::module::Turbulence*)self)->SetRoughness(roughness);
}
void no_noise_module_Turbulence_SetSeed(no_noise_module_Turbulence* self, int seed) {
	((noise::module::Turbulence*)self)->SetSeed(seed);
}
void no_noise_module_Turbulence_dispose(no_noise_module_Turbulence* self) {
	delete (noise::module::Turbulence*)self;
}
/* END CLASS: Turbulence */

/* BEGIN CLASS: Voronoi */
no_noise_module_Voronoi* no_noise_module_Voronoi_new() {
	return (no_noise_module_Voronoi*)(new noise::module::Voronoi());
}
void no_noise_module_Voronoi_EnableDistance(no_noise_module_Voronoi* self, bool enable) {
	((noise::module::Voronoi*)self)->EnableDistance(enable);
}
double no_noise_module_Voronoi_GetDisplacement(no_noise_module_Voronoi* self) {
	return ((noise::module::Voronoi*)self)->GetDisplacement();
}
double no_noise_module_Voronoi_GetFrequency(no_noise_module_Voronoi* self) {
	return ((noise::module::Voronoi*)self)->GetFrequency();
}
int no_noise_module_Voronoi_GetSourceModuleCount(no_noise_module_Voronoi* self) {
	return ((noise::module::Voronoi*)self)->GetSourceModuleCount();
}
int no_noise_module_Voronoi_GetSeed(no_noise_module_Voronoi* self) {
	return ((noise::module::Voronoi*)self)->GetSeed();
}
bool no_noise_module_Voronoi_IsDistanceEnabled(no_noise_module_Voronoi* self) {
	return ((noise::module::Voronoi*)self)->IsDistanceEnabled();
}
double no_noise_module_Voronoi_GetValue(no_noise_module_Voronoi* self, double x, double y, double z) {
	return ((noise::module::Voronoi*)self)->GetValue(x, y, z);
}
void no_noise_module_Voronoi_SetDisplacement(no_noise_module_Voronoi* self, double displacement) {
	((noise::module::Voronoi*)self)->SetDisplacement(displacement);
}
void no_noise_module_Voronoi_SetFrequency(no_noise_module_Voronoi* self, double frequency) {
	((noise::module::Voronoi*)self)->SetFrequency(frequency);
}
void no_noise_module_Voronoi_SetSeed(no_noise_module_Voronoi* self, int seed) {
	((noise::module::Voronoi*)self)->SetSeed(seed);
}
void no_noise_module_Voronoi_dispose(no_noise_module_Voronoi* self) {
	delete (noise::module::Voronoi*)self;
}
/* END CLASS: Voronoi */

/* END NAMESPACE: module */

/* BEGIN NAMESPACE: model */

/* BEGIN CLASS: Cylinder */
no_noise_model_Cylinder* no_noise_model_Cylinder_new_1() {
	return (no_noise_model_Cylinder*)(new noise::model::Cylinder());
}
no_noise_model_Cylinder* no_noise_model_Cylinder_new_2(no_noise_module_Module* module) {
	return (no_noise_model_Cylinder*)(new noise::model::Cylinder(*(noise::module::Module*)module));
}
no_noise_module_Module* no_noise_model_Cylinder_GetModule(no_noise_model_Cylinder* self) {
	return (no_noise_module_Module*)&(((noise::model::Cylinder*)self)->GetModule());
}
double no_noise_model_Cylinder_GetValue(no_noise_model_Cylinder* self, double angle, double height) {
	return ((noise::model::Cylinder*)self)->GetValue(angle, height);
}
void no_noise_model_Cylinder_SetModule(no_noise_model_Cylinder* self, no_noise_module_Module* module) {
	((noise::model::Cylinder*)self)->SetModule(*(noise::module::Module*)module);
}
void no_noise_model_Cylinder_dispose(no_noise_model_Cylinder* self) {
	delete (noise::model::Cylinder*)self;
}
/* END CLASS: Cylinder */

/* BEGIN CLASS: Line */
no_noise_model_Line* no_noise_model_Line_new_1() {
	return (no_noise_model_Line*)(new noise::model::Line());
}
no_noise_model_Line* no_noise_model_Line_new_2(no_noise_module_Module* module) {
	return (no_noise_model_Line*)(new noise::model::Line(*(noise::module::Module*)module));
}
bool no_noise_model_Line_GetAttenuate(no_noise_model_Line* self) {
	return ((noise::model::Line*)self)->GetAttenuate();
}
no_noise_module_Module* no_noise_model_Line_GetModule(no_noise_model_Line* self) {
	return (no_noise_module_Module*)&(((noise::model::Line*)self)->GetModule());
}
double no_noise_model_Line_GetValue(no_noise_model_Line* self, double p) {
	return ((noise::model::Line*)self)->GetValue(p);
}
void no_noise_model_Line_SetAttenuate(no_noise_model_Line* self, bool att) {
	((noise::model::Line*)self)->SetAttenuate(att);
}
void no_noise_model_Line_SetEndPoint(no_noise_model_Line* self, double x, double y, double z) {
	((noise::model::Line*)self)->SetEndPoint(x, y, z);
}
void no_noise_model_Line_SetModule(no_noise_model_Line* self, no_noise_module_Module* module) {
	((noise::model::Line*)self)->SetModule(*(noise::module::Module*)module);
}
void no_noise_model_Line_SetStartPoint(no_noise_model_Line* self, double x, double y, double z) {
	((noise::model::Line*)self)->SetStartPoint(x, y, z);
}
void no_noise_model_Line_dispose(no_noise_model_Line* self) {
	delete (noise::model::Line*)self;
}
/* END CLASS: Line */

/* BEGIN CLASS: Plane */
no_noise_model_Plane* no_noise_model_Plane_new_1() {
	return (no_noise_model_Plane*)(new noise::model::Plane());
}
no_noise_model_Plane* no_noise_model_Plane_new_2(no_noise_module_Module* module) {
	return (no_noise_model_Plane*)(new noise::model::Plane(*(noise::module::Module*)module));
}
no_noise_module_Module* no_noise_model_Plane_GetModule(no_noise_model_Plane* self) {
	return (no_noise_module_Module*)&(((noise::model::Plane*)self)->GetModule());
}
double no_noise_model_Plane_GetValue(no_noise_model_Plane* self, double x, double z) {
	return ((noise::model::Plane*)self)->GetValue(x, z);
}
void no_noise_model_Plane_SetModule(no_noise_model_Plane* self, no_noise_module_Module* module) {
	((noise::model::Plane*)self)->SetModule(*(noise::module::Module*)module);
}
void no_noise_model_Plane_dispose(no_noise_model_Plane* self) {
	delete (noise::model::Plane*)self;
}
/* END CLASS: Plane */

/* BEGIN CLASS: Sphere */
no_noise_model_Sphere* no_noise_model_Sphere_new_1() {
	return (no_noise_model_Sphere*)(new noise::model::Sphere());
}
no_noise_model_Sphere* no_noise_model_Sphere_new_2(no_noise_module_Module* module) {
	return (no_noise_model_Sphere*)(new noise::model::Sphere(*(noise::module::Module*)module));
}
no_noise_module_Module* no_noise_model_Sphere_GetModule(no_noise_model_Sphere* self) {
	return (no_noise_module_Module*)&(((noise::model::Sphere*)self)->GetModule());
}
double no_noise_model_Sphere_GetValue(no_noise_model_Sphere* self, double lat, double lon) {
	return ((noise::model::Sphere*)self)->GetValue(lat, lon);
}
void no_noise_model_Sphere_SetModule(no_noise_model_Sphere* self, no_noise_module_Module* module) {
	((noise::model::Sphere*)self)->SetModule(*(noise::module::Module*)module);
}
void no_noise_model_Sphere_dispose(no_noise_model_Sphere* self) {
	delete (noise::model::Sphere*)self;
}
/* END CLASS: Sphere */

/* END NAMESPACE: model */

int no_noise_ClampValue(int value, int lowerBound, int upperBound) {
	return noise::ClampValue(value, lowerBound, upperBound);
}
/* END NAMESPACE: noise */

}
