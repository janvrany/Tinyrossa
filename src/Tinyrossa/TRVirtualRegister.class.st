Class {
	#name : #TRVirtualRegister,
	#superclass : #AcDSLSymbol,
	#instVars : [
		'codegen',
		'kind',
		'assigned',
		'allocation',
		'spill',
		'spilled'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRVirtualRegister class >> named: aString kind: aTRRegisterKind codeGenerator: aTRCodeGenerator [       
	^ self basicNew initializeWithName: aString kind: aTRRegisterKind codeGenerator: aTRCodeGenerator
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

{ #category : #initialization }
TRVirtualRegister >> initializeWithName: aString kind: aTRRegisterKind codeGenerator: aTRCodeGenerator [
	codegen := aTRCodeGenerator.
	value := aString.
	kind := aTRRegisterKind.
	assigned := false.
]

{ #category : #testing }
TRVirtualRegister >> isAssigned [
	^ assigned
]

{ #category : #testing }
TRVirtualRegister >> isTRRegister [
	^ true
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
