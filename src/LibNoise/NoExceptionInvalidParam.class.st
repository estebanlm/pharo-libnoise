"
/// Invalid parameter exception
  ///
  /// An invalid parameter was passed to a libnoise function or method.
"
Class {
	#name : 'NoExceptionInvalidParam',
	#superclass : 'NoException',
	#category : 'LibNoise-Noise',
	#package : 'LibNoise',
	#tag : 'Noise'
}

{ #category : 'finalizing' }
NoExceptionInvalidParam >> dispose [

	self ffiCall: #(void no_noise_ExceptionInvalidParam_dispose(no_noise_ExceptionInvalidParam* self))
]
