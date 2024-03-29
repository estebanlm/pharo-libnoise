"
/// Terragen Terrain writer class.
    ///
    /// This class creates a file in Terrage Terrain (*.ter) format given the
    /// contents of a noise map object.  This class treats the values in the
    /// noise map as elevations measured in meters.
    ///
    /// <a href=http://www.planetside.co.uk/terragen/>Terragen</a> is a
    /// terrain application that renders realistic landscapes.  Terragen is
    /// available for Windows and MacOS; unfortunately, Terragen does not have
    /// UN*X versions.
    ///
    /// <b>Writing the noise map</b>
    ///
    /// To write the noise map, perform the following steps:
    /// - Pass the filename to the SetDestFilename() method.
    /// - Pass a NoiseMap object to the SetSourceNoiseMap() method.
    /// - Call the WriteDestFile() method.
    ///
    /// The SetDestFilename() and SetSourceNoiseMap() methods must be called
    /// before calling the WriteDestFile() method.
"
Class {
	#name : 'NuWriterTER',
	#superclass : 'NuBaseObject',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
NuWriterTER class >> new [

	^ (self writerTER_new) initialize
]

{ #category : 'private' }
NuWriterTER class >> writerTER_new [
	"/// Constructor."

	self ffiCall: #(nu_noise_utils_WriterTER* nu_noise_utils_WriterTER_new())
]

{ #category : 'finalizing' }
NuWriterTER >> dispose [

	self ffiCall: #(void nu_noise_utils_WriterTER_dispose(nu_noise_utils_WriterTER* self))
]

{ #category : 'public' }
NuWriterTER >> getDestFilename [
	"/// Returns the name of the file to write.
	 ///
	 /// @returns The name of the file to write."

	self ffiCall: #(char* nu_noise_utils_WriterTER_GetDestFilename(nu_noise_utils_WriterTER* self))
]

{ #category : 'public' }
NuWriterTER >> getMetersPerPoint [
	"/// Returns the distance separating adjacent points in the noise map,
	 /// in meters.
	 ///
	 /// @returns The distance separating adjacent points in the noise map."

	self ffiCall: #(float nu_noise_utils_WriterTER_GetMetersPerPoint(nu_noise_utils_WriterTER* self))
]

{ #category : 'public' }
NuWriterTER >> setDestFilename: filename [
	"/// Sets the name of the file to write.
	 ///
	 /// @param filename The name of the file to write.
	 ///
	 /// Call this method before calling the WriteDestFile() method."

	self ffiCall: #(void nu_noise_utils_WriterTER_SetDestFilename(nu_noise_utils_WriterTER* self, char* filename))
]

{ #category : 'public' }
NuWriterTER >> setMetersPerPoint: metersPerPoint [
	"/// Sets the distance separating adjacent points in the noise map, in
	 /// meters.
	 ///
	 /// @param metersPerPoint The distance separating adjacent points in
	 /// the noise map."

	self ffiCall: #(void nu_noise_utils_WriterTER_SetMetersPerPoint(nu_noise_utils_WriterTER* self, float metersPerPoint))
]

{ #category : 'public' }
NuWriterTER >> setSourceNoiseMap: sourceNoiseMap [
	"/// Sets the noise map object that is written to the file.
	 ///
	 /// @param sourceNoiseMap The noise map object to write.
	 ///
	 /// This object only stores a pointer to a noise map object, so make
	 /// sure this object exists before calling the WriteDestFile() method."

	self ffiCall: #(void nu_noise_utils_WriterTER_SetSourceNoiseMap(nu_noise_utils_WriterTER* self, nu_noise_utils_NoiseMap* sourceNoiseMap))
]

{ #category : 'public' }
NuWriterTER >> writeDestFile [
	"/// Writes the contents of the noise map object to the file.
	 ///
	 /// @pre SetDestFilename() has been previously called.
	 /// @pre SetSourceNoiseMap() has been previously called.
	 ///
	 /// @throw noise::ExceptionInvalidParam See the preconditions.
	 /// @throw noise::ExceptionOutOfMemory Out of memory.
	 /// @throw noise::ExceptionUnknown An unknown exception occurred.
	 /// Possibly the file could not be written.
	 ///
	 /// This method encodes the contents of the noise map and writes it to
	 /// a file.  Before calling this method, call the SetSourceNoiseMap()
	 /// method to specify the noise map, then call the SetDestFilename()
	 /// method to specify the name of the file to write.
	 ///
	 /// This object assumes that the noise values represent elevations in
	 /// meters."

	self ffiCall: #(void nu_noise_utils_WriterTER_WriteDestFile(nu_noise_utils_WriterTER* self))
]
