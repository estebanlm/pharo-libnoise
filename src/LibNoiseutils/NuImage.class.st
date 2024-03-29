"
/// Implements an image, a 2-dimensional array of color values.
    ///
    /// An image can be used to store a color texture.
    ///
    /// These color values are of type Color.
    ///
    /// The size (width and height) of the image can be specified during
    /// object construction or at any other time.
    ///
    /// The GetValue() and SetValue() methods can be used to access individual
    /// color values stored in the image.
    ///
    /// This class manages its own memory.  If you copy an image object into
    /// another image object, the original contents of the image object will
    /// be freed.
    ///
    /// If you specify a new size for the image and the new size is smaller
    /// than the current size, the allocated memory will not be reallocated.
    /// Call ReclaimMem() to reclaim the wasted memory.
    ///
    /// <b>Border Values</b>
    ///
    /// All of the color values outside of the image are assumed to have a
    /// common color value known as the <i>border value</i>.
    ///
    /// To set the border value, call the SetBorderValue() method.
    ///
    /// The GetValue() method returns the border value if the specified
    /// position lies outside of the image.
    ///
    /// <b>Internal Image Structure</b>
    ///
    /// Internally, the color values are organized into horizontal rows called
    /// @a slabs.  Slabs are ordered from bottom to top.
    ///
    /// Each slab contains a contiguous row of color values in memory.  The
    /// color values in a slab are organized left to right.  These values are
    /// of type Color.
    ///
    /// The offset between the starting points of any two adjacent slabs is
    /// called the <i>stride amount</i>.  The stride amount is measured by the
    /// number of Color objects between these two starting points, not by the
    /// number of bytes.  For efficiency reasons, the stride is often a
    /// multiple of the machine word size.
    ///
    /// The GetSlabPtr() methods allow you to retrieve pointers to the slabs
    /// themselves.
