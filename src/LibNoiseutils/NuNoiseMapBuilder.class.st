"
/// Abstract base class for a noise-map builder
    ///
    /// A builder class builds a noise map by filling it with coherent-noise
    /// values generated from the surface of a three-dimensional mathematical
    /// object.  Each builder class defines a specific three-dimensional
    /// surface, such as a cylinder, sphere, or plane.
    ///
    /// A builder class describes these input values using a coordinate system
    /// applicable for the mathematical object (e.g., a latitude/longitude
    /// coordinate system for the spherical noise-map builder.)  It then
    /// ""flattens"" these coordinates onto a plane so that it can write the
    /// coherent-noise values into a two-dimensional noise map.
    ///
    /// <b>Building the Noise Map</b>
    ///
    /// To build the noise map, perform the following steps:
    /// - Pass the bounding coordinates to the SetBounds() method.
    /// - Pass the noise map size, in points, to the SetDestSize() method.
    /// - Pass a NoiseMap object to the SetDestNoiseMap() method.
    /// - Pass a noise module (derived from noise::module::Module) to the
    ///   SetSourceModule() method.
    /// - Call the Build() method.
    ///
    /// You may also pass a callback function to the SetCallback() method.
    /// The Build() method calls this callback function each time it fills a
    /// row of the noise map with coherent-noise values.  This callback
    /// function has a single integer parameter that contains a count of the
    /// rows that have been completed.  It returns void.
    ///
    /// Note that SetBounds() is not defined in the abstract base class; it is
    /// only defined in the derived classes.  This is because each model uses
    /// a different coordinate system.
"
Class {
	#name : 'NuNoiseMapBuilder',
	#superclass : 'NuBaseObject',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'public' }
NuNoiseMapBuilder >> build [
	"/// Builds the noise map.
	 ///
	 /// @pre SetBounds() was previously called.
	 /// @pre SetDestNoiseMap() was previously called.
	 /// @pre SetSourceModule() was previously called.
	 /// @pre The width and height values specified by SetDestSize() are
	 /// positive.
	 /// @pre The width and height values specified by SetDestSize() do not
	 /// exceed the maximum possible width and height for the noise map.
	 ///
	 /// @post The original contents of the destination noise map is
	 /// destroyed.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions.
	 /// @throw noise::ExceptionOutOfMemory Out of memory.
	 ///
	 /// If this method is successful, the destination noise map contains
	 /// the coherent-noise values from the noise module specified by
	 /// SetSourceModule()."

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilder_Build(nu_noise_utils_NoiseMapBuilder* self))
]

{ #category : 'public' }
NuNoiseMapBuilder >> getDestHeight [
	"/// Returns the height of the destination noise map.
	 ///
	 /// @returns The height of the destination noise map, in points.
	 ///
	 /// This object does not change the height in the destination noise
	 /// map object until the Build() method is called."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilder_GetDestHeight(nu_noise_utils_NoiseMapBuilder* self))
]

{ #category : 'public' }
NuNoiseMapBuilder >> getDestWidth [
	"/// Returns the width of the destination noise map.
	 ///
	 /// @returns The width of the destination noise map, in points.
	 ///
	 /// This object does not change the height in the destination noise
	 /// map object until the Build() method is called."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilder_GetDestWidth(nu_noise_utils_NoiseMapBuilder* self))
]

{ #category : 'public' }
NuNoiseMapBuilder >> setCallback: pCallback [
	"/// Sets the callback function that Build() calls each time it fills a
	 /// row of the noise map with coherent-noise values.
	 ///
	 /// @param pCallback The callback function.
	 ///
	 /// This callback function has a single integer parameter that
	 /// contains a count of the rows that have been completed.  It returns
	 /// void.  Pass a function with this signature to the SetCallback()
	 /// method."

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilder_SetCallback(nu_noise_utils_NoiseMapBuilder* self, nu_noise_utils_NoiseMapCallback pCallback))
]

{ #category : 'public' }
NuNoiseMapBuilder >> setDestNoiseMap: destNoiseMap [
	"/// Sets the destination noise map.
	 ///
	 /// @param destNoiseMap The destination noise map.
	 ///
	 /// The destination noise map will contain the coherent-noise values
	 /// from this noise map after a successful call to the Build() method.
	 ///
	 /// The destination noise map must exist throughout the lifetime of
	 /// this object unless another noise map replaces that noise map."

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilder_SetDestNoiseMap(nu_noise_utils_NoiseMapBuilder* self, nu_noise_utils_NoiseMap* destNoiseMap))
]

{ #category : 'public' }
NuNoiseMapBuilder >> setDestSizeDestWidth: destWidth destHeight: destHeight [
	"/// Sets the size of the destination noise map.
	 ///
	 /// @param destWidth The width of the destination noise map, in
	 /// points.
	 /// @param destHeight The height of the destination noise map, in
	 /// points.
	 ///
	 /// This method does not change the size of the destination noise map
	 /// until the Build() method is called."

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilder_SetDestSize(nu_noise_utils_NoiseMapBuilder* self, int destWidth, int destHeight))
]

{ #category : 'public' }
NuNoiseMapBuilder >> setSourceModule: sourceModule [
	"/// Sets the source module.
	 ///
	 /// @param sourceModule The source module.
	 ///
	 /// This object fills in a noise map with the coherent-noise values
	 /// from this source module.
	 ///
	 /// The source module must exist throughout the lifetime of this
	 /// object unless another noise module replaces that noise module."

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilder_SetSourceModule(nu_noise_utils_NoiseMapBuilder* self, no_noise_module_Module* sourceModule))
]
