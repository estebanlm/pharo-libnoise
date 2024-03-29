"
/// Noise module that outputs three-dimensional ""billowy"" noise.
    ///
    /// @image html modulebillow.png
    ///
    /// This noise module generates ""billowy"" noise suitable for clouds and
    /// rocks.
    ///
    /// This noise module is nearly identical to noise::module::Perlin except
    /// this noise module modifies each octave with an absolute-value
    /// function.  See the documentation of noise::module::Perlin for more
    /// information.
"
Class {
	#name : 'NoBillow',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoBillow class >> billow_new [
	"/// Constructor.
	 ///
	 /// The default frequency is set to
	 /// noise::module::DEFAULT_BILLOW_FREQUENCY.
	 ///
	 /// The default lacunarity is set to
	 /// noise::module::DEFAULT_BILLOW_LACUNARITY.
	 ///
	 /// The default number of octaves is set to
	 /// noise::module::DEFAULT_BILLOW_OCTAVE_COUNT.
	 ///
	 /// The default persistence value is set to
	 /// noise::module::DEFAULT_BILLOW_PERSISTENCE.
	 ///
	 /// The default seed value is set to
	 /// noise::module::DEFAULT_BILLOW_SEED."

	self ffiCall: #(no_noise_module_Billow* no_noise_module_Billow_new())
]

{ #category : 'instance creation' }
NoBillow class >> new [

	^ (self billow_new) initialize
]

{ #category : 'finalizing' }
NoBillow >> dispose [

	self ffiCall: #(void no_noise_module_Billow_dispose(no_noise_module_Billow* self))
]

{ #category : 'public' }
NoBillow >> getFrequency [
	"/// Returns the frequency of the first octave.
	 ///
	 /// @returns The frequency of the first octave."

	self ffiCall: #(double no_noise_module_Billow_GetFrequency(no_noise_module_Billow* self))
]

{ #category : 'public' }
NoBillow >> getLacunarity [
	"/// Returns the lacunarity of the billowy noise.
	 ///
	 /// @returns The lacunarity of the billowy noise.
	 ///
	 /// The lacunarity is the frequency multiplier between successive
	 /// octaves."

	self ffiCall: #(double no_noise_module_Billow_GetLacunarity(no_noise_module_Billow* self))
]

{ #category : 'public' }
NoBillow >> getNoiseQuality [
	"/// Returns the quality of the billowy noise.
	 ///
	 /// @returns The quality of the billowy noise.
	 ///
	 /// See noise::NoiseQuality for definitions of the various
	 /// coherent-noise qualities."

	self ffiCall: #(no_noise_NoiseQuality no_noise_module_Billow_GetNoiseQuality(no_noise_module_Billow* self))
]

{ #category : 'public' }
NoBillow >> getOctaveCount [
	"/// Returns the number of octaves that generate the billowy noise.
	 ///
	 /// @returns The number of octaves that generate the billowy noise.
	 ///
	 /// The number of octaves controls the amount of detail in the billowy
	 /// noise."

	self ffiCall: #(int no_noise_module_Billow_GetOctaveCount(no_noise_module_Billow* self))
]

{ #category : 'public' }
NoBillow >> getPersistence [
	"/// Returns the persistence value of the billowy noise.
	 ///
	 /// @returns The persistence value of the billowy noise.
	 ///
	 /// The persistence value controls the roughness of the billowy noise."

	self ffiCall: #(double no_noise_module_Billow_GetPersistence(no_noise_module_Billow* self))
]

{ #category : 'public' }
NoBillow >> getSeed [
	"/// Returns the seed value used by the billowy-noise function.
	 ///
	 /// @returns The seed value."

	self ffiCall: #(int no_noise_module_Billow_GetSeed(no_noise_module_Billow* self))
]

{ #category : 'public' }
NoBillow >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Billow_GetSourceModuleCount(no_noise_module_Billow* self))
]

{ #category : 'public' }
NoBillow >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Billow_GetValue(no_noise_module_Billow* self, double x, double y, double z))
]

{ #category : 'public' }
NoBillow >> setFrequency: frequency [
	"/// Sets the frequency of the first octave.
	 ///
	 /// @param frequency The frequency of the first octave."

	self ffiCall: #(void no_noise_module_Billow_SetFrequency(no_noise_module_Billow* self, double frequency))
]

{ #category : 'public' }
NoBillow >> setLacunarity: lacunarity [
	"/// Sets the lacunarity of the billowy noise.
	 ///
	 /// @param lacunarity The lacunarity of the billowy noise.
	 ///
	 /// The lacunarity is the frequency multiplier between successive
	 /// octaves.
	 ///
	 /// For best results, set the lacunarity to a number between 1.5 and
	 /// 3.5."

	self ffiCall: #(void no_noise_module_Billow_SetLacunarity(no_noise_module_Billow* self, double lacunarity))
]

{ #category : 'public' }
NoBillow >> setNoiseQuality: noiseQuality [
	"/// Sets the quality of the billowy noise.
	 ///
	 /// @param noiseQuality The quality of the billowy noise.
	 ///
	 /// See noise::NoiseQuality for definitions of the various
	 /// coherent-noise qualities."

	self ffiCall: #(void no_noise_module_Billow_SetNoiseQuality(no_noise_module_Billow* self, no_noise_NoiseQuality noiseQuality))
]

{ #category : 'public' }
NoBillow >> setOctaveCount: octaveCount [
	"/// Sets the number of octaves that generate the billowy noise.
	 ///
	 /// @param octaveCount The number of octaves that generate the billowy
	 /// noise.
	 ///
	 /// @pre The number of octaves ranges from 1 to
	 /// noise::module::BILLOW_MAX_OCTAVE.
	 ///
	 /// @throw noise::ExceptionInvalidParam An invalid parameter was
	 /// specified; see the preconditions for more information.
	 ///
	 /// The number of octaves controls the amount of detail in the billowy
	 /// noise.
	 ///
	 /// The larger the number of octaves, the more time required to
	 /// calculate the billowy-noise value."

	self ffiCall: #(void no_noise_module_Billow_SetOctaveCount(no_noise_module_Billow* self, int octaveCount))
]

{ #category : 'public' }
NoBillow >> setPersistence: persistence [
	"/// Sets the persistence value of the billowy noise.
	 ///
	 /// @param persistence The persistence value of the billowy noise.
	 ///
	 /// The persistence value controls the roughness of the billowy noise.
	 ///
	 /// For best results, set the persistence value to a number between
	 /// 0.0 and 1.0."

	self ffiCall: #(void no_noise_module_Billow_SetPersistence(no_noise_module_Billow* self, double persistence))
]

{ #category : 'public' }
NoBillow >> setSeed: seed [
	"/// Sets the seed value used by the billowy-noise function.
	 ///
	 /// @param seed The seed value."

	self ffiCall: #(void no_noise_module_Billow_SetSeed(no_noise_module_Billow* self, int seed))
]
