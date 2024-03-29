Class {
	#name : 'NoModelNamespace',
	#superclass : 'Object',
	#traits : 'LibTNoise',
	#classTraits : 'LibTNoise classTrait',
	#category : 'LibNoise-Model',
	#package : 'LibNoise',
	#tag : 'Model'
}

{ #category : 'accessing' }
NoModelNamespace class >> cppHeader [

	^ 'noise_bindings.h'
]

{ #category : 'accessing' }
NoModelNamespace class >> cppName [

	^ 'noise::model'
]

{ #category : 'accessing' }
NoModelNamespace class >> cppPrefix [

	^ 'no'
]

{ #category : 'accessing' }
NoModelNamespace class >> typedef [

	^ NoNoiseTypedef
]
