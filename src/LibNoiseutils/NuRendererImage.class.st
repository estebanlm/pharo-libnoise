"
/// Renders an image from a noise map.
    ///
    /// This class renders an image given the contents of a noise-map object.
    ///
    /// An application can configure the output of the image in three ways:
    /// - Specify the color gradient.
    /// - Specify the light source parameters.
    /// - Specify the background image.
    ///
    /// <b>Specify the color gradient</b>
    ///
    /// This class uses a color gradient to calculate the color for each pixel
    /// in the destination image according to the value from the corresponding
    /// position in the noise map.
    ///
    /// A color gradient is a list of gradually-changing colors.  A color
    /// gradient is defined by a list of <i>gradient points</i>.  Each
    /// gradient point has a position and a color.  In a color gradient, the
    /// colors between two adjacent gradient points are linearly interpolated.
    ///
    /// For example, suppose this class contains the following color gradient:
    ///
    /// - -1.0 maps to dark blue.
    /// - -0.2 maps to light blue.
    /// - -0.1 maps to tan.
    /// - 0.0 maps to green.
    /// - 1.0 maps to white.
    ///
    /// The value 0.5 maps to a greenish-white color because 0.5 is halfway
    /// between 0.0 (mapped to green) and 1.0 (mapped to white).
    ///
    /// The value -0.6 maps to a medium blue color because -0.6 is halfway
    /// between -1.0 (mapped to dark blue) and -0.2 (mapped to light blue).
    ///
    /// The color gradient requires a minimum of two gradient points.
    ///
    /// This class contains two pre-made gradients: a grayscale gradient and a
    /// color gradient suitable for terrain.  To use these pre-made gradients,
    /// call the BuildGrayscaleGradient() or BuildTerrainGradient() methods,
    /// respectively.
    ///
    /// @note The color value passed to AddGradientPoint() has an alpha
    /// channel.  This alpha channel specifies how a pixel in the background
    /// image (if specified) is blended with the calculated color.  If the
    /// alpha value is high, this class weighs the blend towards the
    /// calculated color, and if the alpha value is low, this class weighs the
    /// blend towards the color from the corresponding pixel in the background
    /// image.
    ///
    /// <b>Specify the light source parameters</b>
    ///
    /// This class contains a parallel light source that lights the image.  It
    /// interprets the noise map as a bump map.
    ///
    /// To enable or disable lighting, pass a Boolean value to the
    /// EnableLight() method.
    ///
    /// To set the position of the light source in the ""sky"", call the
    /// SetLightAzimuth() and SetLightElev() methods.
    ///
    /// To set the color of the light source, call the SetLightColor() method.
    ///
    /// To set the intensity of the light source, call the SetLightIntensity()
    /// method.  A good intensity value is 2.0, although that value tends to
    /// ""wash out"" very light colors from the image.
    /// 
    /// To set the contrast amount between areas in light and areas in shadow,
    /// call the SetLightContrast() method.  Determining the correct contrast
    /// amount requires some trial and error, but if your application
    /// interprets the noise map as a height map that has its elevation values
    /// measured in meters and has a horizontal resolution of @a h meters, a
    /// good contrast amount to use is ( 1.0 / @a h ).
    /// 
    /// <b>Specify the background image</b>
    ///
    /// To specify a background image, pass an Image object to the
    /// SetBackgroundImage() method.
    ///
    /// This class determines the color of a pixel in the destination image by
    /// blending the calculated color with the color of the corresponding
    /// pixel from the background image.
    ///
    /// The blend amount is determined by the alpha of the calculated color.
    /// If the alpha value is high, this class weighs the blend towards the
    /// calculated color, and if the alpha value is low, this class weighs the
    /// blend towards the color from the corresponding pixel in the background
    /// image.
    ///
    /// <b>Rendering the image</b>
    ///
    /// To render the image, perform the following steps:
    /// - Pass a NoiseMap object to the SetSourceNoiseMap() method.
    /// - Pass an Image object to the SetDestImage() method.
    /// - Pass an Image object to the SetBackgroundImage() method (optional)
    /// - Call the Render() method.
