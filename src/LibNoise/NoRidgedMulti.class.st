"
/// Noise module that outputs 3-dimensional ridged-multifractal noise.
    ///
    /// @image html moduleridgedmulti.png
    ///
    /// This noise module, heavily based on the Perlin-noise module, generates
    /// ridged-multifractal noise.  Ridged-multifractal noise is generated in
    /// much of the same way as Perlin noise, except the output of each octave
    /// is modified by an absolute-value function.  Modifying the octave
    /// values in this way produces ridge-like formations.
    ///
    /// Ridged-multifractal noise does not use a persistence value.  This is
    /// because the persistence values of the octaves are based on the values
    /// generated from from previous octaves, creating a feedback loop (or
    /// that's what it looks like after reading the code.)
    ///
    /// This noise module outputs ridged-multifractal-noise values that
    /// usually range from -1.0 to +1.0, but there are no guarantees that all
    /// output values will exist within that range.
    ///
    /// @note For ridged-multifractal noise generated with only one octave,
    /// the output value ranges from -1.0 to 0.0.
    ///
    /// Ridged-multifractal noise is often used to generate craggy mountainous
    /// terrain or marble-like textures.
    ///
    /// This noise module does not require any source modules.
    ///
    /// <b>Octaves</b>
    ///
    /// The number of octaves control the <i>amount of detail</i> of the
    /// ridged-multifractal noise.  Adding more octaves increases the detail
    /// of the ridged-multifractal noise, but with the drawback of increasing
    /// the calculation time.
    ///
    /// An application may specify the number of octaves that generate
    /// ridged-multifractal noise by calling the SetOctaveCount() method.
    ///
    /// <b>Frequency</b>
    ///
    /// An application may specify the frequency of the first octave by
    /// calling the SetFrequency() method.
    ///
    /// <b>Lacunarity</b>
    ///
    /// The lacunarity specifies the frequency multipler between successive
    /// octaves.
    ///
    /// The effect of modifying the lacunarity is subtle; you may need to play
    /// with the lacunarity value to determine the effects.  For best results,
    /// set the lacunarity to a number between 1.5 and 3.5.
    ///
    /// <b>References &amp; Acknowledgments</b>
    ///
    /// <a href=http://www.texturingandmodeling.com/Musgrave.html>F.
    /// Kenton ""Doc Mojo"" Musgrave's texturing page</a> - This page contains
    /// links to source code that generates ridged-multfractal noise, among
    /// other types of noise.  The source file <a
    /// href=http://www.texturingandmodeling.com/CODE/MUSGRAVE/CLOUD/fractal.c>
    /// fractal.c</a> contains the code I used in my ridged-multifractal class
    /// (see the @a RidgedMultifractal() function.)  This code was written by F.
    /// Kenton Musgrave, the person who created
    /// <a href=http://www.pandromeda.com/>MojoWorld</a>.  He is also one of
    /// the authors in <i>Texturing and Modeling: A Procedural Approach</i>
    /// (Morgan Kaufmann, 2002. ISBN 1-55860-848-6.)
"
Class {
	#name : 'NoRidgedMulti',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoRidgedMulti class >> new [

	^ (self ridgedMulti_new) initialize
]

