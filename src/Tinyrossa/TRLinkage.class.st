Class {
	#name : #TRLinkage,
	#superclass : #Object,
	#instVars : [
		'codegen'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRLinkage class >> forCodeGenerator: aTRCodeGenerator [
	^ self basicNew initializeWithCodeGenerator: aTRCodeGenerator
]

{ #category : #accessing }
TRLinkage >> allocatableRegisters [
	"Return an (ordered) list of registers that are available
	 for register allocation - in order of preference"

	^ self subclassResponsibility
]

{ #category : #'code generation' }
TRLinkage >> generateEpilogue: valReg [
	^ self subclassResponsibility
]

{ #category : #'code generation' }
TRLinkage >> generatePrologue [
	self subclassResponsibility
]

{ #category : #initialization }
TRLinkage >> initializeWithCodeGenerator: aTRCodeGenerator [
	codegen := aTRCodeGenerator
]
