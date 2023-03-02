Class {
	#name : #TROptimizationPass,
	#superclass : #Object,
	#instVars : [
		'compilation'
	],
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #'instance creation' }
TROptimizationPass class >> forCompilation: aTRCompilation [
	^ self basicNew initializeWithCompilation: aTRCompilation
]

{ #category : #'instance creation' }
TROptimizationPass class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #initialization }
TROptimizationPass >> initializeWithCompilation: aTRCompilation [
	compilation := aTRCompilation.
]

{ #category : #optimizing }
TROptimizationPass >> run [
	^ self subclassResponsibility
]
