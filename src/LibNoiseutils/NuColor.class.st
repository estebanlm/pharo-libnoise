"
/// Defines a color.
    ///
    /// A color object contains four 8-bit channels: red, green, blue, and an
    /// alpha (transparency) channel.  Channel values range from 0 to 255.
    ///
    /// The alpha channel defines the transparency of the color.  If the alpha
    /// channel has a value of 0, the color is completely transparent.  If the
    /// alpha channel has a value of 255, the color is completely opaque.
"
Class {
	#name : 'NuColor',
	#superclass : 'NuBaseObject',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'private' }
NuColor class >> color_new [
	"/// Constructor."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Color_new_1())
]

{ #category : 'private' }
NuColor class >> color_newr: r g: g b: b a: a [
	"/// Constructor.
	 ///
	 /// @param r Value of the red channel.
	 /// @param g Value of the green channel.
	 /// @param b Value of the blue channel.
	 /// @param a Value of the alpha (transparency) channel."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Color_new_2(no_noise_uint8 r, no_noise_uint8 g, no_noise_uint8 b, no_noise_uint8 a))
]

{ #category : 'instance creation' }
NuColor class >> fromArray: anArray [

	^ self 
		newR: anArray first 
		g: anArray second
		b: anArray third
		a: anArray fourth
]

{ #category : 'instance creation' }
NuColor class >> new [

	^ (self color_new) initialize
]

{ #category : 'instance creation' }
NuColor class >> newR: r g: g b: b a: a [

	^ (self color_newr: r g: g b: b a: a) initialize
]

{ #category : 'finalizing' }
NuColor >> dispose [

	self ffiCall: #(void nu_noise_utils_Color_dispose(nu_noise_utils_Color* self))
]
