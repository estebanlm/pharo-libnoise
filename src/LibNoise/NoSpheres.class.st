"
/// Noise module that outputs concentric spheres.
    ///
    /// @image html modulespheres.png
    ///
    /// This noise module outputs concentric spheres centered on the origin
    /// like the concentric rings of an onion.
    ///
    /// The first sphere has a radius of 1.0.  Each subsequent sphere has a
    /// radius that is 1.0 unit larger than the previous sphere.
    ///
    /// The output value from this noise module is determined by the distance
    /// between the input value and the the nearest spherical surface.  The
    /// input values that are located on a spherical surface are given the
    /// output value 1.0 and the input values that are equidistant from two
    /// spherical surfaces are given the output value -1.0.
    ///
    /// An application can change the frequency of the concentric spheres.
    /// Increasing the frequency reduces the distances between spheres.  To
    /// specify the frequency, call the SetFrequency() method.
    ///
    /// This noise module, modified with some low-frequency, low-power
    /// turbulence, is useful for generating agate-like textures.
    ///
    /// This noise module does not require any source modules.    
"
Class {
	#name : 'NoSpheres',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoSpheres class >> new [

	^ (self spheres_new) initialize
]

{ #category : 'private' }
NoSpheres class >> spheres_new [
	"/// Constructor.
	 ///
	 /// The default frequency is set to
	 /// noise::module::DEFAULT_SPHERES_FREQUENCY."

	self ffiCall: #(no_noise_module_Spheres* no_noise_module_Spheres_new())
]

{ #category : 'finalizing' }
NoSpheres >> dispose [

	self ffiCall: #(void no_noise_module_Spheres_dispose(no_noise_module_Spheres* self))
]

{ #category : 'public' }
NoSpheres >> getFrequency [
	"/// Returns the frequency of the concentric spheres.
	 ///
	 /// @returns The frequency of the concentric spheres.
	 ///
	 /// Increasing the frequency increases the density of the concentric
	 /// spheres, reducing the distances between them."

	self ffiCall: #(double no_noise_module_Spheres_GetFrequency(no_noise_module_Spheres* self))
]

{ #category : 'public' }
NoSpheres >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Spheres_GetSourceModuleCount(no_noise_module_Spheres* self))
]

{ #category : 'public' }
NoSpheres >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Spheres_GetValue(no_noise_module_Spheres* self, double x, double y, double z))
]

{ #category : 'public' }
NoSpheres >> setFrequency: frequency [
	"/// Sets the frequenct of the concentric spheres.
	 ///
	 /// @param frequency The frequency of the concentric spheres.
	 ///
	 /// Increasing the frequency increases the density of the concentric
	 /// spheres, reducing the distances between them."

	self ffiCall: #(void no_noise_module_Spheres_SetFrequency(no_noise_module_Spheres* self, double frequency))
]
