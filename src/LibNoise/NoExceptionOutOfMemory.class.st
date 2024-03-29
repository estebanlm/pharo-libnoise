"
/// Out of memory exception
  ///
  /// There was not enough memory to perform an action.
"
Class {
	#name : 'NoExceptionOutOfMemory',
	#superclass : 'NoException',
	#category : 'LibNoise-Noise',
	#package : 'LibNoise',
	#tag : 'Noise'
}

{ #category : 'finalizing' }
NoExceptionOutOfMemory >> dispose [

	self ffiCall: #(void no_noise_ExceptionOutOfMemory_dispose(no_noise_ExceptionOutOfMemory* self))
]