"
Class {
	#name : 'NuImage',
	#superclass : 'NuBaseObject',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'private' }
NuImage class >> image_new [
	"/// Constructor.
	 ///
	 /// Creates an empty image."

	self ffiCall: #(nu_noise_utils_Image* nu_noise_utils_Image_new_1())
]

{ #category : 'private' }
NuImage class >> image_new: rhs [
	"/// Copy constructor.
	 ///
	 /// @throw noise::ExceptionOutOfMemory Out of memory."

	self ffiCall: #(nu_noise_utils_Image* nu_noise_utils_Image_new_3(nu_noise_utils_Image* rhs))
]

{ #category : 'private' }
NuImage class >> image_newwidth: width height: height [
	"/// Constructor.
	 ///
	 /// @param width The width of the new image.
	 /// @param height The height of the new image.
	 ///
	 /// @pre The width and height values are positive.
	 /// @pre The width and height values do not exceed the maximum
	 /// possible width and height for the image.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions.
	 /// @throw noise::ExceptionOutOfMemory Out of memory.
	 ///
	 /// Creates an image with uninitialized color values.
	 ///
	 /// It is considered an error if the specified dimensions are not
	 /// positive."

	self ffiCall: #(nu_noise_utils_Image* nu_noise_utils_Image_new_2(int width, int height))
]

{ #category : 'instance creation' }
NuImage class >> new [

	^ (self image_new) initialize
]

{ #category : 'instance creation' }
NuImage class >> newRhs: rhs [

	^ (self image_new: rhs) initialize
]

{ #category : 'instance creation' }
NuImage class >> newWidth: width height: height [

	^ (self image_newwidth: width height: height) initialize
]

{ #category : 'public' }
NuImage >> clear: value [
	"/// Clears the image to a specified color value.
	 ///
	 /// @param value The color value that all positions within the image
	 /// are cleared to."

	self ffiCall: #(void nu_noise_utils_Image_Clear(nu_noise_utils_Image* self, nu_noise_utils_Color* value))
]

{ #category : 'finalizing' }
NuImage >> dispose [

	self ffiCall: #(void nu_noise_utils_Image_dispose(nu_noise_utils_Image* self))
]

{ #category : 'public' }
NuImage >> getBorderValue [
	"/// Returns the color value used for all positions outside of the
	 /// image.
	 ///
	 /// @returns The color value used for all positions outside of the
	 /// image.
	 ///
	 /// All positions outside of the image are assumed to have a common
	 /// color value known as the <i>border value</i>."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Image_GetBorderValue(nu_noise_utils_Image* self))
]

{ #category : 'public' }
NuImage >> getConstSlabPtr [
	"/// Returns a const pointer to a slab.
	 ///
	 /// @returns A const pointer to a slab at the position (0, 0), or
	 /// @a NULL if the image is empty."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Image_GetConstSlabPtr_1(nu_noise_utils_Image* self))
]

{ #category : 'public' }
NuImage >> getConstSlabPtr: row [
	"/// Returns a const pointer to a slab at the specified row.
	 ///
	 /// @param row The row, or @a y coordinate.
	 ///
	 /// @returns A const pointer to a slab at the position ( 0, @a row ),
	 /// or @a NULL if the image is empty.
	 ///
	 /// @pre The coordinates must exist within the bounds of the image.
	 ///
	 /// This method does not perform bounds checking so be careful when
	 /// calling it."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Image_GetConstSlabPtr_2(nu_noise_utils_Image* self, int row))
]

{ #category : 'public' }
NuImage >> getConstSlabPtrX: x y: y [
	"/// Returns a const pointer to a slab at the specified position.
	 ///
	 /// @param x The x coordinate of the position.
	 /// @param y The y coordinate of the position.
	 ///
	 /// @returns A const pointer to a slab at the position ( @a x, @a y ),
	 /// or @a NULL if the image is empty.
	 ///
	 /// @pre The coordinates must exist within the bounds of the image.
	 ///
	 /// This method does not perform bounds checking so be careful when
	 /// calling it."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Image_GetConstSlabPtr_3(nu_noise_utils_Image* self, int x, int y))
]

{ #category : 'public' }
NuImage >> getHeight [
	"/// Returns the height of the image.
	 ///
	 /// @returns The height of the image."

	self ffiCall: #(int nu_noise_utils_Image_GetHeight(nu_noise_utils_Image* self))
]

{ #category : 'public' }
NuImage >> getMemUsed [
	"/// Returns the amount of memory allocated for this image.
	 ///
	 /// @returns The amount of memory allocated for this image.
	 ///
	 /// This method returns the number of Color objects allocated."

	self ffiCall: #(int nu_noise_utils_Image_GetMemUsed(nu_noise_utils_Image* self))
]

{ #category : 'public' }
NuImage >> getSlabPtr [
	"/// Returns a pointer to a slab.
	 ///
	 /// @returns A pointer to a slab at the position (0, 0), or @a NULL if
	 /// the image is empty."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Image_GetSlabPtr_1(nu_noise_utils_Image* self))
]

{ #category : 'public' }
NuImage >> getSlabPtr: row [
	"/// Returns a pointer to a slab at the specified row.
	 ///
	 /// @param row The row, or @a y coordinate.
	 ///
	 /// @returns A pointer to a slab at the position ( 0, @a row ), or
	 /// @a NULL if the image is empty.
	 ///
	 /// @pre The coordinates must exist within the bounds of the image.
	 ///
	 /// This method does not perform bounds checking so be careful when
	 /// calling it."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Image_GetSlabPtr_2(nu_noise_utils_Image* self, int row))
]

{ #category : 'public' }
NuImage >> getSlabPtrX: x y: y [
	"/// Returns a pointer to a slab at the specified position.
	 ///
	 /// @param x The x coordinate of the position.
	 /// @param y The y coordinate of the position.
	 ///
	 /// @returns A pointer to a slab at the position ( @a x, @a y ), or
	 /// @a NULL if the image is empty.
	 ///
	 /// @pre The coordinates must exist within the bounds of the image.
	 ///
	 /// This method does not perform bounds checking so be careful when
	 /// calling it."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Image_GetSlabPtr_3(nu_noise_utils_Image* self, int x, int y))
]

{ #category : 'public' }
NuImage >> getStride [
	"/// Returns the stride amount of the image.
	 ///
	 /// @returns The stride amount of the image.
	 ///
	 /// - The <i>stride amount</i> is the offset between the starting
	 ///   points of any two adjacent slabs in an image.
	 /// - The stride amount is measured by the number of Color objects
	 ///   between these two points, not by the number of bytes."

	self ffiCall: #(int nu_noise_utils_Image_GetStride(nu_noise_utils_Image* self))
]

{ #category : 'public' }
NuImage >> getValueX: x y: y [
	"/// Returns a color value from the specified position in the image.
	 ///
	 /// @param x The x coordinate of the position.
	 /// @param y The y coordinate of the position.
	 ///
	 /// @returns The color value at that position.
	 ///
	 /// This method returns the border value if the coordinates exist
	 /// outside of the image."

	self ffiCall: #(nu_noise_utils_Color* nu_noise_utils_Image_GetValue(nu_noise_utils_Image* self, int x, int y))
]

{ #category : 'public' }
NuImage >> getWidth [
	"/// Returns the width of the image.
	 ///
	 /// @returns The width of the image."

	self ffiCall: #(int nu_noise_utils_Image_GetWidth(nu_noise_utils_Image* self))
]

{ #category : 'public' }
NuImage >> reclaimMem [
	"/// Reallocates the image to recover wasted memory.
	 ///
	 /// @throw noise::ExceptionOutOfMemory Out of memory.  (Yes, this
	 /// method can return an out-of-memory exception because two images
	 /// will exist temporarily in memory during this call.)
	 ///
	 /// The contents of the image is unaffected."

	self ffiCall: #(void nu_noise_utils_Image_ReclaimMem(nu_noise_utils_Image* self))
]

{ #category : 'public' }
NuImage >> setBorderValue: borderValue [
	"/// Sets the color value to use for all positions outside of the
	 /// image.
	 ///
	 /// @param borderValue The color value to use for all positions
	 /// outside of the image.
	 ///
	 /// All positions outside of the image are assumed to have a common
	 /// color value known as the <i>border value</i>."

	self ffiCall: #(void nu_noise_utils_Image_SetBorderValue(nu_noise_utils_Image* self, nu_noise_utils_Color* borderValue))
]

{ #category : 'public' }
NuImage >> setSizeWidth: width height: height [
	"/// Sets the new size for the image.
	 ///
	 /// @param width The new width for the image.
	 /// @param height The new height for the image.
	 ///
	 /// @pre The width and height values are positive.
	 /// @pre The width and height values do not exceed the maximum
	 /// possible width and height for the image.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions.
	 /// @throw noise::ExceptionOutOfMemory Out of memory.
	 ///
	 /// On exit, the contents of the image are undefined.
	 ///
	 /// If the @a OUT_OF_MEMORY exception occurs, this image becomes
	 /// empty.
	 ///
	 /// If the @a INVALID_PARAM exception occurs, the image is unmodified."

	self ffiCall: #(void nu_noise_utils_Image_SetSize(nu_noise_utils_Image* self, int width, int height))
]

{ #category : 'public' }
NuImage >> setValueX: x y: y value: value [
	"/// Sets a color value at a specified position in the image.
	 ///
	 /// @param x The x coordinate of the position.
	 /// @param y The y coordinate of the position.
	 /// @param value The color value to set at the given position.
	 ///
	 /// This method does nothing if the image is empty or the position is
	 /// outside the bounds of the image."

	self ffiCall: #(void nu_noise_utils_Image_SetValue(nu_noise_utils_Image* self, int x, int y, nu_noise_utils_Color* value))
]

{ #category : 'public' }
NuImage >> takeOwnership: source [
	"/// Takes ownership of the buffer within the source image.
	 ///
	 /// @param source The source image.
	 ///
	 /// On exit, the source image object becomes empty.
	 ///
	 /// This method only moves the buffer pointer so this method is very
	 /// quick."

	self ffiCall: #(void nu_noise_utils_Image_TakeOwnership(nu_noise_utils_Image* self, nu_noise_utils_Image* source))
]
