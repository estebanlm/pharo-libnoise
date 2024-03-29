"
/// Noise module that outputs a checkerboard pattern.
    ///
    /// @image html modulecheckerboard.png
    ///
    /// This noise module outputs unit-sized blocks of alternating values.
    /// The values of these blocks alternate between -1.0 and +1.0.
    ///
    /// This noise module is not really useful by itself, but it is often used
    /// for debugging purposes.
    ///
    /// This noise module does not require any source modules.
"
Class {
	#name : 'NoCheckerboard',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoCheckerboard class >> checkerboard_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Checkerboard* no_noise_module_Checkerboard_new())
]

{ #category : 'instance creation' }
NoCheckerboard class >> new [

	^ (self checkerboard_new) initialize
]

{ #category : 'finalizing' }
NoCheckerboard >> dispose [

	self ffiCall: #(void no_noise_module_Checkerboard_dispose(no_noise_module_Checkerboard* self))
]

{ #category : 'public' }
NoCheckerboard >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Checkerboard_GetSourceModuleCount(no_noise_module_Checkerboard* self))
]

{ #category : 'public' }
NoCheckerboard >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Checkerboard_GetValue(no_noise_module_Checkerboard* self, double x, double y, double z))
]
