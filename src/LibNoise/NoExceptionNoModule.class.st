"
/// No module exception
  ///
  /// Could not retrieve a source module from a noise module.
  ///
  /// @note If one or more required source modules were not connected to a
  /// specific noise module, and its GetValue() method was called, that
  /// method will raise a debug assertion instead of this exception.  This
  /// is done for performance reasons.
"
Class {
	#name : 'NoExceptionNoModule',
	#superclass : 'NoException',
	#category : 'LibNoise-Noise',
	#package : 'LibNoise',
	#tag : 'Noise'
}

{ #category : 'finalizing' }
NoExceptionNoModule >> dispose [

	self ffiCall: #(void no_noise_ExceptionNoModule_dispose(no_noise_ExceptionNoModule* self))
]
