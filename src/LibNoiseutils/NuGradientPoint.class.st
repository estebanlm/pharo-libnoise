"
/// Defines a point used to build a color gradient.
    ///
    /// A color gradient is a list of gradually-changing colors.  A color
    /// gradient is defined by a list of <i>gradient points</i>.  Each
    /// gradient point has a position and a color.  In a color gradient, the
    /// colors between two adjacent gradient points are linearly interpolated.
    ///
    /// The ColorGradient class defines a color gradient by a list of these
    /// objects.
"
Class {
	#name : 'NuGradientPoint',
	#superclass : 'NuBaseObject',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'enum declaration' }
NuGradientPoint class >> fieldsDesc [

	^ #(
	double pos;
	nu_noise_utils_Color* color
	)
]

{ #category : 'accessing - structure variables' }
NuGradientPoint >> color [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_COLOR) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
NuGradientPoint >> color: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COLOR put: anObject getHandle.
]

{ #category : 'finalizing' }
NuGradientPoint >> dispose [

	self ffiCall: #(void nu_noise_utils_GradientPoint_dispose(nu_noise_utils_GradientPoint* self))
]

{ #category : 'accessing - structure variables' }
NuGradientPoint >> pos [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_POS
]

{ #category : 'accessing - structure variables' }
NuGradientPoint >> pos: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_POS put: anObject
]
