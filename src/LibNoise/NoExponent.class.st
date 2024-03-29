"
/// Noise module that maps the output value from a source module onto an
    /// exponential curve.
    ///
    /// @image html moduleexponent.png
    ///
    /// Because most noise modules will output values that range from -1.0 to
    /// +1.0, this noise module first normalizes this output value (the range
    /// becomes 0.0 to 1.0), maps that value onto an exponential curve, then
    /// rescales that value back to the original range.
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoExponent',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoExponent class >> exponent_new [
	"/// Constructor.
	 ///
	 /// The default exponent is set to noise::module::DEFAULT_EXPONENT."

	self ffiCall: #(no_noise_module_Exponent* no_noise_module_Exponent_new())
]

{ #category : 'instance creation' }
NoExponent class >> new [

	^ (self exponent_new) initialize
]

{ #category : 'finalizing' }
NoExponent >> dispose [

	self ffiCall: #(void no_noise_module_Exponent_dispose(no_noise_module_Exponent* self))
]

{ #category : 'public' }
NoExponent >> getExponent [
	"/// Returns the exponent value to apply to the output value from the
	 /// source module.
	 ///
	 /// @returns The exponent value.
	 ///
	 /// Because most noise modules will output values that range from -1.0
	 /// to +1.0, this noise module first normalizes this output value (the
	 /// range becomes 0.0 to 1.0), maps that value onto an exponential
	 /// curve, then rescales that value back to the original range."

	self ffiCall: #(double no_noise_module_Exponent_GetExponent(no_noise_module_Exponent* self))
]

{ #category : 'public' }
NoExponent >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Exponent_GetSourceModuleCount(no_noise_module_Exponent* self))
]

{ #category : 'public' }
NoExponent >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Exponent_GetValue(no_noise_module_Exponent* self, double x, double y, double z))
]

{ #category : 'public' }
NoExponent >> setExponent: exponent [
	"/// Sets the exponent value to apply to the output value from the
	 /// source module.
	 ///
	 /// @param exponent The exponent value.
	 ///
	 /// Because most noise modules will output values that range from -1.0
	 /// to +1.0, this noise module first normalizes this output value (the
	 /// range becomes 0.0 to 1.0), maps that value onto an exponential
	 /// curve, then rescales that value back to the original range."

	self ffiCall: #(void no_noise_module_Exponent_SetExponent(no_noise_module_Exponent* self, double exponent))
]
