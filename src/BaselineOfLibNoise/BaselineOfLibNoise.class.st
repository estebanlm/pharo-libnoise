Class {
	#name : 'BaselineOfLibNoise',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfLibNoise',
	#package : 'BaselineOfLibNoise'
}

{ #category : 'baselines' }
BaselineOfLibNoise >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		spec package: 'LibNoise'.
		spec package: 'LibNoiseutils' with: [ spec requires: 'LibNoise' ] ]
]
