Class {
	#name : #TRVirtualRegister,
	#superclass : #AcDSLSymbol,
	#instVars : [
		'kind',
		'constraints',
		'assigned',
		'allocation'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRVirtualRegister class >> named: aString [
	^ self basicNew initializeWithName: aString
]

{ #category : #'instance creation' }
TRVirtualRegister class >> named: aString kind: aTRRegisterKind [         
	^ self basicNew initializeWithName: aString kind: aTRRegisterKind
]

{ #category : #arithmetic }
TRVirtualRegister >> + offset [
	^ AcDSLMemRef base: self offset: offset asAcDSLOperand
]

{ #category : #arithmetic }
TRVirtualRegister >> - offset [
	^ AcDSLMemRef base: self offset: offset negated asAcDSLOperand
]

{ #category : #accessing }
TRVirtualRegister >> allocation [
	^ allocation
]

{ #category : #accessing }
TRVirtualRegister >> allocation: realReg [
	self assert: allocation isNil.
	self assert: (realReg isKindOf: TRRealRegister).
	self assert: kind == realReg kind.

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

{ #category : #queries }
TRVirtualRegister >> hasConstraints [
	^ constraints notNil and: [ constraints notEmpty ]
]

{ #category : #initialization }
TRVirtualRegister >> initializeWithName: aString kind: aTRRegisterKind [
	value := aString.
	kind := aTRRegisterKind.
	assigned := false.
]

{ #category : #testing }
TRVirtualRegister >> isAssigned [
	^ assigned
]

{ #category : #testing }
TRVirtualRegister >> isTRVirtualRegister [
	^ true
]

{ #category : #accessing }
TRVirtualRegister >> kind [
	^ kind
]

{ #category : #accessing }
TRVirtualRegister >> name [
	^ value
]

{ #category : #'printing & storing' }
TRVirtualRegister >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut:$(.
	value printOn:aStream.
	allocation notNil ifTrue: [ 
		aStream nextPutAll: ' -> '.
		allocation printOn: aStream.
	].
	aStream nextPut:$).
]

{ #category : #initialization }
TRVirtualRegister >> setAssigned [
	" self assert: assigned == false description: 'Attempting to assign into virtual register twice!'."

	assigned := true.
]

{ #category : #conversion }
TRVirtualRegister >> toBitVector: length [
	allocation notNil ifTrue: [ ^ allocation toBitVector: length ].
	^ value toBitVector: length
]

{ #category : #conversion }
TRVirtualRegister >> toInt [
	allocation notNil ifTrue: [ ^ allocation toInt ].
	^ value toInt
]
