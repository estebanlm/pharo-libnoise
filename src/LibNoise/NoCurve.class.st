"
/// Noise module that maps the output value from a source module onto an
    /// arbitrary function curve.
    ///
    /// @image html modulecurve.png
    ///
    /// This noise module maps the output value from the source module onto an
    /// application-defined curve.  This curve is defined by a number of
    /// <i>control points</i>; each control point has an <i>input value</i>
    /// that maps to an <i>output value</i>.  Refer to the following
    /// illustration:
    ///
    /// @image html curve.png
    ///
    /// To add the control points to this curve, call the AddControlPoint()
    /// method.
    ///
    /// Since this curve is a cubic spline, an application must add a minimum
    /// of four control points to the curve.  If this is not done, the
    /// GetValue() method fails.  Each control point can have any input and
    /// output value, although no two control points can have the same input
    /// value.  There is no limit to the number of control points that can be
    /// added to the curve.  
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoCurve',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoCurve class >> curve_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Curve* no_noise_module_Curve_new())
]

{ #category : 'instance creation' }
NoCurve class >> new [

	^ (self curve_new) initialize
]

{ #category : 'public' }
NoCurve >> addControlPointInputValue: inputValue outputValue: outputValue [
	"/// Adds a control point to the curve.
	 ///
	 /// @param inputValue The input value stored in the control point.
	 /// @param outputValue The output value stored in the control point.
	 ///
	 /// @pre No two control points have the same input value.
	 ///
	 /// @throw noise::ExceptionInvalidParam An invalid parameter was
	 /// specified; see the preconditions for more information.
	 ///
	 /// It does not matter which order these points are added."

	self ffiCall: #(void no_noise_module_Curve_AddControlPoint(no_noise_module_Curve* self, double inputValue, double outputValue))
]

{ #category : 'public' }
NoCurve >> clearAllControlPoints [
	"/// Deletes all the control points on the curve.
	 ///
	 /// @post All points on the curve are deleted."

	self ffiCall: #(void no_noise_module_Curve_ClearAllControlPoints(no_noise_module_Curve* self))
]

{ #category : 'finalizing' }
NoCurve >> dispose [

	self ffiCall: #(void no_noise_module_Curve_dispose(no_noise_module_Curve* self))
]

{ #category : 'public' }
NoCurve >> getControlPointArray [
	"/// Returns a pointer to the array of control points on the curve.
	 ///
	 /// @returns A pointer to the array of control points.
	 ///
	 /// Before calling this method, call GetControlPointCount() to
	 /// determine the number of control points in this array.
	 ///
	 /// It is recommended that an application does not store this pointer
	 /// for later use since the pointer to the array may change if the
	 /// application calls another method of this object."

	self ffiCall: #(struct no_noise_module_ControlPoint* no_noise_module_Curve_GetControlPointArray(no_noise_module_Curve* self))
]

{ #category : 'public' }
NoCurve >> getControlPointCount [
	"/// Returns the number of control points on the curve.
	 ///
	 /// @returns The number of control points on the curve."

	self ffiCall: #(int no_noise_module_Curve_GetControlPointCount(no_noise_module_Curve* self))
]

{ #category : 'public' }
NoCurve >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Curve_GetSourceModuleCount(no_noise_module_Curve* self))
]

{ #category : 'public' }
NoCurve >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Curve_GetValue(no_noise_module_Curve* self, double x, double y, double z))
]
