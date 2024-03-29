"
/// Noise module that outputs the larger of the two output values from two
    /// source modules.
    ///
    /// @image html modulemax.png
    ///
    /// This noise module requires two source modules.
"
Class {
	#name : 'NoMax',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoMax class >> max_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Max* no_noise_module_Max_new())
]

{ #category : 'instance creation' }
NoMax class >> new [

	^ (self max_new) initialize
]

{ #category : 'finalizing' }
NoMax >> dispose [

	self ffiCall: #(void no_noise_module_Max_dispose(no_noise_module_Max* self))
]

{ #category : 'public' }
NoMax >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Max_GetSourceModuleCount(no_noise_module_Max* self))
]

{ #category : 'public' }
NoMax >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Max_GetValue(no_noise_module_Max* self, double x, double y, double z))
]
