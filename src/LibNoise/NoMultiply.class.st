"
/// Noise module that outputs the product of the two output values from
    /// two source modules.
    ///
    /// @image html modulemultiply.png
    ///
    /// This noise module requires two source modules.
"
Class {
	#name : 'NoMultiply',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoMultiply class >> multiply_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Multiply* no_noise_module_Multiply_new())
]

{ #category : 'instance creation' }
NoMultiply class >> new [

	^ (self multiply_new) initialize
]

{ #category : 'finalizing' }
NoMultiply >> dispose [

	self ffiCall: #(void no_noise_module_Multiply_dispose(no_noise_module_Multiply* self))
]

{ #category : 'public' }
NoMultiply >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Multiply_GetSourceModuleCount(no_noise_module_Multiply* self))
]

{ #category : 'public' }
NoMultiply >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Multiply_GetValue(no_noise_module_Multiply* self, double x, double y, double z))
]
