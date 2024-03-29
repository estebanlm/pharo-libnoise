"
/// Abstract base class for libnoise exceptions
"
Class {
	#name : 'NoException',
	#superclass : 'NoBaseObject',
	#category : 'LibNoise-Noise',
	#package : 'LibNoise',
	#tag : 'Noise'
}

{ #category : 'finalizing' }
NoException >> dispose [

	self ffiCall: #(void no_noise_Exception_dispose(no_noise_Exception* self))
]
