"
/// Windows bitmap image writer class.
    ///
    /// This class creates a file in Windows bitmap (*.bmp) format given the
    /// contents of an image object.
    ///
    /// <b>Writing the image</b>
    ///
    /// To write the image to a file, perform the following steps:
    /// - Pass the filename to the SetDestFilename() method.
    /// - Pass an Image object to the SetSourceImage() method.
    /// - Call the WriteDestFile() method.
    ///
    /// The SetDestFilename() and SetSourceImage() methods must be called
    /// before calling the WriteDestFile() method.
"
Class {
	#name : 'NuWriterBMP',
	#superclass : 'NuBaseObject',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
NuWriterBMP class >> new [

	^ (self writerBMP_new) initialize
]

{ #category : 'private' }
NuWriterBMP class >> writerBMP_new [
	"/// Constructor."

	self ffiCall: #(nu_noise_utils_WriterBMP* nu_noise_utils_WriterBMP_new())
]

{ #category : 'finalizing' }
NuWriterBMP >> dispose [

	self ffiCall: #(void nu_noise_utils_WriterBMP_dispose(nu_noise_utils_WriterBMP* self))
]

{ #category : 'public' }
NuWriterBMP >> getDestFilename [
	"/// Returns the name of the file to write.
	 ///
	 /// @returns The name of the file to write."

	self ffiCall: #(char* nu_noise_utils_WriterBMP_GetDestFilename(nu_noise_utils_WriterBMP* self))
]

{ #category : 'public' }
NuWriterBMP >> setDestFilename: filename [
	"/// Sets the name of the file to write.
	 ///
	 /// @param filename The name of the file to write.
	 ///
	 /// Call this method before calling the WriteDestFile() method."

	self ffiCall: #(void nu_noise_utils_WriterBMP_SetDestFilename(nu_noise_utils_WriterBMP* self, char* filename))
]

{ #category : 'public' }
NuWriterBMP >> setSourceImage: sourceImage [
	"/// Sets the image object that is written to the file.
	 ///
	 /// @param sourceImage The image object to write.
	 ///
	 /// This object only stores a pointer to an image object, so make sure
	 /// this object exists before calling the WriteDestFile() method."

	self ffiCall: #(void nu_noise_utils_WriterBMP_SetSourceImage(nu_noise_utils_WriterBMP* self, nu_noise_utils_Image* sourceImage))
]

{ #category : 'public' }
NuWriterBMP >> writeDestFile [
	"/// Writes the contents of the image object to the file.
	 ///
	 /// @pre SetDestFilename() has been previously called.
	 /// @pre SetSourceImage() has been previously called.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions.
	 /// @throw noise::ExceptionOutOfMemory Out of memory.
	 /// @throw noise::ExceptionUnknown An unknown exception occurred.
	 /// Possibly the file could not be written.
	 ///
	 /// This method encodes the contents of the image and writes it to a
	 /// file.  Before calling this method, call the SetSourceImage()
	 /// method to specify the image, then call the SetDestFilename()
	 /// method to specify the name of the file to write."

	self ffiCall: #(void nu_noise_utils_WriterBMP_WriteDestFile(nu_noise_utils_WriterBMP* self))
]
