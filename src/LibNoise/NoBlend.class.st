"
/// Noise module that outputs a weighted blend of the output values from
    /// two source modules given the output value supplied by a control module.
    ///
    /// @image html moduleblend.png
    ///
    /// Unlike most other noise modules, the index value assigned to a source
    /// module determines its role in the blending operation:
    /// - Source module 0 (upper left in the diagram) outputs one of the
    ///   values to blend.
    /// - Source module 1 (lower left in the diagram) outputs one of the
    ///   values to blend.
    /// - Source module 2 (bottom of the diagram) is known as the <i>control
    ///   module</i>.  The control module determines the weight of the
    ///   blending operation.  Negative values weigh the blend towards the
    ///   output value from the source module with an index value of 0.
    ///   Positive values weigh the blend towards the output value from the
    ///   source module with an index value of 1.
    ///
    /// An application can pass the control module to the SetControlModule()
    /// method instead of the SetSourceModule() method.  This may make the
    /// application code easier to read.
    ///
    /// This noise module uses linear interpolation to perform the blending
    /// operation.
    ///
    /// This noise module requires three source modules.
"
Class {
	#name : 'NoBlend',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoBlend class >> blend_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Blend* no_noise_module_Blend_new())
]

{ #category : 'instance creation' }
NoBlend class >> new [

	^ (self blend_new) initialize
]

{ #category : 'finalizing' }
NoBlend >> dispose [

	self ffiCall: #(void no_noise_module_Blend_dispose(no_noise_module_Blend* self))
]

{ #category : 'public' }
NoBlend >> getControlModule [
	"/// Returns the control module.
	 ///
	 /// @returns A reference to the control module.
	 ///
	 /// @pre A control module has been added to this noise module via a
	 /// call to SetSourceModule() or SetControlModule().
	 ///
	 /// @throw noise::ExceptionNoModule See the preconditions for more
	 /// information.
	 ///
	 /// The control module determines the weight of the blending
	 /// operation.  Negative values weigh the blend towards the output
	 /// value from the source module with an index value of 0.  Positive
	 /// values weigh the blend towards the output value from the source
	 /// module with an index value of 1."

	self ffiCall: #(no_noise_module_Module* no_noise_module_Blend_GetControlModule(no_noise_module_Blend* self))
]

{ #category : 'public' }
NoBlend >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Blend_GetSourceModuleCount(no_noise_module_Blend* self))
]

{ #category : 'public' }
NoBlend >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Blend_GetValue(no_noise_module_Blend* self, double x, double y, double z))
]

{ #category : 'public' }
NoBlend >> setControlModule: controlModule [
	"/// Sets the control module.
	 ///
	 /// @param controlModule The control module.
	 ///
	 /// The control module determines the weight of the blending
	 /// operation.  Negative values weigh the blend towards the output
	 /// value from the source module with an index value of 0.  Positive
	 /// values weigh the blend towards the output value from the source
	 /// module with an index value of 1.
	 ///
	 /// This method assigns the control module an index value of 2.
	 /// Passing the control module to this method produces the same
	 /// results as passing the control module to the SetSourceModule()
	 /// method while assigning that noise module an index value of 2.
	 ///
	 /// This control module must exist throughout the lifetime of this
	 /// noise module unless another control module replaces that control
	 /// module."

	self ffiCall: #(void no_noise_module_Blend_SetControlModule(no_noise_module_Blend* self, no_noise_module_Module* controlModule))
]
