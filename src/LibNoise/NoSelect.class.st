"
/// Noise module that outputs the value selected from one of two source
    /// modules chosen by the output value from a control module.
    ///
    /// @image html moduleselect.png
    ///
    /// Unlike most other noise modules, the index value assigned to a source
    /// module determines its role in the selection operation:
    /// - Source module 0 (upper left in the diagram) outputs a value.
    /// - Source module 1 (lower left in the diagram) outputs a value.
    /// - Source module 2 (bottom of the diagram) is known as the <i>control
    ///   module</i>.  The control module determines the value to select.  If
    ///   the output value from the control module is within a range of values
    ///   known as the <i>selection range</i>, this noise module outputs the
    ///   value from the source module with an index value of 1.  Otherwise,
    ///   this noise module outputs the value from the source module with an
    ///   index value of 0.
    ///
    /// To specify the bounds of the selection range, call the SetBounds()
    /// method.
    ///
    /// An application can pass the control module to the SetControlModule()
    /// method instead of the SetSourceModule() method.  This may make the
    /// application code easier to read.
    ///
    /// By default, there is an abrupt transition between the output values
    /// from the two source modules at the selection-range boundary.  To
    /// smooth the transition, pass a non-zero value to the SetEdgeFalloff()
    /// method.  Higher values result in a smoother transition.
    ///
    /// This noise module requires three source modules.
"
Class {
	#name : 'NoSelect',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoSelect class >> new [

	^ (self select_new) initialize
]

