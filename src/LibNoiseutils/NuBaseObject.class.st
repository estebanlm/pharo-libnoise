Class {
	#name : 'NuBaseObject',
	#superclass : 'FFIOpaqueObject',
	#traits : 'LibTNoiseutils',
	#classTraits : 'LibTNoiseutils classTrait',
	#pools : [
		'NoNoiseTypedef',
		'NuNoiseutilsTypedef'
	],
	#category : 'LibNoiseutils-Base',
	#package : 'LibNoiseutils',
	#tag : 'Base'
}

{ #category : 'finalization' }
NuBaseObject >> autoRelease [
	
	FinalizationRegistry default add: self
]

{ #category : 'finalization' }
NuBaseObject >> dispose [
	
	self subclassResponsibility
]

{ #category : 'finalization' }
NuBaseObject >> finalize [
	
	self dispose.
	handle beNull
]

{ #category : 'initialization' }
NuBaseObject >> initialize [
	"do nothing (prevent initialize to set the handle)"
]
