"
/// Noise module that outputs the sum of the two output values from two
    /// source modules.
    ///
    /// @image html moduleadd.png
    ///
    /// This noise module requires two source modules.
"
Class {
	#name : 'NoAdd',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoAdd class >> add_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Add* no_noise_module_Add_new())
]

{ #category : 'instance creation' }
NoAdd class >> new [

	^ (self add_new) initialize
]

{ #category : 'finalizing' }
NoAdd >> dispose [

	self ffiCall: #(void no_noise_module_Add_dispose(no_noise_module_Add* self))
]

{ #category : 'public' }
NoAdd >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Add_GetSourceModuleCount(no_noise_module_Add* self))
]

{ #category : 'public' }
NoAdd >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Add_GetValue(no_noise_module_Add* self, double x, double y, double z))
]
