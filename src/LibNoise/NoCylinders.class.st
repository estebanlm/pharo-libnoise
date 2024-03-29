"
/// Noise module that outputs concentric cylinders.
    ///
    /// @image html modulecylinders.png
    ///
    /// This noise module outputs concentric cylinders centered on the origin.
    /// These cylinders are oriented along the @a y axis similar to the
    /// concentric rings of a tree.  Each cylinder extends infinitely along
    /// the @a y axis.
    ///
    /// The first cylinder has a radius of 1.0.  Each subsequent cylinder has
    /// a radius that is 1.0 unit larger than the previous cylinder.
    ///
    /// The output value from this noise module is determined by the distance
    /// between the input value and the the nearest cylinder surface.  The
    /// input values that are located on a cylinder surface are given the
    /// output value 1.0 and the input values that are equidistant from two
    /// cylinder surfaces are given the output value -1.0.
    ///
    /// An application can change the frequency of the concentric cylinders.
    /// Increasing the frequency reduces the distances between cylinders.  To
    /// specify the frequency, call the SetFrequency() method.
    ///
    /// This noise module, modified with some low-frequency, low-power
    /// turbulence, is useful for generating wood-like textures.
    ///
    /// This noise module does not require any source modules.
"
Class {
	#name : 'NoCylinders',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoCylinders class >> cylinders_new [
	"/// Constructor.
	 ///
	 /// The default frequency is set to
	 /// noise::module::DEFAULT_CYLINDERS_FREQUENCY."

	self ffiCall: #(no_noise_module_Cylinders* no_noise_module_Cylinders_new())
]

{ #category : 'instance creation' }
NoCylinders class >> new [

	^ (self cylinders_new) initialize
]

{ #category : 'finalizing' }
NoCylinders >> dispose [

	self ffiCall: #(void no_noise_module_Cylinders_dispose(no_noise_module_Cylinders* self))
]

{ #category : 'public' }
NoCylinders >> getFrequency [
	"/// Returns the frequency of the concentric cylinders.
	 ///
	 /// @returns The frequency of the concentric cylinders.
	 ///
	 /// Increasing the frequency increases the density of the concentric
	 /// cylinders, reducing the distances between them."

	self ffiCall: #(double no_noise_module_Cylinders_GetFrequency(no_noise_module_Cylinders* self))
]

{ #category : 'public' }
NoCylinders >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Cylinders_GetSourceModuleCount(no_noise_module_Cylinders* self))
]

{ #category : 'public' }
NoCylinders >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Cylinders_GetValue(no_noise_module_Cylinders* self, double x, double y, double z))
]

{ #category : 'public' }
NoCylinders >> setFrequency: frequency [
	"/// Sets the frequenct of the concentric cylinders.
	 ///
	 /// @param frequency The frequency of the concentric cylinders.
	 ///
	 /// Increasing the frequency increases the density of the concentric
	 /// cylinders, reducing the distances between them."

	self ffiCall: #(void no_noise_module_Cylinders_SetFrequency(no_noise_module_Cylinders* self, double frequency))
]
