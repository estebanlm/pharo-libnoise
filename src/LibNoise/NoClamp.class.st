"
/// Noise module that clamps the output value from a source module to a
    /// range of values.
    ///
    /// @image html moduleclamp.png
    ///
    /// The range of values in which to clamp the output value is called the
    /// <i>clamping range</i>.
    ///
    /// If the output value from the source module is less than the lower
    /// bound of the clamping range, this noise module clamps that value to
    /// the lower bound.  If the output value from the source module is
    /// greater than the upper bound of the clamping range, this noise module
    /// clamps that value to the upper bound.
    ///
    /// To specify the upper and lower bounds of the clamping range, call the
    /// SetBounds() method.
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoClamp',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoClamp class >> clamp_new [
	"/// Constructor.
	 ///
	 /// The default lower bound of the clamping range is set to
	 /// noise::module::DEFAULT_CLAMP_LOWER_BOUND.
	 ///
	 /// The default upper bound of the clamping range is set to
	 /// noise::module::DEFAULT_CLAMP_UPPER_BOUND."

	self ffiCall: #(no_noise_module_Clamp* no_noise_module_Clamp_new())
]

{ #category : 'instance creation' }
NoClamp class >> new [

	^ (self clamp_new) initialize
]

{ #category : 'finalizing' }
NoClamp >> dispose [

	self ffiCall: #(void no_noise_module_Clamp_dispose(no_noise_module_Clamp* self))
]

{ #category : 'public' }
NoClamp >> getLowerBound [
	"/// Returns the lower bound of the clamping range.
	 ///
	 /// @returns The lower bound.
	 ///
	 /// If the output value from the source module is less than the lower
	 /// bound of the clamping range, this noise module clamps that value
	 /// to the lower bound."

	self ffiCall: #(double no_noise_module_Clamp_GetLowerBound(no_noise_module_Clamp* self))
]

{ #category : 'public' }
NoClamp >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Clamp_GetSourceModuleCount(no_noise_module_Clamp* self))
]

{ #category : 'public' }
NoClamp >> getUpperBound [
	"/// Returns the upper bound of the clamping range.
	 ///
	 /// @returns The upper bound.
	 ///
	 /// If the output value from the source module is greater than the
	 /// upper bound of the clamping range, this noise module clamps that
	 /// value to the upper bound."

	self ffiCall: #(double no_noise_module_Clamp_GetUpperBound(no_noise_module_Clamp* self))
]

{ #category : 'public' }
NoClamp >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Clamp_GetValue(no_noise_module_Clamp* self, double x, double y, double z))
]

{ #category : 'public' }
NoClamp >> setBoundsLowerBound: lowerBound upperBound: upperBound [
	"/// Sets the lower and upper bounds of the clamping range.
	 ///
	 /// @param lowerBound The lower bound.
	 /// @param upperBound The upper bound.
	 ///
	 /// @pre The lower bound must be less than or equal to the
	 /// upper bound.
	 ///
	 /// @throw noise::ExceptionInvalidParam An invalid parameter was
	 /// specified; see the preconditions for more information.
	 ///
	 /// If the output value from the source module is less than the lower
	 /// bound of the clamping range, this noise module clamps that value
	 /// to the lower bound.  If the output value from the source module
	 /// is greater than the upper bound of the clamping range, this noise
	 /// module clamps that value to the upper bound."

	self ffiCall: #(void no_noise_module_Clamp_SetBounds(no_noise_module_Clamp* self, double lowerBound, double upperBound))
]
