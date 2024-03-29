"
/// Noise module that outputs the absolute value of the output value from
    /// a source module.
    ///
    /// @image html moduleabs.png
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoAbs',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoAbs class >> abs_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Abs* no_noise_module_Abs_new())
]

{ #category : 'instance creation' }
NoAbs class >> new [

	^ (self abs_new) initialize
]

{ #category : 'finalizing' }
NoAbs >> dispose [

	self ffiCall: #(void no_noise_module_Abs_dispose(no_noise_module_Abs* self))
]

{ #category : 'public' }
NoAbs >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Abs_GetSourceModuleCount(no_noise_module_Abs* self))
]

{ #category : 'public' }
NoAbs >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Abs_GetValue(no_noise_module_Abs* self, double x, double y, double z))
]
