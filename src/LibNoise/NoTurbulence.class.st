"
/// Noise module that randomly displaces the input value before
    /// returning the output value from a source module.
    ///
    /// @image html moduleturbulence.png
    ///
    /// @a Turbulence is the pseudo-random displacement of the input value.
    /// The GetValue() method randomly displaces the ( @a x, @a y, @a z )
    /// coordinates of the input value before retrieving the output value from
    /// the source module.  To control the turbulence, an application can
    /// modify its frequency, its power, and its roughness.
    ///
    /// The frequency of the turbulence determines how rapidly the
    /// displacement amount changes.  To specify the frequency, call the
    /// SetFrequency() method.
    ///
    /// The power of the turbulence determines the scaling factor that is
    /// applied to the displacement amount.  To specify the power, call the
    /// SetPower() method.
    ///
    /// The roughness of the turbulence determines the roughness of the
    /// changes to the displacement amount.  Low values smoothly change the
    /// displacement amount.  High values roughly change the displacement
    /// amount, which produces more ""kinky"" changes.  To specify the
    /// roughness, call the SetRoughness() method.
    ///
    /// Use of this noise module may require some trial and error.  Assuming
    /// that you are using a generator module as the source module, you
    /// should first:
    /// - Set the frequency to the same frequency as the source module.
    /// - Set the power to the reciprocal of the frequency.
    ///
    /// From these initial frequency and power values, modify these values
    /// until this noise module produce the desired changes in your terrain or
    /// texture.  For example:
    /// - Low frequency (1/8 initial frequency) and low power (1/8 initial
    ///   power) produces very minor, almost unnoticeable changes.
    /// - Low frequency (1/8 initial frequency) and high power (8 times
    ///   initial power) produces ""ropey"" lava-like terrain or marble-like
    ///   textures.
    /// - High frequency (8 times initial frequency) and low power (1/8
    ///   initial power) produces a noisy version of the initial terrain or
    ///   texture.
    /// - High frequency (8 times initial frequency) and high power (8 times
    ///   initial power) produces nearly pure noise, which isn't entirely
    ///   useful.
    ///
    /// Displacing the input values result in more realistic terrain and
    /// textures.  If you are generating elevations for terrain height maps,
    /// you can use this noise module to produce more realistic mountain
    /// ranges or terrain features that look like flowing lava rock.  If you
    /// are generating values for textures, you can use this noise module to
    /// produce realistic marble-like or ""oily"" textures.
    ///
    /// Internally, there are three noise::module::Perlin noise modules
    /// that displace the input value; one for the @a x, one for the @a y,
    /// and one for the @a z coordinate.
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoTurbulence',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoTurbulence class >> new [

	^ (self turbulence_new) initialize
]

