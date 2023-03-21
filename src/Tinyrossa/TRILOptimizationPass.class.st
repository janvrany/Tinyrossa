Class {
	#name : #TRILOptimizationPass,
	#superclass : #TRILWalker,
	#instVars : [
		'compilation'
	],
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #'instance creation' }
TRILOptimizationPass class >> forCompilation: aTRCompilation [
	^ self basicNew initializeWithCompilation: aTRCompilation
]

{ #category : #'instance creation' }
TRILOptimizationPass class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #initialization }
TRILOptimizationPass >> initializeWithCompilation: aTRCompilation [
	compilation := aTRCompilation.
]

{ #category : #optimizing }
TRILOptimizationPass >> run [
	compilation cfg preorderDo: [ :block | self runOn: block ].
]
