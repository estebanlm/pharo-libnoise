"
/// Renders a normal map from a noise map.
    ///
    /// This class renders an image containing the normal vectors from a noise
    /// map object.  This image can then be used as a bump map for a 3D
    /// application or game.
    ///
    /// This class encodes the (x, y, z) components of the normal vector into
    /// the (red, green, blue) channels of the image.  Like any 24-bit
    /// true-color image, the channel values range from 0 to 255.  0
    /// represents a normal coordinate of -1.0 and 255 represents a normal
    /// coordinate of +1.0.
    ///
    /// You should also specify the <i>bump height</i> before rendering the
    /// normal map.  The bump height specifies the ratio of spatial resolution
    /// to elevation resolution.  For example, if your noise map has a spatial
    /// resolution of 30 meters and an elevation resolution of one meter, set
    /// the bump height to 1.0 / 30.0.
    ///
    /// <b>Rendering the normal map</b>
    ///
    /// To render the image containing the normal map, perform the following
    /// steps:
    /// - Pass a NoiseMap object to the SetSourceNoiseMap() method.
    /// - Pass an Image object to the SetDestImage() method.
    /// - Call the Render() method.
"
Class {
	#name : 'NuRendererNormalMap',
	#superclass : 'NuBaseObject',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
NuRendererNormalMap class >> new [

	^ (self rendererNormalMap_new) initialize
]

{ #category : 'private' }
NuRendererNormalMap class >> rendererNormalMap_new [
	"/// Constructor."

	self ffiCall: #(nu_noise_utils_RendererNormalMap* nu_noise_utils_RendererNormalMap_new())
]

{ #category : 'finalizing' }
NuRendererNormalMap >> dispose [

	self ffiCall: #(void nu_noise_utils_RendererNormalMap_dispose(nu_noise_utils_RendererNormalMap* self))
]

{ #category : 'public' }
NuRendererNormalMap >> enableWrap: enable [
	"/// Enables or disables noise-map wrapping.
	 ///
	 /// @param enable A flag that enables or disables noise-map wrapping.
	 ///
	 /// This object requires three points (the initial point and the right
	 /// and up neighbors) to calculate the normal vector at that point.
	 /// If wrapping is/ enabled, and the initial point is on the edge of
	 /// the noise map, the appropriate neighbors that lie outside of the
	 /// noise map will ""wrap"" to the opposite side(s) of the noise map.
	 /// Otherwise, the appropriate neighbors are cropped to the edge of
	 /// the noise map.
	 ///
	 /// Enabling wrapping is useful when creating spherical and tileable
	 /// normal maps."

	self ffiCall: #(void nu_noise_utils_RendererNormalMap_EnableWrap(nu_noise_utils_RendererNormalMap* self, bool enable))
]

{ #category : 'public' }
NuRendererNormalMap >> getBumpHeight [
	"/// Returns the bump height.
	 ///
	 /// @returns The bump height.
	 ///
	 /// The bump height specifies the ratio of spatial resolution to
	 /// elevation resolution.  For example, if your noise map has a
	 /// spatial resolution of 30 meters and an elevation resolution of one
	 /// meter, set the bump height to 1.0 / 30.0.
	 ///
	 /// The spatial resolution and elevation resolution are determined by
	 /// the application."

	self ffiCall: #(double nu_noise_utils_RendererNormalMap_GetBumpHeight(nu_noise_utils_RendererNormalMap* self))
]

{ #category : 'public' }
NuRendererNormalMap >> isWrapEnabled [
	"/// Determines if noise-map wrapping is enabled.
	 ///
	 /// @returns
	 /// - @a true if noise-map wrapping is enabled.
	 /// - @a false if noise-map wrapping is disabled.
	 ///
	 /// This object requires three points (the initial point and the right
	 /// and up neighbors) to calculate the normal vector at that point.
	 /// If wrapping is/ enabled, and the initial point is on the edge of
	 /// the noise map, the appropriate neighbors that lie outside of the
	 /// noise map will ""wrap"" to the opposite side(s) of the noise map.
	 /// Otherwise, the appropriate neighbors are cropped to the edge of
	 /// the noise map.
	 ///
	 /// Enabling wrapping is useful when creating spherical and tileable
	 /// normal maps."

	self ffiCall: #(bool nu_noise_utils_RendererNormalMap_IsWrapEnabled(nu_noise_utils_RendererNormalMap* self))
]

{ #category : 'public' }
NuRendererNormalMap >> render [
	"/// Renders the noise map to the destination image.
	 ///
	 /// @pre SetSourceNoiseMap() has been previously called.
	 /// @pre SetDestImage() has been previously called.
	 ///
	 /// @post The original contents of the destination image is destroyed.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions."

	self ffiCall: #(void nu_noise_utils_RendererNormalMap_Render(nu_noise_utils_RendererNormalMap* self))
]

{ #category : 'public' }
NuRendererNormalMap >> setBumpHeight: bumpHeight [
	"/// Sets the bump height.
	 ///
	 /// @param bumpHeight The bump height.
	 ///
	 /// The bump height specifies the ratio of spatial resolution to
	 /// elevation resolution.  For example, if your noise map has a
	 /// spatial resolution of 30 meters and an elevation resolution of one
	 /// meter, set the bump height to 1.0 / 30.0.
	 ///
	 /// The spatial resolution and elevation resolution are determined by
	 /// the application."

	self ffiCall: #(void nu_noise_utils_RendererNormalMap_SetBumpHeight(nu_noise_utils_RendererNormalMap* self, double bumpHeight))
]

{ #category : 'public' }
NuRendererNormalMap >> setDestImage: destImage [
	"/// Sets the destination image.
	 ///
	 /// @param destImage The destination image.
	 ///
	 /// The destination image will contain the normal map after a
	 /// successful call to the Render() method.
	 ///
	 /// The destination image must exist throughout the lifetime of this
	 /// object unless another image replaces that image."

	self ffiCall: #(void nu_noise_utils_RendererNormalMap_SetDestImage(nu_noise_utils_RendererNormalMap* self, nu_noise_utils_Image* destImage))
]

{ #category : 'public' }
NuRendererNormalMap >> setSourceNoiseMap: sourceNoiseMap [
	"/// Sets the source noise map.
	 ///
	 /// @param sourceNoiseMap The source noise map.
	 ///
	 /// The destination image must exist throughout the lifetime of this
	 /// object unless another image replaces that image."

	self ffiCall: #(void nu_noise_utils_RendererNormalMap_SetSourceNoiseMap(nu_noise_utils_RendererNormalMap* self, nu_noise_utils_NoiseMap* sourceNoiseMap))
]
