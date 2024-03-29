"
/// Noise module that outputs a constant value.
    ///
    /// @image html moduleconst.png
    ///
    /// To specify the constant value, call the SetConstValue() method.
    ///
    /// This noise module is not useful by itself, but it is often used as a
    /// source module for other noise modules.
    ///
    /// This noise module does not require any source modules.
"
Class {
	#name : 'NoConst',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoConst class >> const_new [
	"/// Constructor.
	 ///
	 /// The default constant value is set to
	 /// noise::module::DEFAULT_CONST_VALUE."

	self ffiCall: #(no_noise_module_Const* no_noise_module_Const_new())
]

{ #category : 'instance creation' }
NoConst class >> new [

	^ (self const_new) initialize
]

{ #category : 'finalizing' }
NoConst >> dispose [

	self ffiCall: #(void no_noise_module_Const_dispose(no_noise_module_Const* self))
]

{ #category : 'public' }
NoConst >> getConstValue [
	"/// Returns the constant output value for this noise module.
	 ///
	 /// @returns The constant output value for this noise module."

	self ffiCall: #(double no_noise_module_Const_GetConstValue(no_noise_module_Const* self))
]

{ #category : 'public' }
NoConst >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Const_GetSourceModuleCount(no_noise_module_Const* self))
]

{ #category : 'public' }
NoConst >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Const_GetValue(no_noise_module_Const* self, double x, double y, double z))
]

{ #category : 'public' }
NoConst >> setConstValue: constValue [
	"/// Sets the constant output value for this noise module.
	 ///
	 /// @param constValue The constant output value for this noise module."

	self ffiCall: #(void no_noise_module_Const_SetConstValue(no_noise_module_Const* self, double constValue))
]