{ #category : 'private' }
NoRidgedMulti class >> ridgedMulti_new [
	"/// Constructor.
	 ///
	 /// The default number of octaves is set to
	 /// noise::module::DEFAULT_RIDGED_OCTAVE_COUNT.
	 ///
	 /// The default frequency is set to
	 /// noise::module::DEFAULT_RIDGED_FREQUENCY.
	 ///
	 /// The default lacunarity is set to
	 /// noise::module::DEFAULT_RIDGED_LACUNARITY.
	 ///
	 /// The default seed value is set to
	 /// noise::module::DEFAULT_RIDGED_SEED."

	self ffiCall: #(no_noise_module_RidgedMulti* no_noise_module_RidgedMulti_new())
]

{ #category : 'finalizing' }
NoRidgedMulti >> dispose [

	self ffiCall: #(void no_noise_module_RidgedMulti_dispose(no_noise_module_RidgedMulti* self))
]

{ #category : 'public' }
NoRidgedMulti >> getFrequency [
	"/// Returns the frequency of the first octave.
	 ///
	 /// @returns The frequency of the first octave."

	self ffiCall: #(double no_noise_module_RidgedMulti_GetFrequency(no_noise_module_RidgedMulti* self))
]

{ #category : 'public' }
NoRidgedMulti >> getLacunarity [
	"/// Returns the lacunarity of the ridged-multifractal noise.
	 ///
	 /// @returns The lacunarity of the ridged-multifractal noise.
	 ///
	 /// The lacunarity is the frequency multiplier between successive
	 /// octaves."

	self ffiCall: #(double no_noise_module_RidgedMulti_GetLacunarity(no_noise_module_RidgedMulti* self))
]

{ #category : 'public' }
NoRidgedMulti >> getNoiseQuality [
	"/// Returns the quality of the ridged-multifractal noise.
	 ///
	 /// @returns The quality of the ridged-multifractal noise.
	 ///
	 /// See noise::NoiseQuality for definitions of the various
	 /// coherent-noise qualities."

	self ffiCall: #(no_noise_NoiseQuality no_noise_module_RidgedMulti_GetNoiseQuality(no_noise_module_RidgedMulti* self))
]

{ #category : 'public' }
NoRidgedMulti >> getOctaveCount [
	"/// Returns the number of octaves that generate the
	 /// ridged-multifractal noise.
	 ///
	 /// @returns The number of octaves that generate the
	 /// ridged-multifractal noise.
	 ///
	 /// The number of octaves controls the amount of detail in the
	 /// ridged-multifractal noise."

	self ffiCall: #(int no_noise_module_RidgedMulti_GetOctaveCount(no_noise_module_RidgedMulti* self))
]

{ #category : 'public' }
NoRidgedMulti >> getSeed [
	"/// Returns the seed value used by the ridged-multifractal-noise
	 /// function.
	 ///
	 /// @returns The seed value."

	self ffiCall: #(int no_noise_module_RidgedMulti_GetSeed(no_noise_module_RidgedMulti* self))
]

{ #category : 'public' }
NoRidgedMulti >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_RidgedMulti_GetSourceModuleCount(no_noise_module_RidgedMulti* self))
]

{ #category : 'public' }
NoRidgedMulti >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_RidgedMulti_GetValue(no_noise_module_RidgedMulti* self, double x, double y, double z))
]

{ #category : 'public' }
NoRidgedMulti >> setFrequency: frequency [
	"/// Sets the frequency of the first octave.
	 ///
	 /// @param frequency The frequency of the first octave."

	self ffiCall: #(void no_noise_module_RidgedMulti_SetFrequency(no_noise_module_RidgedMulti* self, double frequency))
]

{ #category : 'public' }
NoRidgedMulti >> setLacunarity: lacunarity [
	"/// Sets the lacunarity of the ridged-multifractal noise.
	 ///
	 /// @param lacunarity The lacunarity of the ridged-multifractal noise.
	 ///
	 /// The lacunarity is the frequency multiplier between successive
	 /// octaves.
	 ///
	 /// For best results, set the lacunarity to a number between 1.5 and
	 /// 3.5."

	self ffiCall: #(void no_noise_module_RidgedMulti_SetLacunarity(no_noise_module_RidgedMulti* self, double lacunarity))
]

{ #category : 'public' }
NoRidgedMulti >> setNoiseQuality: noiseQuality [
	"/// Sets the quality of the ridged-multifractal noise.
	 ///
	 /// @param noiseQuality The quality of the ridged-multifractal noise.
	 ///
	 /// See noise::NoiseQuality for definitions of the various
	 /// coherent-noise qualities."

	self ffiCall: #(void no_noise_module_RidgedMulti_SetNoiseQuality(no_noise_module_RidgedMulti* self, no_noise_NoiseQuality noiseQuality))
]

{ #category : 'public' }
NoRidgedMulti >> setOctaveCount: octaveCount [
	"/// Sets the number of octaves that generate the ridged-multifractal
	 /// noise.
	 ///
	 /// @param octaveCount The number of octaves that generate the
	 /// ridged-multifractal noise.
	 ///
	 /// @pre The number of octaves ranges from 1 to
	 /// noise::module::RIDGED_MAX_OCTAVE.
	 ///
	 /// @throw noise::ExceptionInvalidParam An invalid parameter was
	 /// specified; see the preconditions for more information.
	 ///
	 /// The number of octaves controls the amount of detail in the
	 /// ridged-multifractal noise.
	 ///
	 /// The larger the number of octaves, the more time required to
	 /// calculate the ridged-multifractal-noise value."

	self ffiCall: #(void no_noise_module_RidgedMulti_SetOctaveCount(no_noise_module_RidgedMulti* self, int octaveCount))
]

{ #category : 'public' }
NoRidgedMulti >> setSeed: seed [
	"/// Sets the seed value used by the ridged-multifractal-noise
	 /// function.
	 ///
	 /// @param seed The seed value."

	self ffiCall: #(void no_noise_module_RidgedMulti_SetSeed(no_noise_module_RidgedMulti* self, int seed))
]
