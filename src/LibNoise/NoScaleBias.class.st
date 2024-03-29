"
/// Noise module that applies a scaling factor and a bias to the output
    /// value from a source module.
    ///
    /// @image html modulescalebias.png
    ///
    /// The GetValue() method retrieves the output value from the source
    /// module, multiplies it with a scaling factor, adds a bias to it, then
    /// outputs the value.
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoScaleBias',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoScaleBias class >> new [

	^ (self scaleBias_new) initialize
]

{ #category : 'private' }
NoScaleBias class >> scaleBias_new [
	"/// Constructor.
	 ///
	 /// The default bias is set to noise::module::DEFAULT_BIAS.
	 ///
	 /// The default scaling factor is set to noise::module::DEFAULT_SCALE."

	self ffiCall: #(no_noise_module_ScaleBias* no_noise_module_ScaleBias_new())
]

{ #category : 'finalizing' }
NoScaleBias >> dispose [

	self ffiCall: #(void no_noise_module_ScaleBias_dispose(no_noise_module_ScaleBias* self))
]

{ #category : 'public' }
NoScaleBias >> getBias [
	"/// Returns the bias to apply to the scaled output value from the
	 /// source module.
	 ///
	 /// @returns The bias to apply.
	 ///
	 /// The GetValue() method retrieves the output value from the source
	 /// module, multiplies it with the scaling factor, adds the bias to
	 /// it, then outputs the value."

	self ffiCall: #(double no_noise_module_ScaleBias_GetBias(no_noise_module_ScaleBias* self))
]

{ #category : 'public' }
NoScaleBias >> getScale [
	"/// Returns the scaling factor to apply to the output value from the
	 /// source module.
	 ///
	 /// @returns The scaling factor to apply.
	 ///
	 /// The GetValue() method retrieves the output value from the source
	 /// module, multiplies it with the scaling factor, adds the bias to
	 /// it, then outputs the value."

	self ffiCall: #(double no_noise_module_ScaleBias_GetScale(no_noise_module_ScaleBias* self))
]

{ #category : 'public' }
NoScaleBias >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_ScaleBias_GetSourceModuleCount(no_noise_module_ScaleBias* self))
]

{ #category : 'public' }
NoScaleBias >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_ScaleBias_GetValue(no_noise_module_ScaleBias* self, double x, double y, double z))
]

{ #category : 'public' }
NoScaleBias >> setBias: bias [
	"/// Sets the bias to apply to the scaled output value from the source
	 /// module.
	 ///
	 /// @param bias The bias to apply.
	 ///
	 /// The GetValue() method retrieves the output value from the source
	 /// module, multiplies it with the scaling factor, adds the bias to
	 /// it, then outputs the value."

	self ffiCall: #(void no_noise_module_ScaleBias_SetBias(no_noise_module_ScaleBias* self, double bias))
]

{ #category : 'public' }
NoScaleBias >> setScale: scale [
	"/// Sets the scaling factor to apply to the output value from the
	 /// source module.
	 ///
	 /// @param scale The scaling factor to apply.
	 ///
	 /// The GetValue() method retrieves the output value from the source
	 /// module, multiplies it with the scaling factor, adds the bias to
	 /// it, then outputs the value."

	self ffiCall: #(void no_noise_module_ScaleBias_SetScale(no_noise_module_ScaleBias* self, double scale))
]
