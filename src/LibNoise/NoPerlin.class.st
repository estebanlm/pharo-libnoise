"
/// Noise module that outputs 3-dimensional Perlin noise.
    ///
    /// @image html moduleperlin.png
    ///
    /// Perlin noise is the sum of several coherent-noise functions of
    /// ever-increasing frequencies and ever-decreasing amplitudes.
    ///
    /// An important property of Perlin noise is that a small change in the
    /// input value will produce a small change in the output value, while a
    /// large change in the input value will produce a random change in the
    /// output value.
    ///
    /// This noise module outputs Perlin-noise values that usually range from
    /// -1.0 to +1.0, but there are no guarantees that all output values will
    /// exist within that range.
    ///
    /// For a better description of Perlin noise, see the links in the
    /// <i>References and Acknowledgments</i> section.
    ///
    /// This noise module does not require any source modules.
    ///
    /// <b>Octaves</b>
    ///
    /// The number of octaves control the <i>amount of detail</i> of the
    /// Perlin noise.  Adding more octaves increases the detail of the Perlin
    /// noise, but with the drawback of increasing the calculation time.
    ///
    /// An octave is one of the coherent-noise functions in a series of
    /// coherent-noise functions that are added together to form Perlin
    /// noise.
    ///
    /// An application may specify the frequency of the first octave by
    /// calling the SetFrequency() method.
    ///
    /// An application may specify the number of octaves that generate Perlin
    /// noise by calling the SetOctaveCount() method.
    ///
    /// These coherent-noise functions are called octaves because each octave
    /// has, by default, double the frequency of the previous octave.  Musical
    /// tones have this property as well; a musical C tone that is one octave
    /// higher than the previous C tone has double its frequency.
    ///
    /// <b>Frequency</b>
    ///
    /// An application may specify the frequency of the first octave by
    /// calling the SetFrequency() method.
    ///
    /// <b>Persistence</b>
    ///
    /// The persistence value controls the <i>roughness</i> of the Perlin
    /// noise.  Larger values produce rougher noise.
    ///
    /// The persistence value determines how quickly the amplitudes diminish
    /// for successive octaves.  The amplitude of the first octave is 1.0.
    /// The amplitude of each subsequent octave is equal to the product of the
    /// previous octave's amplitude and the persistence value.  So a
    /// persistence value of 0.5 sets the amplitude of the first octave to
    /// 1.0; the second, 0.5; the third, 0.25; etc.
    ///
    /// An application may specify the persistence value by calling the
    /// SetPersistence() method.
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
    /// <b>References &amp; acknowledgments</b>
    ///
    /// <a href=http://www.noisemachine.com/talk1/>The Noise Machine</a> -
    /// From the master, Ken Perlin himself.  This page contains a
    /// presentation that describes Perlin noise and some of its variants.
    /// He won an Oscar for creating the Perlin noise algorithm!
    ///
    /// <a
    /// href=http://freespace.virgin.net/hugo.elias/models/m_perlin.htm>
    /// Perlin Noise</a> - Hugo Elias's webpage contains a very good
    /// description of Perlin noise and describes its many applications.  This
    /// page gave me the inspiration to create libnoise in the first place.
    /// Now that I know how to generate Perlin noise, I will never again use
    /// cheesy subdivision algorithms to create terrain (unless I absolutely
    /// need the speed.)
    ///
    /// <a
    /// href=http://www.robo-murito.net/code/perlin-noise-math-faq.html>The
    /// Perlin noise math FAQ</a> - A good page that describes Perlin noise in
    /// plain English with only a minor amount of math.  During development of
    /// libnoise, I noticed that my coherent-noise function generated terrain
    /// with some ""regularity"" to the terrain features.  This page describes a
    /// better coherent-noise function called <i>gradient noise</i>.  This
    /// version of noise::module::Perlin uses gradient coherent noise to
    /// generate Perlin noise.
"
Class {
	#name : 'NoPerlin',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoPerlin class >> new [

	^ (self perlin_new) initialize
]

