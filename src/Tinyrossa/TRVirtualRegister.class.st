Class {
	#name : #TRVirtualRegister,
	#superclass : #AcDSLOperand,
	#instVars : [
		'name',
		'constraints',
		'allocation'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRVirtualRegister class >> named: aString [
	^ self basicNew initializeWithName: aString
]

{ #category : #accessing }
TRVirtualRegister >> allocation: realReg [
	self assert: allocation isNil.
	self assert: (realReg isKindOf: AcDSLRegister).

	allocation := realReg
]

{ #category : #constraints }
TRVirtualRegister >> constrainTo: reg [ 
	"
	Ensure this virtual register maps to `reg`.
	"
	self assert: (reg isKindOf: AcDSLRegister).

	constraints isNil ifTrue: [ constraints := Dictionary new ].
	constraints at: nil put: reg.
]

{ #category : #constraints }
TRVirtualRegister >> constrainTo: reg atInstruction: insn [
	"
	Ensure this virtual register maps to `reg` for instruction `insn`.
	"
	self assert: (reg isKindOf: AcDSLRegister).
	self assert: (insn isKindOf: ProcessorInstruction).

	constraints isNil ifTrue: [ constraints := Dictionary new ].
	constraints at: insn put: reg.
]

{ #category : #constraints }
TRVirtualRegister >> constraints [
	constraints isNil ifTrue: [ ^ Dictionary new ].
	^ constraints
]

{ #category : #initialization }
TRVirtualRegister >> initializeNamed: arg [
	"Invoked when a new instance is created for arg."

	"  please change as required (and remove these comments)"
	"  do something with arg here (instVar-foo := arg)"
	"  name := nil."

	"  super initialize.   -- commented since inherited method does nothing"
]

{ #category : #initialization }
TRVirtualRegister >> initializeWithName: aString [
	name := aString
]

{ #category : #testing }
TRVirtualRegister >> isTRVirtualRegister [
	^ true
]

{ #category : #accessing }
TRVirtualRegister >> name [
	^ name
]

{ #category : #'printing & storing' }
TRVirtualRegister >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut:$(.
	name printOn:aStream.
	allocation notNil ifTrue: [ 
		aStream nextPutAll: ' -> '.
		allocation printOn: aStream.
	].
	aStream nextPut:$).
]

{ #category : #conversion }
TRVirtualRegister >> toBitVector: length [
	allocation notNil ifTrue: [ ^ allocation toBitVector: length ].
	^ name toBitVector: length
]

{ #category : #conversion }
TRVirtualRegister >> toInt [
	allocation notNil ifTrue: [ ^ allocation toInt ].
	^ name toInt
]
