"
/// Defines a color gradient.
    ///
    /// A color gradient is a list of gradually-changing colors.  A color
    /// gradient is defined by a list of <i>gradient points</i>.  Each
    /// gradient point has a position and a color.  In a color gradient, the
    /// colors between two adjacent gradient points are linearly interpolated.
    ///
    /// To add a gradient point to the color gradient, pass its position and
    /// color to the AddGradientPoint() method.
    ///
    /// To retrieve a color from a specific position in the color gradient,
    /// pass that position to the GetColor() method.
    ///
    /// This class is a useful tool for coloring height maps based on
    /// elevation.
    ///
    /// <b>Gradient example</b>
    ///
    /// Suppose a gradient object contains the following gradient points:
    /// - -1.0 maps to black.
    /// - 0.0 maps to white.
    /// - 1.0 maps to red.
    ///
    /// If an application passes -0.5 to the GetColor() method, this method
    /// will return a gray color that is halfway between black and white.
    ///
    /// If an application passes 0.25 to the GetColor() method, this method
    /// will return a very light pink color that is one quarter of the way
    /// between white and red.
"
Class {
	#name : 'NuGradientColor',
	#superclass : 'NuBaseObject',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'private' }
NuGradientColor class >> gradientColor_new [
	"/// Constructor."

	self ffiCall: #(nu_noise_utils_GradientColor* nu_noise_utils_GradientColor_new())
]

{ #category : 'instance creation' }
NuGradientColor class >> new [

	^ (self gradientColor_new) initialize
]

{ #category : 'public' }
NuGradientColor >> addGradientPointGradientPos: gradientPos gradientColor: gradientColor [
	"/// Adds a gradient point to this gradient object.
	 ///
	 /// @param gradientPos The position of this gradient point.
	 /// @param gradientColor The color of this gradient point.
	 ///
	 /// @pre No two gradient points have the same position.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the precondition.
	 ///
	 /// It does not matter which order these gradient points are added."

	self ffiCall: #(void nu_noise_utils_GradientColor_AddGradientPoint(nu_noise_utils_GradientColor* self, double gradientPos, nu_noise_utils_Color* gradientColor))
]

{ #category : 'public' }
NuGradientColor >> clear [
	"/// Deletes all the gradient points from this gradient object.
	 ///
	 /// @post All gradient points from this gradient object are deleted."

	self ffiCall: #(void nu_noise_utils_GradientColor_Clear(nu_noise_utils_GradientColor* self))
]

{ #category : 'finalizing' }
NuGradientColor >> dispose [

	self ffiCall: #(void nu_noise_utils_GradientColor_dispose(nu_noise_utils_GradientColor* self))
]

{ #category : 'public' }
NuGradientColor >> getColor: gradientPos [
	"/// Returns the color at the specified position in the color gradient.
	 ///
	 /// @param gradientPos The specified position.
	 ///
	 /// @returns The color at that position."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_GradientColor_GetColor(nu_noise_utils_GradientColor* self, double gradientPos))
]

{ #category : 'public' }
NuGradientColor >> getGradientPointArray [
	"/// Returns a pointer to the array of gradient points in this object.
	 ///
	 /// @returns A pointer to the array of gradient points.
	 ///
	 /// Before calling this method, call GetGradientPointCount() to
	 /// determine the number of gradient points in this array.
	 ///
	 /// It is recommended that an application does not store this pointer
	 /// for later use since the pointer to the array may change if the
	 /// application calls another method of this object."

	self ffiCall: #(nu_noise_utils_GradientPoint* nu_noise_utils_GradientColor_GetGradientPointArray(nu_noise_utils_GradientColor* self))
]

{ #category : 'public' }
NuGradientColor >> getGradientPointCount [
	"/// Returns the number of gradient points stored in this object.
	 ///
	 /// @returns The number of gradient points stored in this object."

	self ffiCall: #(int nu_noise_utils_GradientColor_GetGradientPointCount(nu_noise_utils_GradientColor* self))
]