{ #category : 'private' }
NoSelect class >> select_new [
	"/// Constructor.
	 ///
	 /// The default falloff value at the edge transition is set to
	 /// noise::module::DEFAULT_SELECT_EDGE_FALLOFF.
	 ///
	 /// The default lower bound of the selection range is set to
	 /// noise::module::DEFAULT_SELECT_LOWER_BOUND.
	 ///
	 /// The default upper bound of the selection range is set to
	 /// noise::module::DEFAULT_SELECT_UPPER_BOUND."

	self ffiCall: #(no_noise_module_Select* no_noise_module_Select_new())
]

{ #category : 'finalizing' }
NoSelect >> dispose [

	self ffiCall: #(void no_noise_module_Select_dispose(no_noise_module_Select* self))
]

{ #category : 'public' }
NoSelect >> getControlModule [
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
	 /// The control module determines the output value to select.  If the
	 /// output value from the control module is within a range of values
	 /// known as the <i>selection range</i>, the GetValue() method outputs
	 /// the value from the source module with an index value of 1.
	 /// Otherwise, this method outputs the value from the source module
	 /// with an index value of 0."

	self ffiCall: #(no_noise_module_Module* no_noise_module_Select_GetControlModule(no_noise_module_Select* self))
]

{ #category : 'public' }
NoSelect >> getEdgeFalloff [
	"/// Returns the falloff value at the edge transition.
	 ///
	 /// @returns The falloff value at the edge transition.
	 ///
	 /// The falloff value is the width of the edge transition at either
	 /// edge of the selection range.
	 ///
	 /// By default, there is an abrupt transition between the output
	 /// values from the two source modules at the selection-range
	 /// boundary."

	self ffiCall: #(double no_noise_module_Select_GetEdgeFalloff(no_noise_module_Select* self))
]

{ #category : 'public' }
NoSelect >> getLowerBound [
	"/// Returns the lower bound of the selection range.
	 ///
	 /// @returns The lower bound of the selection range.
	 ///
	 /// If the output value from the control module is within the
	 /// selection range, the GetValue() method outputs the value from the
	 /// source module with an index value of 1.  Otherwise, this method
	 /// outputs the value from the source module with an index value of 0."

	self ffiCall: #(double no_noise_module_Select_GetLowerBound(no_noise_module_Select* self))
]

{ #category : 'public' }
NoSelect >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Select_GetSourceModuleCount(no_noise_module_Select* self))
]

{ #category : 'public' }
NoSelect >> getUpperBound [
	"/// Returns the upper bound of the selection range.
	 ///
	 /// @returns The upper bound of the selection range.
	 ///
	 /// If the output value from the control module is within the
	 /// selection range, the GetValue() method outputs the value from the
	 /// source module with an index value of 1.  Otherwise, this method
	 /// outputs the value from the source module with an index value of 0."

	self ffiCall: #(double no_noise_module_Select_GetUpperBound(no_noise_module_Select* self))
]

{ #category : 'public' }
NoSelect >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Select_GetValue(no_noise_module_Select* self, double x, double y, double z))
]

{ #category : 'public' }
NoSelect >> setBoundsLowerBound: lowerBound upperBound: upperBound [
	"/// Sets the lower and upper bounds of the selection range.
	 ///
	 /// @param lowerBound The lower bound.
	 /// @param upperBound The upper bound.
	 ///
	 /// @pre The lower bound must be less than or equal to the upper
	 /// bound.
	 ///
	 /// @throw noise::ExceptionInvalidParam An invalid parameter was
	 /// specified; see the preconditions for more information.
	 ///
	 /// If the output value from the control module is within the
	 /// selection range, the GetValue() method outputs the value from the
	 /// source module with an index value of 1.  Otherwise, this method
	 /// outputs the value from the source module with an index value of 0."

	self ffiCall: #(void no_noise_module_Select_SetBounds(no_noise_module_Select* self, double lowerBound, double upperBound))
]

{ #category : 'public' }
NoSelect >> setControlModule: controlModule [
	"/// Sets the control module.
	 ///
	 /// @param controlModule The control module.
	 ///
	 /// The control module determines the output value to select.  If the
	 /// output value from the control module is within a range of values
	 /// known as the <i>selection range</i>, the GetValue() method outputs
	 /// the value from the source module with an index value of 1.
	 /// Otherwise, this method outputs the value from the source module
	 /// with an index value of 0.
	 ///
	 /// This method assigns the control module an index value of 2.
	 /// Passing the control module to this method produces the same
	 /// results as passing the control module to the SetSourceModule()
	 /// method while assigning that noise module an index value of 2.
	 ///
	 /// This control module must exist throughout the lifetime of this
	 /// noise module unless another control module replaces that control
	 /// module."

	self ffiCall: #(void no_noise_module_Select_SetControlModule(no_noise_module_Select* self, no_noise_module_Module* controlModule))
]

{ #category : 'public' }
NoSelect >> setEdgeFalloff: edgeFalloff [
	"/// Sets the falloff value at the edge transition.
	 ///
	 /// @param edgeFalloff The falloff value at the edge transition.
	 ///
	 /// The falloff value is the width of the edge transition at either
	 /// edge of the selection range.
	 ///
	 /// By default, there is an abrupt transition between the values from
	 /// the two source modules at the boundaries of the selection range.
	 ///
	 /// For example, if the selection range is 0.5 to 0.8, and the edge
	 /// falloff value is 0.1, then the GetValue() method outputs:
	 /// - the output value from the source module with an index value of 0
	 ///   if the output value from the control module is less than 0.4
	 ///   ( = 0.5 - 0.1).
	 /// - a linear blend between the two output values from the two source
	 ///   modules if the output value from the control module is between
	 ///   0.4 ( = 0.5 - 0.1) and 0.6 ( = 0.5 + 0.1).
	 /// - the output value from the source module with an index value of 1
	 ///   if the output value from the control module is between 0.6
	 ///   ( = 0.5 + 0.1) and 0.7 ( = 0.8 - 0.1).
	 /// - a linear blend between the output values from the two source
	 ///   modules if the output value from the control module is between
	 ///   0.7 ( = 0.8 - 0.1 ) and 0.9 ( = 0.8 + 0.1).
	 /// - the output value from the source module with an index value of 0
	 ///   if the output value from the control module is greater than 0.9
	 ///   ( = 0.8 + 0.1)."

	self ffiCall: #(void no_noise_module_Select_SetEdgeFalloff(no_noise_module_Select* self, double edgeFalloff))
]