{ #category : 'private' }
NoPerlin class >> perlin_new [
	"/// Constructor.
	 ///
	 /// The default frequency is set to
	 /// noise::module::DEFAULT_PERLIN_FREQUENCY.
	 ///
	 /// The default lacunarity is set to
	 /// noise::module::DEFAULT_PERLIN_LACUNARITY.
	 ///
	 /// The default number of octaves is set to
	 /// noise::module::DEFAULT_PERLIN_OCTAVE_COUNT.
	 ///
	 /// The default persistence value is set to
	 /// noise::module::DEFAULT_PERLIN_PERSISTENCE.
	 ///
	 /// The default seed value is set to
	 /// noise::module::DEFAULT_PERLIN_SEED."

	self ffiCall: #(no_noise_module_Perlin* no_noise_module_Perlin_new())
]

{ #category : 'finalizing' }
NoPerlin >> dispose [

	self ffiCall: #(void no_noise_module_Perlin_dispose(no_noise_module_Perlin* self))
]

{ #category : 'public' }
NoPerlin >> getFrequency [
	"/// Returns the frequency of the first octave.
	 ///
	 /// @returns The frequency of the first octave."

	self ffiCall: #(double no_noise_module_Perlin_GetFrequency(no_noise_module_Perlin* self))
]

{ #category : 'public' }
NoPerlin >> getLacunarity [
	"/// Returns the lacunarity of the Perlin noise.
	 ///
	 /// @returns The lacunarity of the Perlin noise.
	 ///
	 /// The lacunarity is the frequency multiplier between successive
	 /// octaves."

	self ffiCall: #(double no_noise_module_Perlin_GetLacunarity(no_noise_module_Perlin* self))
]

{ #category : 'public' }
NoPerlin >> getNoiseQuality [
	"/// Returns the quality of the Perlin noise.
	 ///
	 /// @returns The quality of the Perlin noise.
	 ///
	 /// See noise::NoiseQuality for definitions of the various
	 /// coherent-noise qualities."

	self ffiCall: #(no_noise_NoiseQuality no_noise_module_Perlin_GetNoiseQuality(no_noise_module_Perlin* self))
]

{ #category : 'public' }
NoPerlin >> getOctaveCount [
	"/// Returns the number of octaves that generate the Perlin noise.
	 ///
	 /// @returns The number of octaves that generate the Perlin noise.
	 ///
	 /// The number of octaves controls the amount of detail in the Perlin
	 /// noise."

	self ffiCall: #(int no_noise_module_Perlin_GetOctaveCount(no_noise_module_Perlin* self))
]

{ #category : 'public' }
NoPerlin >> getPersistence [
	"/// Returns the persistence value of the Perlin noise.
	 ///
	 /// @returns The persistence value of the Perlin noise.
	 ///
	 /// The persistence value controls the roughness of the Perlin noise."

	self ffiCall: #(double no_noise_module_Perlin_GetPersistence(no_noise_module_Perlin* self))
]

{ #category : 'public' }
NoPerlin >> getSeed [
	"/// Returns the seed value used by the Perlin-noise function.
	 ///
	 /// @returns The seed value."

	self ffiCall: #(int no_noise_module_Perlin_GetSeed(no_noise_module_Perlin* self))
]

{ #category : 'public' }
NoPerlin >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Perlin_GetSourceModuleCount(no_noise_module_Perlin* self))
]

{ #category : 'public' }
NoPerlin >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Perlin_GetValue(no_noise_module_Perlin* self, double x, double y, double z))
]

{ #category : 'public' }
NoPerlin >> setFrequency: frequency [
	"/// Sets the frequency of the first octave.
	 ///
	 /// @param frequency The frequency of the first octave."

	self ffiCall: #(void no_noise_module_Perlin_SetFrequency(no_noise_module_Perlin* self, double frequency))
]

{ #category : 'public' }
NoPerlin >> setLacunarity: lacunarity [
	"/// Sets the lacunarity of the Perlin noise.
	 ///
	 /// @param lacunarity The lacunarity of the Perlin noise.
	 ///
	 /// The lacunarity is the frequency multiplier between successive
	 /// octaves.
	 ///
	 /// For best results, set the lacunarity to a number between 1.5 and
	 /// 3.5."

	self ffiCall: #(void no_noise_module_Perlin_SetLacunarity(no_noise_module_Perlin* self, double lacunarity))
]

{ #category : 'public' }
NoPerlin >> setNoiseQuality: noiseQuality [
	"/// Sets the quality of the Perlin noise.
	 ///
	 /// @param noiseQuality The quality of the Perlin noise.
	 ///
	 /// See noise::NoiseQuality for definitions of the various
	 /// coherent-noise qualities."

	self ffiCall: #(void no_noise_module_Perlin_SetNoiseQuality(no_noise_module_Perlin* self, no_noise_NoiseQuality noiseQuality))
]

{ #category : 'public' }
NoPerlin >> setOctaveCount: octaveCount [
	"/// Sets the number of octaves that generate the Perlin noise.
	 ///
	 /// @param octaveCount The number of octaves that generate the Perlin
	 /// noise.
	 ///
	 /// @pre The number of octaves ranges from 1 to
	 /// noise::module::PERLIN_MAX_OCTAVE.
	 ///
	 /// @throw noise::ExceptionInvalidParam An invalid parameter was
	 /// specified; see the preconditions for more information.
	 ///
	 /// The number of octaves controls the amount of detail in the Perlin
	 /// noise.
	 ///
	 /// The larger the number of octaves, the more time required to
	 /// calculate the Perlin-noise value."

	self ffiCall: #(void no_noise_module_Perlin_SetOctaveCount(no_noise_module_Perlin* self, int octaveCount))
]

{ #category : 'public' }
NoPerlin >> setPersistence: persistence [
	"/// Sets the persistence value of the Perlin noise.
	 ///
	 /// @param persistence The persistence value of the Perlin noise.
	 ///
	 /// The persistence value controls the roughness of the Perlin noise.
	 ///
	 /// For best results, set the persistence to a number between 0.0 and
	 /// 1.0."

	self ffiCall: #(void no_noise_module_Perlin_SetPersistence(no_noise_module_Perlin* self, double persistence))
]

{ #category : 'public' }
NoPerlin >> setSeed: seed [
	"/// Sets the seed value used by the Perlin-noise function.
	 ///
	 /// @param seed The seed value."

	self ffiCall: #(void no_noise_module_Perlin_SetSeed(no_noise_module_Perlin* self, int seed))
]
