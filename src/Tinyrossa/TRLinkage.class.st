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

{ #category : #accessing }
TRLinkage >> allocatedRegisters [
	"Return the set of machine registers that are actually 
	 used (have been assigned by RA)."

	^ codegen virtualRegisters collect: [ :vReg | vReg allocation ]
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

{ #category : #mapping }
TRLinkage >> mapStack [
	"Compute frame size and map parameters, automatics 
	 and spills to stack slots."        
	^ self subclassResponsibility
]
