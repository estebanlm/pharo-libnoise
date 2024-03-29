"
/// Noise module that raises the output value from a first source module
    /// to the power of the output value from a second source module.
    ///
    /// @image html modulepower.png
    ///
    /// The first source module must have an index value of 0.
    ///
    /// The second source module must have an index value of 1.
    ///
    /// This noise module requires two source modules.
"
Class {
	#name : 'NoPower',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoPower class >> new [

	^ (self power_new) initialize
]

{ #category : 'private' }
NoPower class >> power_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Power* no_noise_module_Power_new())
]

{ #category : 'finalizing' }
NoPower >> dispose [

	self ffiCall: #(void no_noise_module_Power_dispose(no_noise_module_Power* self))
]

{ #category : 'public' }
NoPower >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Power_GetSourceModuleCount(no_noise_module_Power* self))
]

{ #category : 'public' }
NoPower >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Power_GetValue(no_noise_module_Power* self, double x, double y, double z))
]
