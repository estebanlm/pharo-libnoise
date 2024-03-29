"
/// Noise module that maps the output value from a source module onto a
    /// terrace-forming curve.
    ///
    /// @image html moduleterrace.png
    ///
    /// This noise module maps the output value from the source module onto a
    /// terrace-forming curve.  The start of this curve has a slope of zero;
    /// its slope then smoothly increases.  This curve also contains
    /// <i>control points</i> which resets the slope to zero at that point,
    /// producing a ""terracing"" effect.  Refer to the following illustration:
    ///
    /// @image html terrace.png
    ///
    /// To add a control point to this noise module, call the
    /// AddControlPoint() method.
    ///
    /// An application must add a minimum of two control points to the curve.
    /// If this is not done, the GetValue() method fails.  The control points
    /// can have any value, although no two control points can have the same
    /// value.  There is no limit to the number of control points that can be
    /// added to the curve.
    ///
    /// This noise module clamps the output value from the source module if
    /// that value is less than the value of the lowest control point or
    /// greater than the value of the highest control point.
    ///
    /// This noise module is often used to generate terrain features such as
    /// your stereotypical desert canyon.
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoTerrace',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoTerrace class >> new [

	^ (self terrace_new) initialize
]

{ #category : 'private' }
NoTerrace class >> terrace_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Terrace* no_noise_module_Terrace_new())
]

{ #category : 'public' }
NoTerrace >> addControlPoint: value [
	"/// Adds a control point to the terrace-forming curve.
	 ///
	 /// @param value The value of the control point to add.
	 ///
	 /// @pre No two control points have the same value.
	 ///
	 /// @throw noise::ExceptionInvalidParam An invalid parameter was
	 /// specified; see the preconditions for more information.
	 ///
	 /// Two or more control points define the terrace-forming curve.  The
	 /// start of this curve has a slope of zero; its slope then smoothly
	 /// increases.  At the control points, its slope resets to zero.
	 ///
	 /// It does not matter which order these points are added."

	self ffiCall: #(void no_noise_module_Terrace_AddControlPoint(no_noise_module_Terrace* self, double value))
]

{ #category : 'public' }
NoTerrace >> clearAllControlPoints [
	"/// Deletes all the control points on the terrace-forming curve.
	 ///
	 /// @post All control points on the terrace-forming curve are deleted."

	self ffiCall: #(void no_noise_module_Terrace_ClearAllControlPoints(no_noise_module_Terrace* self))
]

{ #category : 'finalizing' }
NoTerrace >> dispose [

	self ffiCall: #(void no_noise_module_Terrace_dispose(no_noise_module_Terrace* self))
]

{ #category : 'public' }
NoTerrace >> getControlPointArray [
	"/// Returns a pointer to the array of control points on the
	 /// terrace-forming curve.
	 ///
	 /// @returns A pointer to the array of control points in this noise
	 /// module.
	 ///
	 /// Two or more control points define the terrace-forming curve.  The
	 /// start of this curve has a slope of zero; its slope then smoothly
	 /// increases.  At the control points, its slope resets to zero.
	 ///
	 /// Before calling this method, call GetControlPointCount() to
	 /// determine the number of control points in this array.
	 ///
	 /// It is recommended that an application does not store this pointer
	 /// for later use since the pointer to the array may change if the
	 /// application calls another method of this object."

	self ffiCall: #(const double* no_noise_module_Terrace_GetControlPointArray(no_noise_module_Terrace* self))
]

{ #category : 'public' }
NoTerrace >> getControlPointCount [
	"/// Returns the number of control points on the terrace-forming curve.
	 ///
	 /// @returns The number of control points on the terrace-forming
	 /// curve."

	self ffiCall: #(int no_noise_module_Terrace_GetControlPointCount(no_noise_module_Terrace* self))
]

{ #category : 'public' }
NoTerrace >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Terrace_GetSourceModuleCount(no_noise_module_Terrace* self))
]

{ #category : 'public' }
NoTerrace >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Terrace_GetValue(no_noise_module_Terrace* self, double x, double y, double z))
]

{ #category : 'public' }
NoTerrace >> invertTerraces: invert [
	"/// Enables or disables the inversion of the terrace-forming curve
	 /// between the control points.
	 ///
	 /// @param invert Specifies whether to invert the curve between the
	 /// control points."

	self ffiCall: #(void no_noise_module_Terrace_InvertTerraces(no_noise_module_Terrace* self, bool invert))
]

{ #category : 'public' }
NoTerrace >> isTerracesInverted [
	"/// Determines if the terrace-forming curve between the control
	 /// points is inverted.
	 ///
	 /// @returns
	 /// - @a true if the curve between the control points is inverted.
	 /// - @a false if the curve between the control points is not
	 ///   inverted."

	self ffiCall: #(bool no_noise_module_Terrace_IsTerracesInverted(no_noise_module_Terrace* self))
]

{ #category : 'public' }
NoTerrace >> makeControlPoints: controlPointCount [
	"/// Creates a number of equally-spaced control points that range from
	 /// -1 to +1.
	 ///
	 /// @param controlPointCount The number of control points to generate.
	 ///
	 /// @pre The number of control points must be greater than or equal to
	 /// 2.
	 ///
	 /// @post The previous control points on the terrace-forming curve are
	 /// deleted.
	 ///
	 /// @throw noise::ExceptionInvalidParam An invalid parameter was
	 /// specified; see the preconditions for more information.
	 ///
	 /// Two or more control points define the terrace-forming curve.  The
	 /// start of this curve has a slope of zero; its slope then smoothly
	 /// increases.  At the control points, its slope resets to zero."

	self ffiCall: #(void no_noise_module_Terrace_MakeControlPoints(no_noise_module_Terrace* self, int controlPointCount))
]
