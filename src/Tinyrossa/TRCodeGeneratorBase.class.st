Class {
	#name : #TRCodeGeneratorBase,
	#superclass : #Object,
	#instVars : [
		'compilation',
		'evaluator'
	],
	#pools : [
		'TRRegisterKinds'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRCodeGeneratorBase class >> forCompilation: aTRCompilation [
	^ self basicNew initializeWithCompilation: aTRCompilation
]

{ #category : #'instance creation' }
TRCodeGeneratorBase class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #accessing }
TRCodeGeneratorBase >> compilation [
	^ compilation
]

{ #category : #'instance creation' }
TRCodeGeneratorBase >> createEvaluator [
	^ self evaluatorClass forCodeGenerator: self
]

{ #category : #accessing }
TRCodeGeneratorBase >> evaluator [
	^ evaluator
]

{ #category : #'accessing - config' }
TRCodeGeneratorBase >> evaluatorClass [
	^ self subclassResponsibility
]

{ #category : #initialization }
TRCodeGeneratorBase >> initializeWithCompilation: aTRCompilation [
	compilation := aTRCompilation.
]

{ #category : #accessing }
TRCodeGeneratorBase >> target [
	^ compilation target
]
