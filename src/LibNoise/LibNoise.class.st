Class {
	#name : 'LibNoise',
	#superclass : 'FFILibrary',
	#pools : [
		'NoNoiseTypedef'
	],
	#category : 'LibNoise-Library',
	#package : 'LibNoise',
	#tag : 'Library'
}

{ #category : 'examples' }
LibNoise class >> example [
	"this is taken from linoise tutorial"
	<sampleInstance>
	
	^ self example: 42.0
]

{ #category : 'examples' }
LibNoise class >> example: seed [
	"this is taken from linoise tutorial"
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
	terrainType setSeed: seed.

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

{ #category : 'public' }
LibNoise >> clampValue: value lowerBound: lowerBound upperBound: upperBound [
	"/// Clamps a value onto a clamping range.
	 ///
	 /// @param value The value to clamp.
	 /// @param lowerBound The lower bound of the clamping range.
	 /// @param upperBound The upper bound of the clamping range.
	 ///
	 /// @returns
	 /// - @a value if @a value lies between @a lowerBound and @a upperBound.
	 /// - @a lowerBound if @a value is less than @a lowerBound.
	 /// - @a upperBound if @a value is greater than @a upperBound.
	 ///
	 /// This function does not modify any parameters."

	self ffiCall: #(int no_noise_ClampValue(int value, int lowerBound, int upperBound))
]

{ #category : 'public' }
LibNoise >> clampValueValue: value lowerBound: lowerBound upperBound: upperBound [
	"/// Clamps a value onto a clamping range.
	 ///
	 /// @param value The value to clamp.
	 /// @param lowerBound The lower bound of the clamping range.
	 /// @param upperBound The upper bound of the clamping range.
	 ///
	 /// @returns
	 /// - @a value if @a value lies between @a lowerBound and @a upperBound.
	 /// - @a lowerBound if @a value is less than @a lowerBound.
	 /// - @a upperBound if @a value is greater than @a upperBound.
	 ///
	 /// This function does not modify any parameters."

	self ffiCall: #(int no_noise_ClampValue(int value, int lowerBound, int upperBound))
]

{ #category : 'public' }
LibNoise >> gradientCoherentNoise3DX: x y: y z: z seed: seed noiseQuality: noiseQuality [
	"/// Generates a gradient-coherent-noise value from the coordinates of a
	 /// three-dimensional input value.
	 ///
	 /// @param x The @a x coordinate of the input value.
	 /// @param y The @a y coordinate of the input value.
	 /// @param z The @a z coordinate of the input value.
	 /// @param seed The random number seed.
	 /// @param noiseQuality The quality of the coherent-noise.
	 ///
	 /// @returns The generated gradient-coherent-noise value.
	 ///
	 /// The return value ranges from -1.0 to +1.0.
	 ///
	 /// For an explanation of the difference between <i>gradient</i> noise and
	 /// <i>value</i> noise, see the comments for the GradientNoise3D() function."

	self ffiCall: #(double no_noise_GradientCoherentNoise3D(double x, double y, double z, int seed, no_noise_NoiseQuality noiseQuality))
]

{ #category : 'public' }
LibNoise >> gradientNoise3DFx: fx fy: fy fz: fz ix: ix iy: iy iz: iz seed: seed [
	"/// Generates a gradient-noise value from the coordinates of a
	 /// three-dimensional input value and the integer coordinates of a
	 /// nearby three-dimensional value.
	 ///
	 /// @param fx The floating-point @a x coordinate of the input value.
	 /// @param fy The floating-point @a y coordinate of the input value.
	 /// @param fz The floating-point @a z coordinate of the input value.
	 /// @param ix The integer @a x coordinate of a nearby value.
	 /// @param iy The integer @a y coordinate of a nearby value.
	 /// @param iz The integer @a z coordinate of a nearby value.
	 /// @param seed The random number seed.
	 ///
	 /// @returns The generated gradient-noise value.
	 ///
	 /// @pre The difference between @a fx and @a ix must be less than or equal
	 /// to one.
	 ///
	 /// @pre The difference between @a fy and @a iy must be less than or equal
	 /// to one.
	 ///
	 /// @pre The difference between @a fz and @a iz must be less than or equal
	 /// to one.
	 ///
	 /// A <i>gradient</i>-noise function generates better-quality noise than a
	 /// <i>value</i>-noise function.  Most noise modules use gradient noise for
	 /// this reason, although it takes much longer to calculate.
	 ///
	 /// The return value ranges from -1.0 to +1.0.
	 ///
	 /// This function generates a gradient-noise value by performing the
	 /// following steps:
	 /// - It first calculates a random normalized vector based on the
	 ///   nearby integer value passed to this function.
	 /// - It then calculates a new value by adding this vector to the
	 ///   nearby integer value passed to this function.
	 /// - It then calculates the dot product of the above-generated value
	 ///   and the floating-point input value passed to this function.
	 ///
	 /// A noise function differs from a random-number generator because it
	 /// always returns the same output value if the same input value is passed
	 /// to it."

	self ffiCall: #(double no_noise_GradientNoise3D(double fx, double fy, double fz, int ix, int iy, int iz, int seed))
]

{ #category : 'public' }
LibNoise >> intValueNoise3DX: x y: y z: z seed: seed [
	"/// Generates an integer-noise value from the coordinates of a
	 /// three-dimensional input value.
	 ///
	 /// @param x The integer @a x coordinate of the input value.
	 /// @param y The integer @a y coordinate of the input value.
	 /// @param z The integer @a z coordinate of the input value.
	 /// @param seed A random number seed.
	 ///
	 /// @returns The generated integer-noise value.
	 ///
	 /// The return value ranges from 0 to 2147483647.
	 ///
	 /// A noise function differs from a random-number generator because it
	 /// always returns the same output value if the same input value is passed
	 /// to it."

	self ffiCall: #(int no_noise_IntValueNoise3D(int x, int y, int z, int seed))
]

{ #category : 'accessing - platform' }
LibNoise >> macLibraryName [

	^ FFIMacLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'noise_bindings.dylib'
]

{ #category : 'public' }
LibNoise >> makeInt32Range: n [
	"/// Modifies a floating-point value so that it can be stored in a
	 /// noise::int32 variable.
	 ///
	 /// @param n A floating-point number.
	 ///
	 /// @returns The modified floating-point number.
	 ///
	 /// This function does not modify @a n.
	 ///
	 /// In libnoise, the noise-generating algorithms are all integer-based;
	 /// they use variables of type noise::int32.  Before calling a noise
	 /// function, pass the @a x, @a y, and @a z coordinates to this function to
	 /// ensure that these coordinates can be cast to a noise::int32 value.
	 ///
	 /// Although you could do a straight cast from double to noise::int32, the
	 /// resulting value may differ between platforms.  By using this function,
	 /// you ensure that the resulting value is identical between platforms."

	self ffiCall: #(double no_noise_MakeInt32Range(double n))
]

{ #category : 'accessing' }
LibNoise >> runner [
	
	^ TFProcessLocalWorker new 
		defaultWorker: TFSameThreadRunner uniqueInstance;
		yourself
]

{ #category : 'accessing - platform' }
LibNoise >> unix64LibraryName [

	^ FFIUnix64LibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'noise_bindings.so'
]

{ #category : 'public' }
LibNoise >> valueCoherentNoise3DX: x y: y z: z seed: seed noiseQuality: noiseQuality [
	"/// Generates a value-coherent-noise value from the coordinates of a
	 /// three-dimensional input value.
	 ///
	 /// @param x The @a x coordinate of the input value.
	 /// @param y The @a y coordinate of the input value.
	 /// @param z The @a z coordinate of the input value.
	 /// @param seed The random number seed.
	 /// @param noiseQuality The quality of the coherent-noise.
	 ///
	 /// @returns The generated value-coherent-noise value.
	 ///
	 /// The return value ranges from -1.0 to +1.0.
	 ///
	 /// For an explanation of the difference between <i>gradient</i> noise and
	 /// <i>value</i> noise, see the comments for the GradientNoise3D() function."

	self ffiCall: #(double no_noise_ValueCoherentNoise3D(double x, double y, double z, int seed, no_noise_NoiseQuality noiseQuality))
]

{ #category : 'public' }
LibNoise >> valueNoise3DX: x y: y z: z seed: seed [
	"/// Generates a value-noise value from the coordinates of a
	 /// three-dimensional input value.
	 ///
	 /// @param x The @a x coordinate of the input value.
	 /// @param y The @a y coordinate of the input value.
	 /// @param z The @a z coordinate of the input value.
	 /// @param seed A random number seed.
	 ///
	 /// @returns The generated value-noise value.
	 ///
	 /// The return value ranges from -1.0 to +1.0.
	 ///
	 /// A noise function differs from a random-number generator because it
	 /// always returns the same output value if the same input value is passed
	 /// to it."

	self ffiCall: #(double no_noise_ValueNoise3D(int x, int y, int z, int seed))
]

{ #category : 'accessing - platform' }
LibNoise >> win32LibraryName [

	^ FFIWindowsLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'noise_bindings.dll'
]
