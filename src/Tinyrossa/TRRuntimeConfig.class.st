Class {
	#name : #TRRuntimeConfig,
	#superclass : #Object,
	#instVars : [
		'options'
	],
	#pools : [
		'TRCompilationConfigOptions'
	],
	#category : #'Tinyrossa-Runtime'
}

{ #category : #'instance creation' }
TRRuntimeConfig class >> forTarget: aTRCompilationTarget [
	^ self basicNew initializeWithTarget: aTRCompilationTarget
]

{ #category : #'instance creation' }
TRRuntimeConfig class >> new [
	self shouldNotImplement. "Use #forConfig:"
]

{ #category : #initialization }
TRRuntimeConfig >> initializeWithTarget: aTRCompilationTarget [
	options := Dictionary new.
	options at: OptionTarget put: aTRCompilationTarget
]

{ #category : #options }
TRRuntimeConfig >> target [
	^ options at: OptionTarget ifAbsent: [ self error:'Oops, no target specified!' ]
]
