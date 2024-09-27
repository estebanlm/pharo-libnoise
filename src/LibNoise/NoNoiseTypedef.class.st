Class {
	#name : 'NoNoiseTypedef',
	#superclass : 'SharedPool',
	#classVars : [
		'bool',
		'int16_t',
		'int32_t',
		'int64_t',
		'int8_t',
		'no_noise_Exception',
		'no_noise_ExceptionInvalidParam',
		'no_noise_ExceptionNoModule',
		'no_noise_ExceptionOutOfMemory',
		'no_noise_ExceptionUnknown',
		'no_noise_NoiseQuality',
		'no_noise_int16',
		'no_noise_int32',
		'no_noise_int8',
		'no_noise_model_Cylinder',
		'no_noise_model_Line',
		'no_noise_model_Plane',
		'no_noise_model_Sphere',
		'no_noise_module_Abs',
		'no_noise_module_Add',
		'no_noise_module_Billow',
		'no_noise_module_Blend',
		'no_noise_module_Cache',
		'no_noise_module_Checkerboard',
		'no_noise_module_Clamp',
		'no_noise_module_Const',
		'no_noise_module_ControlPoint',
		'no_noise_module_Curve',
		'no_noise_module_Cylinders',
		'no_noise_module_Displace',
		'no_noise_module_Exponent',
		'no_noise_module_Invert',
		'no_noise_module_Max',
		'no_noise_module_Min',
		'no_noise_module_Module',
		'no_noise_module_Multiply',
		'no_noise_module_Perlin',
		'no_noise_module_Power',
		'no_noise_module_RidgedMulti',
		'no_noise_module_RotatePoint',
		'no_noise_module_ScaleBias',
		'no_noise_module_ScalePoint',
		'no_noise_module_Select',
		'no_noise_module_Spheres',
		'no_noise_module_Terrace',
		'no_noise_module_TranslatePoint',
		'no_noise_module_Turbulence',
		'no_noise_module_Voronoi',
		'no_noise_uint',
		'no_noise_uint16',
		'no_noise_uint32',
		'no_noise_uint8',
		'pid_t',
		'time_t',
		'uint16_t',
		'uint32_t',
		'uint64_t',
		'uint8_t',
		'uintptr_t'
	],
	#category : 'LibNoise-Library',
	#package : 'LibNoise',
	#tag : 'Library'
}

{ #category : 'class initialization' }
NoNoiseTypedef class >> initialize [

	pid_t := #int.
	uint16_t := #uint16.
	uint8_t := #uint8.
	int16_t := #int16.
	int64_t := #int64.
	uint32_t := #uint32.
	time_t := #int.
	uintptr_t := #'void *'.
	int32_t := #int32.
	int8_t := #int8.
	bool := #Boolean.
	uint64_t := #uint64.
	no_noise_module_Curve := NoCurve.
	no_noise_int16 := #short.
	no_noise_uint := #uint.
	no_noise_module_Exponent := NoExponent.
	no_noise_module_Checkerboard := NoCheckerboard.
	no_noise_module_Terrace := NoTerrace.
	no_noise_module_Voronoi := NoVoronoi.
	no_noise_module_Blend := NoBlend.
	no_noise_module_RidgedMulti := NoRidgedMulti.
	no_noise_uint16 := #ushort.
	no_noise_module_Multiply := NoMultiply.
	no_noise_module_Clamp := NoClamp.
	no_noise_ExceptionNoModule := NoExceptionNoModule.
	no_noise_module_Max := NoMax.
	no_noise_module_Displace := NoDisplace.
	no_noise_module_Select := NoSelect.
	no_noise_model_Sphere := NoSphere.
	no_noise_int32 := #int.
	no_noise_module_ScalePoint := NoScalePoint.
	no_noise_NoiseQuality := NoNoiseQuality.
	no_noise_module_Add := NoAdd.
	no_noise_module_Cylinders := NoCylinders.
	no_noise_uint32 := #uint.
	no_noise_model_Line := NoLine.
	no_noise_module_Power := NoPower.
	no_noise_module_Spheres := NoSpheres.
	no_noise_module_TranslatePoint := NoTranslatePoint.
	no_noise_module_ScaleBias := NoScaleBias.
	no_noise_module_Billow := NoBillow.
	no_noise_Exception := NoException.
	no_noise_module_Invert := NoInvert.
	no_noise_module_Const := NoConst.
	no_noise_module_Abs := NoAbs.
	no_noise_module_Turbulence := NoTurbulence.
	no_noise_uint8 := #uchar.
	no_noise_int8 := #char.
	no_noise_model_Cylinder := NoCylinder.
	no_noise_module_Module := NoModule.
	no_noise_module_Cache := NoCache.
	no_noise_module_Perlin := NoPerlin.
	no_noise_module_ControlPoint := NoControlPoint.
	no_noise_model_Plane := NoPlane.
	no_noise_ExceptionInvalidParam := NoExceptionInvalidParam.
	no_noise_ExceptionOutOfMemory := NoExceptionOutOfMemory.
	no_noise_module_Min := NoMin.
	no_noise_module_RotatePoint := NoRotatePoint.
	no_noise_ExceptionUnknown := NoExceptionUnknown
]
