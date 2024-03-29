"
/// Noise module that inverts the output value from a source module.
    ///
    /// @image html moduleinvert.png
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoInvert',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoInvert class >> invert_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Invert* no_noise_module_Invert_new())
]

{ #category : 'instance creation' }
NoInvert class >> new [

	^ (self invert_new) initialize
]

{ #category : 'finalizing' }
NoInvert >> dispose [

	self ffiCall: #(void no_noise_module_Invert_dispose(no_noise_module_Invert* self))
]

{ #category : 'public' }
NoInvert >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Invert_GetSourceModuleCount(no_noise_module_Invert* self))
]

{ #category : 'public' }
NoInvert >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Invert_GetValue(no_noise_module_Invert* self, double x, double y, double z))
]
