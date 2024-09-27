Class {
	#name : 'NuNoiseutilsTypedef',
	#superclass : 'SharedPool',
	#classVars : [
		'bool',
		'int16_t',
		'int32_t',
		'int64_t',
		'int8_t',
		'nu_noise_utils_Color',
		'nu_noise_utils_GradientColor',
		'nu_noise_utils_GradientPoint',
		'nu_noise_utils_Image',
		'nu_noise_utils_NoiseMap',
		'nu_noise_utils_NoiseMapBuilder',
		'nu_noise_utils_NoiseMapBuilderCylinder',
		'nu_noise_utils_NoiseMapBuilderPlane',
		'nu_noise_utils_NoiseMapBuilderSphere',
		'nu_noise_utils_NoiseMapCallback',
		'nu_noise_utils_RendererImage',
		'nu_noise_utils_RendererNormalMap',
		'nu_noise_utils_WriterBMP',
		'nu_noise_utils_WriterTER',
		'pid_t',
		'time_t',
		'uint16_t',
		'uint32_t',
		'uint64_t',
		'uint8_t',
		'uintptr_t'
	],
	#category : 'LibNoiseutils-Library',
	#package : 'LibNoiseutils',
	#tag : 'Library'
}

{ #category : 'class initialization' }
NuNoiseutilsTypedef class >> initialize [

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
	nu_noise_utils_NoiseMapBuilderCylinder := NuNoiseMapBuilderCylinder.
	nu_noise_utils_NoiseMapBuilderPlane := NuNoiseMapBuilderPlane.
	nu_noise_utils_NoiseMapBuilderSphere := NuNoiseMapBuilderSphere.
	nu_noise_utils_Color := NuColor.
	nu_noise_utils_WriterTER := NuWriterTER.
	nu_noise_utils_NoiseMapBuilder := NuNoiseMapBuilder.
	nu_noise_utils_RendererNormalMap := NuRendererNormalMap.
	nu_noise_utils_GradientColor := NuGradientColor.
	nu_noise_utils_NoiseMap := NuNoiseMap.
	nu_noise_utils_NoiseMapCallback := FFICallback.
	nu_noise_utils_RendererImage := NuRendererImage.
	nu_noise_utils_Image := NuImage.
	nu_noise_utils_WriterBMP := NuWriterBMP.
	nu_noise_utils_GradientPoint := NuGradientPoint
]