"
Class {
	#name : 'NuRendererImage',
	#superclass : 'NuBaseObject',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
NuRendererImage class >> new [

	^ (self rendererImage_new) initialize
]

{ #category : 'private' }
NuRendererImage class >> rendererImage_new [
	"/// Constructor."

	self ffiCall: #(nu_noise_utils_RendererImage* nu_noise_utils_RendererImage_new())
]

{ #category : 'public' }
NuRendererImage >> addGradientPointGradientPos: gradientPos gradientColor: gradientColor [
	"/// Adds a gradient point to this gradient object.
	 ///
	 /// @param gradientPos The position of this gradient point.
	 /// @param gradientColor The color of this gradient point.
	 ///
	 /// @pre No two gradient points have the same position.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions.
	 ///
	 /// This object uses a color gradient to calculate the color for each
	 /// pixel in the destination image according to the value from the
	 /// corresponding position in the noise map.
	 ///
	 /// The gradient requires a minimum of two gradient points.
	 ///
	 /// The specified color value passed to this method has an alpha
	 /// channel.  This alpha channel specifies how a pixel in the
	 /// background image (if specified) is blended with the calculated
	 /// color.  If the alpha value is high, this object weighs the blend
	 /// towards the calculated color, and if the alpha value is low, this
	 /// object weighs the blend towards the color from the corresponding
	 /// pixel in the background image."

	self ffiCall: #(void nu_noise_utils_RendererImage_AddGradientPoint(nu_noise_utils_RendererImage* self, double gradientPos, nu_noise_utils_Color* gradientColor))
]

{ #category : 'public' }
NuRendererImage >> buildGrayscaleGradient [
	"/// Builds a grayscale gradient.
	 ///
	 /// @post The original gradient is cleared and a grayscale gradient is
	 /// created.
	 ///
	 /// This color gradient contains the following gradient points:
	 /// - -1.0 maps to black
	 /// - 1.0 maps to white"

	self ffiCall: #(void nu_noise_utils_RendererImage_BuildGrayscaleGradient(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> buildTerrainGradient [
	"/// Builds a color gradient suitable for terrain.
	 ///
	 /// @post The original gradient is cleared and a terrain gradient is
	 /// created.
	 ///
	 /// This gradient color at position 0.0 is the ""sea level"".  Above
	 /// that value, the gradient contains greens, browns, and whites.
	 /// Below that value, the gradient contains various shades of blue."

	self ffiCall: #(void nu_noise_utils_RendererImage_BuildTerrainGradient(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> clearGradient [
	"/// Clears the color gradient.
	 ///
	 /// Before calling the Render() method, the application must specify a
	 /// new color gradient with at least two gradient points."

	self ffiCall: #(void nu_noise_utils_RendererImage_ClearGradient(nu_noise_utils_RendererImage* self))
]

{ #category : 'finalizing' }
NuRendererImage >> dispose [

	self ffiCall: #(void nu_noise_utils_RendererImage_dispose(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> enableLight: enable [
	"/// Enables or disables the light source.
	 ///
	 /// @param enable A flag that enables or disables the light source.
	 ///
	 /// If the light source is enabled, this object will interpret the
	 /// noise map as a bump map."

	self ffiCall: #(void nu_noise_utils_RendererImage_EnableLight(nu_noise_utils_RendererImage* self, bool enable))
]

{ #category : 'public' }
NuRendererImage >> enableWrap: enable [
	"/// Enables or disables noise-map wrapping.
	 ///
	 /// @param enable A flag that enables or disables noise-map wrapping.
	 ///
	 /// This object requires five points (the initial point and its four
	 /// neighbors) to calculate light shading.  If wrapping is enabled,
	 /// and the initial point is on the edge of the noise map, the
	 /// appropriate neighbors that lie outside of the noise map will
	 /// ""wrap"" to the opposite side(s) of the noise map.  Otherwise, the
	 /// appropriate neighbors are cropped to the edge of the noise map.
	 ///
	 /// Enabling wrapping is useful when creating spherical renderings and
	 /// tileable textures."

	self ffiCall: #(void nu_noise_utils_RendererImage_EnableWrap(nu_noise_utils_RendererImage* self, bool enable))
]

{ #category : 'public' }
NuRendererImage >> getLightAzimuth [
	"/// Returns the azimuth of the light source, in degrees.
	 ///
	 /// @returns The azimuth of the light source.
	 ///
	 /// The azimuth is the location of the light source around the
	 /// horizon:
	 /// - 0.0 degrees is east.
	 /// - 90.0 degrees is north.
	 /// - 180.0 degrees is west.
	 /// - 270.0 degrees is south."

	self ffiCall: #(double nu_noise_utils_RendererImage_GetLightAzimuth(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> getLightBrightness [
	"/// Returns the brightness of the light source.
	 ///
	 /// @returns The brightness of the light source."

	self ffiCall: #(double nu_noise_utils_RendererImage_GetLightBrightness(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> getLightColor [
	"/// Returns the color of the light source.
	 ///
	 /// @returns The color of the light source."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_RendererImage_GetLightColor(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> getLightContrast [
	"/// Returns the contrast of the light source.
	 ///
	 /// @returns The contrast of the light source.
	 ///
	 /// The contrast specifies how sharp the boundary is between the
	 /// light-facing areas and the shadowed areas.
	 ///
	 /// The contrast determines the difference between areas in light and
	 /// areas in shadow.  Determining the correct contrast amount requires
	 /// some trial and error, but if your application interprets the noise
	 /// map as a height map that has a spatial resolution of @a h meters
	 /// and an elevation resolution of 1 meter, a good contrast amount to
	 /// use is ( 1.0 / @a h )."

	self ffiCall: #(double nu_noise_utils_RendererImage_GetLightContrast(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> getLightElev [
	"/// Returns the elevation of the light source, in degrees.
	 ///
	 /// @returns The elevation of the light source.
	 ///
	 /// The elevation is the angle above the horizon:
	 /// - 0 degrees is on the horizon.
	 /// - 90 degrees is straight up."

	self ffiCall: #(double nu_noise_utils_RendererImage_GetLightElev(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> getLightIntensity [
	"/// Returns the intensity of the light source.
	 ///
	 /// @returns The intensity of the light source."

	self ffiCall: #(double nu_noise_utils_RendererImage_GetLightIntensity(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> isLightEnabled [
	"/// Determines if the light source is enabled.
	 ///
	 /// @returns
	 /// - @a true if the light source is enabled.
	 /// - @a false if the light source is disabled."

	self ffiCall: #(bool nu_noise_utils_RendererImage_IsLightEnabled(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> isWrapEnabled [
	"/// Determines if noise-map wrapping is enabled.
	 ///
	 /// @returns
	 /// - @a true if noise-map wrapping is enabled.
	 /// - @a false if noise-map wrapping is disabled.
	 ///
	 /// This object requires five points (the initial point and its four
	 /// neighbors) to calculate light shading.  If wrapping is enabled,
	 /// and the initial point is on the edge of the noise map, the
	 /// appropriate neighbors that lie outside of the noise map will
	 /// ""wrap"" to the opposite side(s) of the noise map.  Otherwise, the
	 /// appropriate neighbors are cropped to the edge of the noise map.
	 ///
	 /// Enabling wrapping is useful when creating spherical renderings and
	 /// tileable textures"

	self ffiCall: #(bool nu_noise_utils_RendererImage_IsWrapEnabled(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> render [
	"/// Renders the destination image using the contents of the source
	 /// noise map and an optional background image.
	 ///
	 /// @pre SetSourceNoiseMap() has been previously called.
	 /// @pre SetDestImage() has been previously called.
	 /// @pre There are at least two gradient points in the color gradient.
	 /// @pre No two gradient points have the same position.
	 /// @pre If a background image was specified, it has the exact same
	 /// size as the source height map.
	 ///
	 /// @post The original contents of the destination image is destroyed.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions.
	 ///
	 /// The background image and the destination image can safely refer to
	 /// the same image, although in this case, the destination image is
	 /// irretrievably blended into the background image."

	self ffiCall: #(void nu_noise_utils_RendererImage_Render(nu_noise_utils_RendererImage* self))
]

{ #category : 'public' }
NuRendererImage >> setBackgroundImage: backgroundImage [
	"/// Sets the background image.
	 ///
	 /// @param backgroundImage The background image.
	 ///
	 /// If a background image has been specified, the Render() method
	 /// blends the pixels from the background image onto the corresponding
	 /// pixels in the destination image.  The blending weights are
	 /// determined by the alpha channel in the pixels in the destination
	 /// image.
	 ///
	 /// The destination image must exist throughout the lifetime of this
	 /// object unless another image replaces that image."

	self ffiCall: #(void nu_noise_utils_RendererImage_SetBackgroundImage(nu_noise_utils_RendererImage* self, nu_noise_utils_Image* backgroundImage))
]

{ #category : 'public' }
NuRendererImage >> setDestImage: destImage [
	"/// Sets the destination image.
	 ///
	 /// @param destImage The destination image.
	 ///
	 /// The destination image will contain the rendered image after a
	 /// successful call to the Render() method.
	 ///
	 /// The destination image must exist throughout the lifetime of this
	 /// object unless another image replaces that image."

	self ffiCall: #(void nu_noise_utils_RendererImage_SetDestImage(nu_noise_utils_RendererImage* self, nu_noise_utils_Image* destImage))
]

{ #category : 'public' }
NuRendererImage >> setLightAzimuth: lightAzimuth [
	"/// Sets the azimuth of the light source, in degrees.
	 ///
	 /// @param lightAzimuth The azimuth of the light source.
	 ///
	 /// The azimuth is the location of the light source around the
	 /// horizon:
	 /// - 0.0 degrees is east.
	 /// - 90.0 degrees is north.
	 /// - 180.0 degrees is west.
	 /// - 270.0 degrees is south.
	 ///
	 /// Make sure the light source is enabled via a call to the
	 /// EnableLight() method before calling the Render() method."

	self ffiCall: #(void nu_noise_utils_RendererImage_SetLightAzimuth(nu_noise_utils_RendererImage* self, double lightAzimuth))
]

{ #category : 'public' }
NuRendererImage >> setLightBrightness: lightBrightness [
	"/// Sets the brightness of the light source.
	 ///
	 /// @param lightBrightness The brightness of the light source.
	 ///
	 /// Make sure the light source is enabled via a call to the
	 /// EnableLight() method before calling the Render() method."

	self ffiCall: #(void nu_noise_utils_RendererImage_SetLightBrightness(nu_noise_utils_RendererImage* self, double lightBrightness))
]

{ #category : 'public' }
NuRendererImage >> setLightColor: lightColor [
	"/// Sets the color of the light source.
	 ///
	 /// @param lightColor The light color.
	 ///
	 /// Make sure the light source is enabled via a call to the
	 /// EnableLight() method before calling the Render() method."

	self ffiCall: #(void nu_noise_utils_RendererImage_SetLightColor(nu_noise_utils_RendererImage* self, nu_noise_utils_Color* lightColor))
]

{ #category : 'public' }
NuRendererImage >> setLightContrast: lightContrast [
	"/// Sets the contrast of the light source.
	 ///
	 /// @param lightContrast The contrast of the light source.
	 ///
	 /// @pre The specified light contrast is positive.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions.
	 ///
	 /// The contrast specifies how sharp the boundary is between the
	 /// light-facing areas and the shadowed areas.
	 ///
	 /// The contrast determines the difference between areas in light and
	 /// areas in shadow.  Determining the correct contrast amount requires
	 /// some trial and error, but if your application interprets the noise
	 /// map as a height map that has a spatial resolution of @a h meters
	 /// and an elevation resolution of 1 meter, a good contrast amount to
	 /// use is ( 1.0 / @a h ).
	 ///
	 /// Make sure the light source is enabled via a call to the
	 /// EnableLight() method before calling the Render() method."

	self ffiCall: #(void nu_noise_utils_RendererImage_SetLightContrast(nu_noise_utils_RendererImage* self, double lightContrast))
]

{ #category : 'public' }
NuRendererImage >> setLightElev: lightElev [
	"/// Sets the elevation of the light source, in degrees.
	 ///
	 /// @param lightElev The elevation of the light source.
	 ///
	 /// The elevation is the angle above the horizon:
	 /// - 0 degrees is on the horizon.
	 /// - 90 degrees is straight up.
	 ///
	 /// Make sure the light source is enabled via a call to the
	 /// EnableLight() method before calling the Render() method."

	self ffiCall: #(void nu_noise_utils_RendererImage_SetLightElev(nu_noise_utils_RendererImage* self, double lightElev))
]

{ #category : 'public' }
NuRendererImage >> setLightIntensity: lightIntensity [
	"/// Returns the intensity of the light source.
	 ///
	 /// @returns The intensity of the light source.
	 ///
	 /// A good value for intensity is 2.0.
	 ///
	 /// Make sure the light source is enabled via a call to the
	 /// EnableLight() method before calling the Render() method."

	self ffiCall: #(void nu_noise_utils_RendererImage_SetLightIntensity(nu_noise_utils_RendererImage* self, double lightIntensity))
]

{ #category : 'public' }
NuRendererImage >> setSourceNoiseMap: sourceNoiseMap [
	"/// Sets the source noise map.
	 ///
	 /// @param sourceNoiseMap The source noise map.
	 ///
	 /// The destination image must exist throughout the lifetime of this
	 /// object unless another image replaces that image."

	self ffiCall: #(void nu_noise_utils_RendererImage_SetSourceNoiseMap(nu_noise_utils_RendererImage* self, nu_noise_utils_NoiseMap* sourceNoiseMap))
]
