Class {
	#name : 'NoNoiseQuality',
	#superclass : 'NoEnumeration',
	#classVars : [
		'QUALITY_BEST',
		'QUALITY_FAST',
		'QUALITY_STD'
	],
	#category : 'LibNoise-Noise',
	#package : 'LibNoise',
	#tag : 'Noise'
}

{ #category : 'accessing enum' }
NoNoiseQuality class >> QUALITY_BEST [
	"This method was automatically generated"
	^ QUALITY_BEST
]

{ #category : 'accessing enum' }
NoNoiseQuality class >> QUALITY_FAST [
	"This method was automatically generated"
	^ QUALITY_FAST
]

{ #category : 'accessing enum' }
NoNoiseQuality class >> QUALITY_STD [
	"This method was automatically generated"
	^ QUALITY_STD
]

{ #category : 'enum declaration' }
NoNoiseQuality class >> enumDecl [

	^ #(
	QUALITY_FAST 0
	QUALITY_STD 1
	QUALITY_BEST 2 )
]