{ #category : 'private' }
NoTurbulence class >> turbulence_new [
	"/// Constructor.
	 ///
	 /// The default frequency is set to
	 /// noise::module::DEFAULT_TURBULENCE_FREQUENCY.
	 ///
	 /// The default power is set to
	 /// noise::module::DEFAULT_TURBULENCE_POWER.
	 ///
	 /// The default roughness is set to
	 /// noise::module::DEFAULT_TURBULENCE_ROUGHNESS.
	 ///
	 /// The default seed value is set to
	 /// noise::module::DEFAULT_TURBULENCE_SEED."

	self ffiCall: #(no_noise_module_Turbulence* no_noise_module_Turbulence_new())
]

{ #category : 'finalizing' }
NoTurbulence >> dispose [

	self ffiCall: #(void no_noise_module_Turbulence_dispose(no_noise_module_Turbulence* self))
]

{ #category : 'public' }
NoTurbulence >> getFrequency [
	"/// Returns the frequency of the turbulence.
	 ///
	 /// @returns The frequency of the turbulence.
	 ///
	 /// The frequency of the turbulence determines how rapidly the
	 /// displacement amount changes."

	self ffiCall: #(double no_noise_module_Turbulence_GetFrequency(no_noise_module_Turbulence* self))
]

{ #category : 'public' }
NoTurbulence >> getPower [
	"/// Returns the power of the turbulence.
	 ///
	 /// @returns The power of the turbulence.
	 ///
	 /// The power of the turbulence determines the scaling factor that is
	 /// applied to the displacement amount."

	self ffiCall: #(double no_noise_module_Turbulence_GetPower(no_noise_module_Turbulence* self))
]

{ #category : 'public' }
NoTurbulence >> getRoughnessCount [
	"/// Returns the roughness of the turbulence.
	 ///
	 /// @returns The roughness of the turbulence.
	 ///
	 /// The roughness of the turbulence determines the roughness of the
	 /// changes to the displacement amount.  Low values smoothly change
	 /// the displacement amount.  High values roughly change the
	 /// displacement amount, which produces more ""kinky"" changes."

	self ffiCall: #(int no_noise_module_Turbulence_GetRoughnessCount(no_noise_module_Turbulence* self))
]

{ #category : 'public' }
NoTurbulence >> getSeed [
	"/// Returns the seed value of the internal Perlin-noise modules that
	 /// are used to displace the input values.
	 ///
	 /// @returns The seed value.
	 ///
	 /// Internally, there are three noise::module::Perlin noise modules
	 /// that displace the input value; one for the @a x, one for the @a y,
	 /// and one for the @a z coordinate."

	self ffiCall: #(int no_noise_module_Turbulence_GetSeed(no_noise_module_Turbulence* self))
]

{ #category : 'public' }
NoTurbulence >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Turbulence_GetSourceModuleCount(no_noise_module_Turbulence* self))
]

{ #category : 'public' }
NoTurbulence >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Turbulence_GetValue(no_noise_module_Turbulence* self, double x, double y, double z))
]

{ #category : 'public' }
NoTurbulence >> setFrequency: frequency [
	"/// Sets the frequency of the turbulence.
	 ///
	 /// @param frequency The frequency of the turbulence.
	 ///
	 /// The frequency of the turbulence determines how rapidly the
	 /// displacement amount changes."

	self ffiCall: #(void no_noise_module_Turbulence_SetFrequency(no_noise_module_Turbulence* self, double frequency))
]

{ #category : 'public' }
NoTurbulence >> setPower: power [
	"/// Sets the power of the turbulence.
	 ///
	 /// @param power The power of the turbulence.
	 ///
	 /// The power of the turbulence determines the scaling factor that is
	 /// applied to the displacement amount."

	self ffiCall: #(void no_noise_module_Turbulence_SetPower(no_noise_module_Turbulence* self, double power))
]

{ #category : 'public' }
NoTurbulence >> setRoughness: roughness [
	"/// Sets the roughness of the turbulence.
	 ///
	 /// @param roughness The roughness of the turbulence.
	 ///
	 /// The roughness of the turbulence determines the roughness of the
	 /// changes to the displacement amount.  Low values smoothly change
	 /// the displacement amount.  High values roughly change the
	 /// displacement amount, which produces more ""kinky"" changes.
	 ///
	 /// Internally, there are three noise::module::Perlin noise modules
	 /// that displace the input value; one for the @a x, one for the @a y,
	 /// and one for the @a z coordinate.  The roughness value is equal to
	 /// the number of octaves used by the noise::module::Perlin noise
	 /// modules."

	self ffiCall: #(void no_noise_module_Turbulence_SetRoughness(no_noise_module_Turbulence* self, int roughness))
]

{ #category : 'public' }
NoTurbulence >> setSeed: seed [
	"/// Sets the seed value of the internal noise modules that are used to
	 /// displace the input values.
	 ///
	 /// @param seed The seed value.
	 ///
	 /// Internally, there are three noise::module::Perlin noise modules
	 /// that displace the input value; one for the @a x, one for the @a y,
	 /// and one for the @a z coordinate.  This noise module assigns the
	 /// following seed values to the noise::module::Perlin noise modules:
	 /// - It assigns the seed value (@a seed + 0) to the @a x noise module.
	 /// - It assigns the seed value (@a seed + 1) to the @a y noise module.
	 /// - It assigns the seed value (@a seed + 2) to the @a z noise module."

	self ffiCall: #(void no_noise_module_Turbulence_SetSeed(no_noise_module_Turbulence* self, int seed))
]
