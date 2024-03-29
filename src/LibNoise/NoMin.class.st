"
/// Noise module that outputs the smaller of the two output values from
    /// two source modules.
    ///
    /// @image html modulemin.png
    ///
    /// This noise module requires two source modules.
"
Class {
	#name : 'NoMin',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoMin class >> min_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Min* no_noise_module_Min_new())
]

{ #category : 'instance creation' }
NoMin class >> new [

	^ (self min_new) initialize
]

{ #category : 'finalizing' }
NoMin >> dispose [

	self ffiCall: #(void no_noise_module_Min_dispose(no_noise_module_Min* self))
]

{ #category : 'public' }
NoMin >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Min_GetSourceModuleCount(no_noise_module_Min* self))
]

{ #category : 'public' }
NoMin >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Min_GetValue(no_noise_module_Min* self, double x, double y, double z))
]
