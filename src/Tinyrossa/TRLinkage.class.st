Class {
	#name : #TRLinkage,
	#superclass : #Object,
	#instVars : [
		'codegen',
		'generate'
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
TRLinkage >> allocatedPreservedRegisters [
	| allocated |

	allocated := self allocatedRegisters.
	^ self preservedRegisters select: [:e | allocated includes: e ]
]

{ #category : #accessing }
TRLinkage >> allocatedRegisters [
	"Return the set of machine registers that are actually 
	 used (have been assigned by RA)."

	^ codegen virtualRegisters collect: [ :vReg | vReg allocation ]
]

{ #category : #'code generation' }
TRLinkage >> generateCall: node [
	^ self subclassResponsibility
]

{ #category : #'code generation' }
TRLinkage >> generateCallIndirect: node [    
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

{ #category : #'code generation' }
TRLinkage >> generateReturn: node [
	"Generate a TRLeave for given return node (see AcDSLAssembler >> #leave:).

	 If function's linkage return value through register(s), leave pseudo instruction
	 has to have dependencies set appropriately."

	^ self subclassResponsibility
]

{ #category : #initialization }
TRLinkage >> initializeWithCodeGenerator: aTRCodeGenerator [
	codegen := aTRCodeGenerator.
	generate := codegen assembler.
]

{ #category : #mapping }
TRLinkage >> mapStack [
	"Compute frame size and map parameters, automatics 
	 and spills to stack slots."        
	^ self subclassResponsibility
]
