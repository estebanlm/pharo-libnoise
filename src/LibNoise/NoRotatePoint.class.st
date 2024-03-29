"
/// Noise module that rotates the input value around the origin before
    /// returning the output value from a source module.
    ///
    /// @image html modulerotatepoint.png
    ///
    /// The GetValue() method rotates the coordinates of the input value
    /// around the origin before returning the output value from the source
    /// module.  To set the rotation angles, call the SetAngles() method.  To
    /// set the rotation angle around the individual @a x, @a y, or @a z axes,
    /// call the SetXAngle(), SetYAngle() or SetZAngle() methods,
    /// respectively.
    ///
    /// The coordinate system of the input value is assumed to be
    /// ""left-handed"" (@a x increases to the right, @a y increases upward,
    /// and @a z increases inward.)
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoRotatePoint',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoRotatePoint class >> new [

	^ (self rotatePoint_new) initialize
]

{ #category : 'private' }
NoRotatePoint class >> rotatePoint_new [
	"/// Constructor.
	 ///
	 /// The default rotation angle around the @a x axis, in degrees, is
	 /// set to noise::module::DEFAULT_ROTATE_X.
	 ///
	 /// The default rotation angle around the @a y axis, in degrees, is
	 /// set to noise::module::DEFAULT_ROTATE_Y.
	 ///
	 /// The default rotation angle around the @a z axis, in degrees, is
	 /// set to noise::module::DEFAULT_ROTATE_Z."

	self ffiCall: #(no_noise_module_RotatePoint* no_noise_module_RotatePoint_new())
]

{ #category : 'finalizing' }
NoRotatePoint >> dispose [

	self ffiCall: #(void no_noise_module_RotatePoint_dispose(no_noise_module_RotatePoint* self))
]

{ #category : 'public' }
NoRotatePoint >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_RotatePoint_GetSourceModuleCount(no_noise_module_RotatePoint* self))
]

{ #category : 'public' }
NoRotatePoint >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_RotatePoint_GetValue(no_noise_module_RotatePoint* self, double x, double y, double z))
]

{ #category : 'public' }
NoRotatePoint >> getXAngle [
	"/// Returns the rotation angle around the @a x axis to apply to the
	 /// input value.
	 ///
	 /// @returns The rotation angle around the @a x axis, in degrees."

	self ffiCall: #(double no_noise_module_RotatePoint_GetXAngle(no_noise_module_RotatePoint* self))
]

{ #category : 'public' }
NoRotatePoint >> getYAngle [
	"/// Returns the rotation angle around the @a y axis to apply to the
	 /// input value.
	 ///
	 /// @returns The rotation angle around the @a y axis, in degrees."

	self ffiCall: #(double no_noise_module_RotatePoint_GetYAngle(no_noise_module_RotatePoint* self))
]

{ #category : 'public' }
NoRotatePoint >> getZAngle [
	"/// Returns the rotation angle around the @a z axis to apply to the
	 /// input value.
	 ///
	 /// @returns The rotation angle around the @a z axis, in degrees."

	self ffiCall: #(double no_noise_module_RotatePoint_GetZAngle(no_noise_module_RotatePoint* self))
]

{ #category : 'public' }
NoRotatePoint >> setAnglesXAngle: xAngle yAngle: yAngle zAngle: zAngle [
	"/// Sets the rotation angles around all three axes to apply to the
	 /// input value.
	 ///
	 /// @param xAngle The rotation angle around the @a x axis, in degrees.
	 /// @param yAngle The rotation angle around the @a y axis, in degrees.
	 /// @param zAngle The rotation angle around the @a z axis, in degrees.
	 ///
	 /// The GetValue() method rotates the coordinates of the input value
	 /// around the origin before returning the output value from the
	 /// source module."

	self ffiCall: #(void no_noise_module_RotatePoint_SetAngles(no_noise_module_RotatePoint* self, double xAngle, double yAngle, double zAngle))
]

{ #category : 'public' }
NoRotatePoint >> setXAngle: xAngle [
	"/// Sets the rotation angle around the @a x axis to apply to the input
	 /// value.
	 ///
	 /// @param xAngle The rotation angle around the @a x axis, in degrees.
	 ///
	 /// The GetValue() method rotates the coordinates of the input value
	 /// around the origin before returning the output value from the
	 /// source module."

	self ffiCall: #(void no_noise_module_RotatePoint_SetXAngle(no_noise_module_RotatePoint* self, double xAngle))
]

{ #category : 'public' }
NoRotatePoint >> setYAngle: yAngle [
	"/// Sets the rotation angle around the @a y axis to apply to the input
	 /// value.
	 ///
	 /// @param yAngle The rotation angle around the @a y axis, in degrees.
	 ///
	 /// The GetValue() method rotates the coordinates of the input value
	 /// around the origin before returning the output value from the
	 /// source module."

	self ffiCall: #(void no_noise_module_RotatePoint_SetYAngle(no_noise_module_RotatePoint* self, double yAngle))
]

{ #category : 'public' }
NoRotatePoint >> setZAngle: zAngle [
	"/// Sets the rotation angle around the @a z axis to apply to the input
	 /// value.
	 ///
	 /// @param zAngle The rotation angle around the @a z axis, in degrees.
	 ///
	 /// The GetValue() method rotates the coordinates of the input value
	 /// around the origin before returning the output value from the
	 /// source module."

	self ffiCall: #(void no_noise_module_RotatePoint_SetZAngle(no_noise_module_RotatePoint* self, double zAngle))
]
