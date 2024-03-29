Class {
	#name : 'NoNoiseNamespace',
	#superclass : 'Object',
	#traits : 'LibTNoise',
	#classTraits : 'LibTNoise classTrait',
	#category : 'LibNoise-Noise',
	#package : 'LibNoise',
	#tag : 'Noise'
}

{ #category : 'accessing' }
NoNoiseNamespace class >> cppHeader [

	^ 'noise_bindings.h'
]

{ #category : 'accessing' }
NoNoiseNamespace class >> cppName [

	^ 'noise'
]

{ #category : 'accessing' }
NoNoiseNamespace class >> cppPrefix [

	^ 'no'
]

{ #category : 'accessing' }
NoNoiseNamespace class >> typedef [

	^ NoNoiseTypedef
]
