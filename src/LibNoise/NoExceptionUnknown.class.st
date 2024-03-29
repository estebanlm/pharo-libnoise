"
/// Unknown exception
  ///
  /// libnoise raised an unknown exception.
"
Class {
	#name : 'NoExceptionUnknown',
	#superclass : 'NoException',
	#category : 'LibNoise-Noise',
	#package : 'LibNoise',
	#tag : 'Noise'
}

{ #category : 'finalizing' }
NoExceptionUnknown >> dispose [

	self ffiCall: #(void no_noise_ExceptionUnknown_dispose(no_noise_ExceptionUnknown* self))
]
