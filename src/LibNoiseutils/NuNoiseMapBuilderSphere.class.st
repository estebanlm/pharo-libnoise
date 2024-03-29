"
/// Builds a spherical noise map.
    ///
    /// This class builds a noise map by filling it with coherent-noise values
    /// generated from the surface of a sphere.
    ///
    /// This class describes these input values using a (latitude, longitude)
    /// coordinate system.  After generating the coherent-noise value from the
    /// input value, it then ""flattens"" these coordinates onto a plane so that
    /// it can write the values into a two-dimensional noise map.
    ///
    /// The sphere model has a radius of 1.0 unit.  Its center is at the
    /// origin.
    ///
    /// The x coordinate in the noise map represents the longitude.  The y
    /// coordinate in the noise map represents the latitude.  
    ///
    /// The application must provide the southern, northern, western, and
    /// eastern bounds of the noise map, in degrees.
"
Class {
	#name : 'NuNoiseMapBuilderSphere',
	#superclass : 'NuNoiseMapBuilder',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
NuNoiseMapBuilderSphere class >> new [

	^ (self noiseMapBuilderSphere_new) initialize
]

{ #category : 'private' }
NuNoiseMapBuilderSphere class >> noiseMapBuilderSphere_new [
	"/// Constructor."

	self ffiCall: #(nu_noise_utils_NoiseMapBuilderSphere* nu_noise_utils_NoiseMapBuilderSphere_new())
]

{ #category : 'public' }
NuNoiseMapBuilderSphere >> build [

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderSphere_Build(nu_noise_utils_NoiseMapBuilderSphere* self))
]

{ #category : 'finalizing' }
NuNoiseMapBuilderSphere >> dispose [

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderSphere_dispose(nu_noise_utils_NoiseMapBuilderSphere* self))
]

{ #category : 'public' }
NuNoiseMapBuilderSphere >> getEastLonBound [
	"/// Returns the eastern boundary of the spherical noise map.
	 ///
	 /// @returns The eastern boundary of the noise map, in degrees."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderSphere_GetEastLonBound(nu_noise_utils_NoiseMapBuilderSphere* self))
]

{ #category : 'public' }
NuNoiseMapBuilderSphere >> getNorthLatBound [
	"/// Returns the northern boundary of the spherical noise map
	 ///
	 /// @returns The northern boundary of the noise map, in degrees."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderSphere_GetNorthLatBound(nu_noise_utils_NoiseMapBuilderSphere* self))
]

{ #category : 'public' }
NuNoiseMapBuilderSphere >> getSouthLatBound [
	"/// Returns the southern boundary of the spherical noise map
	 ///
	 /// @returns The southern boundary of the noise map, in degrees."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderSphere_GetSouthLatBound(nu_noise_utils_NoiseMapBuilderSphere* self))
]

{ #category : 'public' }
NuNoiseMapBuilderSphere >> getWestLonBound [
	"/// Returns the western boundary of the spherical noise map
	 ///
	 /// @returns The western boundary of the noise map, in degrees."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderSphere_GetWestLonBound(nu_noise_utils_NoiseMapBuilderSphere* self))
]

{ #category : 'public' }
NuNoiseMapBuilderSphere >> setBoundsSouthLatBound: southLatBound northLatBound: northLatBound westLonBound: westLonBound eastLonBound: eastLonBound [
	"/// Sets the coordinate boundaries of the noise map.
	 ///
	 /// @param southLatBound The southern boundary of the noise map, in
	 /// degrees.
	 /// @param northLatBound The northern boundary of the noise map, in
	 /// degrees.
	 /// @param westLonBound The western boundary of the noise map, in
	 /// degrees.
	 /// @param eastLonBound The eastern boundary of the noise map, in
	 /// degrees.
	 ///
	 /// @pre The southern boundary is less than the northern boundary.
	 /// @pre The western boundary is less than the eastern boundary.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions."

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderSphere_SetBounds(nu_noise_utils_NoiseMapBuilderSphere* self, double southLatBound, double northLatBound, double westLonBound, double eastLonBound))
]
