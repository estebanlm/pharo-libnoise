Class {
	#name : 'NoControlPoint',
	#superclass : 'NoStructure',
	#classVars : [
		'OFFSET_INPUTVALUE',
		'OFFSET_OUTPUTVALUE'
	],
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'field definition' }
NoControlPoint class >> fieldsDesc [

	^ #(
	double inputValue;
	double outputValue
	)
]

{ #category : 'accessing - structure variables' }
NoControlPoint >> inputValue [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_INPUTVALUE
]

{ #category : 'accessing - structure variables' }
NoControlPoint >> inputValue: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_INPUTVALUE put: anObject
]

{ #category : 'accessing - structure variables' }
NoControlPoint >> outputValue [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_OUTPUTVALUE
]

{ #category : 'accessing - structure variables' }
NoControlPoint >> outputValue: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_OUTPUTVALUE put: anObject
]
