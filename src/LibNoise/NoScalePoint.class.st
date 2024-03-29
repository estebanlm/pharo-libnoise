"
/// Noise module that scales the coordinates of the input value before
    /// returning the output value from a source module.
    ///
    /// @image html modulescalepoint.png
    ///
    /// The GetValue() method multiplies the ( @a x, @a y, @a z ) coordinates
    /// of the input value with a scaling factor before returning the output
    /// value from the source module.  To set the scaling factor, call the
    /// SetScale() method.  To set the scaling factor to apply to the
    /// individual @a x, @a y, or @a z coordinates, call the SetXScale(),
    /// SetYScale() or SetZScale() methods, respectively.
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoScalePoint',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoScalePoint class >> new [

	^ (self scalePoint_new) initialize
]

{ #category : 'private' }
NoScalePoint class >> scalePoint_new [
	"/// Constructor.
	 ///
	 /// The default scaling factor applied to the @a x coordinate is set
	 /// to noise::module::DEFAULT_SCALE_POINT_X.
	 ///
	 /// The default scaling factor applied to the @a y coordinate is set
	 /// to noise::module::DEFAULT_SCALE_POINT_Y.
	 ///
	 /// The default scaling factor applied to the @a z coordinate is set
	 /// to noise::module::DEFAULT_SCALE_POINT_Z."

	self ffiCall: #(no_noise_module_ScalePoint* no_noise_module_ScalePoint_new())
]

{ #category : 'finalizing' }
NoScalePoint >> dispose [

	self ffiCall: #(void no_noise_module_ScalePoint_dispose(no_noise_module_ScalePoint* self))
]

{ #category : 'public' }
NoScalePoint >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_ScalePoint_GetSourceModuleCount(no_noise_module_ScalePoint* self))
]

{ #category : 'public' }
NoScalePoint >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_ScalePoint_GetValue(no_noise_module_ScalePoint* self, double x, double y, double z))
]

{ #category : 'public' }
NoScalePoint >> getXScale [
	"/// Returns the scaling factor applied to the @a x coordinate of the
	 /// input value.
	 ///
	 /// @returns The scaling factor applied to the @a x coordinate."

	self ffiCall: #(double no_noise_module_ScalePoint_GetXScale(no_noise_module_ScalePoint* self))
]

{ #category : 'public' }
NoScalePoint >> getYScale [
	"/// Returns the scaling factor applied to the @a y coordinate of the
	 /// input value.
	 ///
	 /// @returns The scaling factor applied to the @a y coordinate."

	self ffiCall: #(double no_noise_module_ScalePoint_GetYScale(no_noise_module_ScalePoint* self))
]

{ #category : 'public' }
NoScalePoint >> getZScale [
	"/// Returns the scaling factor applied to the @a z coordinate of the
	 /// input value.
	 ///
	 /// @returns The scaling factor applied to the @a z coordinate."

	self ffiCall: #(double no_noise_module_ScalePoint_GetZScale(no_noise_module_ScalePoint* self))
]

{ #category : 'public' }
NoScalePoint >> setScale: scale [
	"/// Sets the scaling factor to apply to the input value.
	 ///
	 /// @param scale The scaling factor to apply.
	 ///
	 /// The GetValue() method multiplies the ( @a x, @a y, @a z )
	 /// coordinates of the input value with a scaling factor before
	 /// returning the output value from the source module."

	self ffiCall: #(void no_noise_module_ScalePoint_SetScale_1(no_noise_module_ScalePoint* self, double scale))
]

{ #category : 'public' }
NoScalePoint >> setScaleXScale: xScale yScale: yScale zScale: zScale [
	"/// Sets the scaling factor to apply to the ( @a x, @a y, @a z )
	 /// coordinates of the input value.
	 ///
	 /// @param xScale The scaling factor to apply to the @a x coordinate.
	 /// @param yScale The scaling factor to apply to the @a y coordinate.
	 /// @param zScale The scaling factor to apply to the @a z coordinate.
	 ///
	 /// The GetValue() method multiplies the ( @a x, @a y, @a z )
	 /// coordinates of the input value with a scaling factor before
	 /// returning the output value from the source module."

	self ffiCall: #(void no_noise_module_ScalePoint_SetScale_2(no_noise_module_ScalePoint* self, double xScale, double yScale, double zScale))
]

{ #category : 'public' }
NoScalePoint >> setXScale: xScale [
	"/// Sets the scaling factor to apply to the @a x coordinate of the
	 /// input value.
	 ///
	 /// @param xScale The scaling factor to apply to the @a x coordinate.
	 ///
	 /// The GetValue() method multiplies the ( @a x, @a y, @a z )
	 /// coordinates of the input value with a scaling factor before
	 /// returning the output value from the source module."

	self ffiCall: #(void no_noise_module_ScalePoint_SetXScale(no_noise_module_ScalePoint* self, double xScale))
]

{ #category : 'public' }
NoScalePoint >> setYScale: yScale [
	"/// Sets the scaling factor to apply to the @a y coordinate of the
	 /// input value.
	 ///
	 /// @param yScale The scaling factor to apply to the @a y coordinate.
	 ///
	 /// The GetValue() method multiplies the ( @a x, @a y, @a z )
	 /// coordinates of the input value with a scaling factor before
	 /// returning the output value from the source module."

	self ffiCall: #(void no_noise_module_ScalePoint_SetYScale(no_noise_module_ScalePoint* self, double yScale))
]

{ #category : 'public' }
NoScalePoint >> setZScale: zScale [
	"/// Sets the scaling factor to apply to the @a z coordinate of the
	 /// input value.
	 ///
	 /// @param zScale The scaling factor to apply to the @a z coordinate.
	 ///
	 /// The GetValue() method multiplies the ( @a x, @a y, @a z )
	 /// coordinates of the input value with a scaling factor before
	 /// returning the output value from the source module."

	self ffiCall: #(void no_noise_module_ScalePoint_SetZScale(no_noise_module_ScalePoint* self, double zScale))
]
