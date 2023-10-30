Class {
	#name : #TRRegisterAllocator,
	#superclass : #Object,
	#instVars : [
		'codegen'
	],
	#category : #'Tinyrossa-Codegen-Register Allocation'
}

{ #category : #defaults }
TRRegisterAllocator class >> defaultClass [
	^ TRReverseLinearScanRegisterAllocator
]

{ #category : #'instance creation' }
TRRegisterAllocator class >> forCodeGenerator: aTRCodeGenerator [
	^ self basicNew initializeWithCodeGenerator: aTRCodeGenerator
]

{ #category : #'instance creation' }
TRRegisterAllocator class >> new [
	self shouldNotImplement. "Use #forCodeGenerator:"
]

{ #category : #allocation }
TRRegisterAllocator >> allocateRegisters [
	^ self subclassResponsibility
]

{ #category : #initialization }
TRRegisterAllocator >> initializeWithCodeGenerator: aTRCodeGenerator [
	codegen := aTRCodeGenerator
]
