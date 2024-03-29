Class {
	#name : 'NuUtilsNamespace',
	#superclass : 'Object',
	#traits : 'LibTNoiseutils',
	#classTraits : 'LibTNoiseutils classTrait',
	#category : 'LibNoiseutils-Utils',
	#package : 'LibNoiseutils',
	#tag : 'Utils'
}

{ #category : 'accessing' }
NuUtilsNamespace class >> cppHeader [

	^ 'noiseutils_bindings.h'
]

{ #category : 'accessing' }
NuUtilsNamespace class >> cppName [

	^ 'noise::utils'
]

{ #category : 'accessing' }
NuUtilsNamespace class >> cppPrefix [

	^ 'nu'
]

{ #category : 'accessing' }
NuUtilsNamespace class >> typedef [

	^ NuNoiseutilsTypedef
]
