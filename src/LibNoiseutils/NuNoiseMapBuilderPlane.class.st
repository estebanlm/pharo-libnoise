"
/// Builds a planar noise map.
    ///
    /// This class builds a noise map by filling it with coherent-noise values
    /// generated from the surface of a plane.
    ///
    /// This class describes these input values using (x, z) coordinates.
    /// Their y coordinates are always 0.0.
    ///
    /// The application must provide the lower and upper x coordinate bounds
    /// of the noise map, in units, and the lower and upper z coordinate
    /// bounds of the noise map, in units.
    ///
    /// To make a tileable noise map with no seams at the edges, call the
    /// EnableSeamless() method.
"
Class {
	#name : 'NuNoiseMapBuilderPlane',
	#superclass : 'NuNoiseMapBuilder',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
NuNoiseMapBuilderPlane class >> new [

	^ (self noiseMapBuilderPlane_new) initialize
]

{ #category : 'private' }
NuNoiseMapBuilderPlane class >> noiseMapBuilderPlane_new [
	"/// Constructor."

	self ffiCall: #(nu_noise_utils_NoiseMapBuilderPlane* nu_noise_utils_NoiseMapBuilderPlane_new())
]

{ #category : 'public' }
NuNoiseMapBuilderPlane >> build [

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderPlane_Build(nu_noise_utils_NoiseMapBuilderPlane* self))
]

{ #category : 'finalizing' }
NuNoiseMapBuilderPlane >> dispose [

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderPlane_dispose(nu_noise_utils_NoiseMapBuilderPlane* self))
]

{ #category : 'public' }
NuNoiseMapBuilderPlane >> enableSeamless: enable [
	"/// Enables or disables seamless tiling.
	 ///
	 /// @param enable A flag that enables or disables seamless tiling.
	 ///
	 /// Enabling seamless tiling builds a noise map with no seams at the
	 /// edges.  This allows the noise map to be tileable."

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderPlane_EnableSeamless(nu_noise_utils_NoiseMapBuilderPlane* self, bool enable))
]

{ #category : 'public' }
NuNoiseMapBuilderPlane >> getLowerXBound [
	"/// Returns the lower x boundary of the planar noise map.
	 ///
	 /// @returns The lower x boundary of the planar noise map, in units."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderPlane_GetLowerXBound(nu_noise_utils_NoiseMapBuilderPlane* self))
]

{ #category : 'public' }
NuNoiseMapBuilderPlane >> getLowerZBound [
	"/// Returns the lower z boundary of the planar noise map.
	 ///
	 /// @returns The lower z boundary of the noise map, in units."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderPlane_GetLowerZBound(nu_noise_utils_NoiseMapBuilderPlane* self))
]

{ #category : 'public' }
NuNoiseMapBuilderPlane >> getUpperXBound [
	"/// Returns the upper x boundary of the planar noise map.
	 ///
	 /// @returns The upper x boundary of the noise map, in units."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderPlane_GetUpperXBound(nu_noise_utils_NoiseMapBuilderPlane* self))
]

{ #category : 'public' }
NuNoiseMapBuilderPlane >> getUpperZBound [
	"/// Returns the upper z boundary of the planar noise map.
	 ///
	 /// @returns The upper z boundary of the noise map, in units."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderPlane_GetUpperZBound(nu_noise_utils_NoiseMapBuilderPlane* self))
]

{ #category : 'public' }
NuNoiseMapBuilderPlane >> isSeamlessEnabled [
	"/// Determines if seamless tiling is enabled.
	 ///
	 /// @returns
	 /// - @a true if seamless tiling is enabled.
	 /// - @a false if seamless tiling is disabled.
	 ///
	 /// Enabling seamless tiling builds a noise map with no seams at the
	 /// edges.  This allows the noise map to be tileable."

	self ffiCall: #(bool nu_noise_utils_NoiseMapBuilderPlane_IsSeamlessEnabled(nu_noise_utils_NoiseMapBuilderPlane* self))
]

{ #category : 'public' }
NuNoiseMapBuilderPlane >> setBoundsLowerXBound: lowerXBound upperXBound: upperXBound lowerZBound: lowerZBound upperZBound: upperZBound [
	"/// Sets the boundaries of the planar noise map.
	 ///
	 /// @param lowerXBound The lower x boundary of the noise map, in
	 /// units.
	 /// @param upperXBound The upper x boundary of the noise map, in
	 /// units.
	 /// @param lowerZBound The lower z boundary of the noise map, in
	 /// units.
	 /// @param upperZBound The upper z boundary of the noise map, in
	 /// units.
	 ///
	 /// @pre The lower x boundary is less than the upper x boundary.
	 /// @pre The lower z boundary is less than the upper z boundary.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions."

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderPlane_SetBounds(nu_noise_utils_NoiseMapBuilderPlane* self, double lowerXBound, double upperXBound, double lowerZBound, double upperZBound))
]
