Class {
	#name : #TRRuntime,
	#superclass : #Object,
	#instVars : [
		'config'
	],
	#category : #'Tinyrossa-Runtime'
}

{ #category : #'instance creation' }
TRRuntime class >> forConfig: aTRRuntimeConfig [
	^ self basicNew initializeWithConfig: aTRRuntimeConfig
]

{ #category : #'instance creation' }
TRRuntime class >> forTarget: aTRCompilationTarget [
	^ self forConfig: (TRRuntimeConfig forTarget: aTRCompilationTarget)
]

{ #category : #'instance creation' }
TRRuntime class >> new [
	self shouldNotImplement. "Use #forConfig:"
]

{ #category : #accessing }
TRRuntime >> config [
	^ config
]

{ #category : #initialization }
TRRuntime >> initializeWithConfig: aTRRuntimeConfig [
	config := aTRRuntimeConfig.
]

{ #category : #accessing }
TRRuntime >> target [
	^ config target
]
