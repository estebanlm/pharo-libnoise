Class {
	#name : 'NoModuleNamespace',
	#superclass : 'Object',
	#traits : 'LibTNoise',
	#classTraits : 'LibTNoise classTrait',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'accessing' }
NoModuleNamespace class >> cppHeader [

	^ 'noise_bindings.h'
]

{ #category : 'accessing' }
NoModuleNamespace class >> cppName [

	^ 'noise::module'
]

{ #category : 'accessing' }
NoModuleNamespace class >> cppPrefix [

	^ 'no'
]

{ #category : 'accessing' }
NoModuleNamespace class >> typedef [

	^ NoNoiseTypedef
]
