Class {
	#name : #TRCompilationConfig,
	#superclass : #Object,
	#instVars : [
		'target'
	],
	#category : #'Tinyrossa-Compile'
}

{ #category : #'instance creation' }
TRCompilationConfig class >> forTarget: aTRCompilationTarget [
	^ self basicNew initializeWithTarget: aTRCompilationTarget
]

{ #category : #'instance creation' }
TRCompilationConfig class >> new [
	self shouldNotImplement. "Use #forConfig:"
]

{ #category : #options }
TRCompilationConfig >> codeGeneratorClass [
	^ target codeGeneratorClass
]

{ #category : #initialization }
TRCompilationConfig >> initializeWithTarget: aTRCompilationTarget [
	target := aTRCompilationTarget
]

{ #category : #options }
TRCompilationConfig >> linkageClass [
	^ target systemLinkageClass
]

{ #category : #options }
TRCompilationConfig >> registerAllocatorClass [
	^ TRLinearScanRegisterAllocator
]
