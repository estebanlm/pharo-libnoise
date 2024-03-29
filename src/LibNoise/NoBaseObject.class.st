Class {
	#name : 'NoBaseObject',
	#superclass : 'FFIOpaqueObject',
	#traits : 'LibTNoise',
	#classTraits : 'LibTNoise classTrait',
	#pools : [
		'NoNoiseTypedef'
	],
	#category : 'LibNoise-Base',
	#package : 'LibNoise',
	#tag : 'Base'
}

{ #category : 'finalization' }
NoBaseObject >> autoRelease [
	
	FinalizationRegistry default add: self
]

{ #category : 'finalization' }
NoBaseObject >> dispose [
	
	self subclassResponsibility
]

{ #category : 'finalization' }
NoBaseObject >> finalize [
	
	self dispose.
	handle beNull
]

{ #category : 'initialization' }
NoBaseObject >> initialize [
	"do nothing (prevent initialize to set the handle)"
]
