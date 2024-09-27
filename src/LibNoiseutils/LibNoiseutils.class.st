Class {
	#name : 'LibNoiseutils',
	#superclass : 'FFILibrary',
	#pools : [
		'NoNoiseTypedef',
		'NuNoiseutilsTypedef'
	],
	#category : 'LibNoiseutils-Library',
	#package : 'LibNoiseutils',
	#tag : 'Library'
}

{ #category : 'examples' }
LibNoiseutils class >> example [
	"this is taken from linoise tutorial"
	<sampleInstance>
	| mountainTerrain baseFlatTerrain flatTerrain terrainType terrainSelector finalTerrain heightMap heightMapBuilder renderer image writer |
	
	mountainTerrain := NoRidgedMulti new autoRelease.
	baseFlatTerrain := NoBillow new autoRelease.
	baseFlatTerrain setFrequency: 2.0.

	flatTerrain := NoScaleBias new autoRelease.
	flatTerrain setSourceModuleIndex: 0 sourceModule: baseFlatTerrain.
	flatTerrain setScale: 0.125.
	flatTerrain setBias: -0.75.

	terrainType := NoPerlin new autoRelease.
	terrainType setFrequency: 0.5.
	terrainType setPersistence: 0.25.

	terrainSelector := NoSelect new autoRelease.
	terrainSelector setSourceModuleIndex: 0 sourceModule: flatTerrain.
	terrainSelector setSourceModuleIndex: 1 sourceModule: mountainTerrain.
	terrainSelector setControlModule: terrainType.
	terrainSelector setBoundsLowerBound: 0.0  upperBound: 1000.0.
	terrainSelector setEdgeFalloff: 0.125.

	finalTerrain := NoTurbulence new autoRelease.
	finalTerrain setSourceModuleIndex: 0 sourceModule: terrainSelector. 
	finalTerrain setFrequency: 1.0.
	finalTerrain setPower: 0.125.

	heightMap := NuNoiseMap new autoRelease.
	heightMapBuilder := NuNoiseMapBuilderPlane new autoRelease.

	heightMapBuilder setSourceModule: finalTerrain.
	heightMapBuilder setDestNoiseMap: heightMap.
	heightMapBuilder setDestSizeDestWidth: 256 destHeight: 256.
	heightMapBuilder 
		setBoundsLowerXBound: 6.0 
		upperXBound: 10.0 
		lowerZBound: 1.0 
		upperZBound: 5.0.
	heightMapBuilder build.

	renderer := NuRendererImage new autoRelease.
	image := NuImage new autoRelease.

	renderer setSourceNoiseMap: heightMap.
	renderer setDestImage: image.

	renderer clearGradient.
	"renderer addGradientPointGradientPos: -1.00 gradientColor: (NuColor newR:  32 g: 160 b:   0 a: 255) autoRelease.
	renderer addGradientPointGradientPos: -0.25 gradientColor: (NuColor newR: 224 g: 224 b:   0 a: 255) autoRelease.
	renderer addGradientPointGradientPos:  0.25 gradientColor: (NuColor newR: 128 g: 128 b: 128 a: 255) autoRelease.
	renderer addGradientPointGradientPos:  1.00 gradientColor: (NuColor newR: 255 g: 255 b: 255 a: 255) autoRelease."
	renderer addGradientPointGradientPos: -1.0000 gradientColor: (NuColor newR: 0 g: 0 b: 128 a: 255) autoRelease.
	renderer addGradientPointGradientPos: -0.2500 gradientColor: (NuColor newR: 0 g: 0 b: 255 a: 255) autoRelease.
	renderer addGradientPointGradientPos:  0.0000 gradientColor: (NuColor newR: 0 g: 128 b: 255 a: 255) autoRelease.
	renderer addGradientPointGradientPos:  0.0625 gradientColor: (NuColor newR: 240 g: 240 b: 64 a: 255) autoRelease.
	renderer addGradientPointGradientPos:  0.1250 gradientColor: (NuColor newR: 32 g: 160 b: 0 a: 255) autoRelease.
	renderer addGradientPointGradientPos:  0.3750 gradientColor: (NuColor newR: 224 g: 224 b: 0 a: 255) autoRelease.
	renderer addGradientPointGradientPos:  0.7500 gradientColor: (NuColor newR: 128 g: 128 b: 128 a: 255) autoRelease.
	renderer addGradientPointGradientPos:  1.0000 gradientColor: (NuColor newR: 255 g: 255 b: 255 a: 255) autoRelease.

	renderer enableLight: true.
	renderer setLightContrast: 3.0.
	renderer setLightBrightness: 2.0.

	renderer render.

	writer := NuWriterBMP new.
	writer setSourceImage: image.
	writer setDestFilename: 'tutorial.bmp'.
	writer writeDestFile.

	^ (BMPReadWriter formFromFileNamed: 'tutorial.bmp') scaledToSize: 512@512
]

{ #category : 'accessing - platform' }
LibNoiseutils >> macLibraryName [

	^ FFIMacLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'noiseutils_bindings.dylib'
]

{ #category : 'accessing' }
LibNoiseutils >> runner [
	
	^ TFProcessLocalWorker new 
		defaultWorker: TFSameThreadRunner uniqueInstance;
		yourself
]

{ #category : 'accessing - platform' }
LibNoiseutils >> unix64LibraryName [

	^ FFIUnix64LibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'noiseutils_bindings.so'
]

{ #category : 'accessing - platform' }
LibNoiseutils >> win32LibraryName [

	^ FFIWindowsLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'noiseutils_bindings.dll'
]
