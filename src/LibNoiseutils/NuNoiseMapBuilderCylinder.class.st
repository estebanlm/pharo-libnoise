"
/// Builds a cylindrical noise map.
    ///
    /// This class builds a noise map by filling it with coherent-noise values
    /// generated from the surface of a cylinder.
    ///
    /// This class describes these input values using an (angle, height)
    /// coordinate system.  After generating the coherent-noise value from the
    /// input value, it then ""flattens"" these coordinates onto a plane so that
    /// it can write the values into a two-dimensional noise map.
    ///
    /// The cylinder model has a radius of 1.0 unit and has infinite height.
    /// The cylinder is oriented along the @a y axis.  Its center is at the
    /// origin.
    ///
    /// The x coordinate in the noise map represents the angle around the
    /// cylinder's y axis.  The y coordinate in the noise map represents the
    /// height above the x-z plane.
    ///
    /// The application must provide the lower and upper angle bounds of the
    /// noise map, in degrees, and the lower and upper height bounds of the
    /// noise map, in units.
"
Class {
	#name : 'NuNoiseMapBuilderCylinder',
	#superclass : 'NuNoiseMapBuilder',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
NuNoiseMapBuilderCylinder class >> new [

	^ (self noiseMapBuilderCylinder_new) initialize
]

{ #category : 'private' }
NuNoiseMapBuilderCylinder class >> noiseMapBuilderCylinder_new [
	"/// Constructor."

	self ffiCall: #(nu_noise_utils_NoiseMapBuilderCylinder* nu_noise_utils_NoiseMapBuilderCylinder_new())
]

{ #category : 'public' }
NuNoiseMapBuilderCylinder >> build [

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderCylinder_Build(nu_noise_utils_NoiseMapBuilderCylinder* self))
]

{ #category : 'finalizing' }
NuNoiseMapBuilderCylinder >> dispose [

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderCylinder_dispose(nu_noise_utils_NoiseMapBuilderCylinder* self))
]

{ #category : 'public' }
NuNoiseMapBuilderCylinder >> getLowerAngleBound [
	"/// Returns the lower angle boundary of the cylindrical noise map.
	 ///
	 /// @returns The lower angle boundary of the noise map, in degrees."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderCylinder_GetLowerAngleBound(nu_noise_utils_NoiseMapBuilderCylinder* self))
]

{ #category : 'public' }
NuNoiseMapBuilderCylinder >> getLowerHeightBound [
	"/// Returns the lower height boundary of the cylindrical noise map.
	 ///
	 /// @returns The lower height boundary of the noise map, in units.
	 ///
	 /// One unit is equal to the radius of the cylinder."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderCylinder_GetLowerHeightBound(nu_noise_utils_NoiseMapBuilderCylinder* self))
]

{ #category : 'public' }
NuNoiseMapBuilderCylinder >> getUpperAngleBound [
	"/// Returns the upper angle boundary of the cylindrical noise map.
	 ///
	 /// @returns The upper angle boundary of the noise map, in degrees."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderCylinder_GetUpperAngleBound(nu_noise_utils_NoiseMapBuilderCylinder* self))
]

{ #category : 'public' }
NuNoiseMapBuilderCylinder >> getUpperHeightBound [
	"/// Returns the upper height boundary of the cylindrical noise map.
	 ///
	 /// @returns The upper height boundary of the noise map, in units.
	 ///
	 /// One unit is equal to the radius of the cylinder."

	self ffiCall: #(double nu_noise_utils_NoiseMapBuilderCylinder_GetUpperHeightBound(nu_noise_utils_NoiseMapBuilderCylinder* self))
]

{ #category : 'public' }
NuNoiseMapBuilderCylinder >> setBoundsLowerAngleBound: lowerAngleBound upperAngleBound: upperAngleBound lowerHeightBound: lowerHeightBound upperHeightBound: upperHeightBound [
	"/// Sets the coordinate boundaries of the noise map.
	 ///
	 /// @param lowerAngleBound The lower angle boundary of the noise map,
	 /// in degrees.
	 /// @param upperAngleBound The upper angle boundary of the noise map,
	 /// in degrees.
	 /// @param lowerHeightBound The lower height boundary of the noise
	 /// map, in units.
	 /// @param upperHeightBound The upper height boundary of the noise
	 /// map, in units.
	 ///
	 /// @pre The lower angle boundary is less than the upper angle
	 /// boundary.
	 /// @pre The lower height boundary is less than the upper height
	 /// boundary.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions.
	 ///
	 /// One unit is equal to the radius of the cylinder."

	self ffiCall: #(void nu_noise_utils_NoiseMapBuilderCylinder_SetBounds(nu_noise_utils_NoiseMapBuilderCylinder* self, double lowerAngleBound, double upperAngleBound, double lowerHeightBound, double upperHeightBound))
]
