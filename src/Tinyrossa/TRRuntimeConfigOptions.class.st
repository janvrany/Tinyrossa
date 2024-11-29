Class {
	#name : #TRRuntimeConfigOptions,
	#superclass : #TRSharedPool,
	#classVars : [
		'OptionTarget'
	],
	#category : #'Tinyrossa-Runtime'
}

{ #category : #initialization }
TRRuntimeConfigOptions class >> initialize [

	OptionTarget := #Target.
]
