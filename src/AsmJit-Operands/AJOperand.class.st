"
I am a generic operand used in the ASMJit assembler.
I define the interface for setting the final instruction code and annotations.
"
Class {
	#name : #AJOperand,
	#superclass : #Object,
	#instVars : [
		'data',
		'compilerData',
		'operandId',
		'x64padding',
		'annotation'
	],
	#pools : [
		'AJConstants'
	],
	#category : #'AsmJit-Operands'
}

{ #category : #visiting }
AJOperand >> accept: aVisitor [
	^ aVisitor visitOperand: self
]

{ #category : #accessing }
AJOperand >> annotation [
	^ annotation
]

{ #category : #accessing }
AJOperand >> annotation: anObject [
	annotation := anObject
]

{ #category : #converting }
AJOperand >> asAJOperand [
	"receiver is already an operand. no nothing"
]

{ #category : #'error handling' }
AJOperand >> assert: aBlock description: aStringOrBlock [
	self flag: 'Unless AssertionFailure becomes an instance of Error we have to add this code. Pharo will catch up soon'.

	aBlock value
		ifFalse: [ Error signal: aStringOrBlock value ]
]

{ #category : #asserting }
AJOperand >> assertFitsIn: anOperand [
	^ self assertFitsInSize: anOperand size
]

{ #category : #asserting }
AJOperand >> assertFitsInSize: size [
	self
		assert: (self fitsInSize: size)
		description: [ String streamContents: [ :s |
			s
				<< 'Expected operand <= ';
				print: size * 8; << 'bit';
				<< ' but got '.
			self printBitSizeOn: s.
			s
				space;
				print: self ]].
]

{ #category : #asserting }
AJOperand >> assertMinimumSize: size [
	self
		assert: (self fitsInSize: size - 1) not
		description:  [ String streamContents: [ :s |
			s
				<< 'Expected operand >= ';
				print: size * 8; << 'bit, but got '.
			self printBitSizeOn: s.
			s
				space;
				print: self ]]
]

{ #category : #asserting }
AJOperand >> assertSameSize: anOperand [
	self
		assert: self size = anOperand size
		description: [ String streamContents: [ :s |
			s
				<< 'Expected same size operands, but got '.
			self printBitSizeOn: s.
			s
				space;
				print: self;
				<< ' and '.

			anOperand printBitSizeOn: s.
			s
				space;
				print: anOperand ]].
]

{ #category : #asserting }
AJOperand >> assertSmallerThan: anOperand [
	^ self assertFitsInSize: anOperand size - 1
]

{ #category : #accessing }
AJOperand >> clearId [
	operandId := 0.
]

{ #category : #accessing }
AJOperand >> compilerData [
	^ compilerData
]

{ #category : #'double dispatch' }
AJOperand >> emitOn: anInstruction [
	self subclassResponsibility
]

{ #category : #'double dispatch' }
AJOperand >> emitOn: anInstruction immediate: anImmediateOperand [
	^ self subclassResponsibility
]

{ #category : #'double dispatch' }
AJOperand >> emitOn: anInstruction memory: aMemoryOperand [
	^ self subclassResponsibility
]

{ #category : #'double dispatch' }
AJOperand >> emitOn: anInstruction register: aRegister [
	self shouldBeImplemented.
]

{ #category : #'double dispatch' }
AJOperand >> emitOn: anInstruction with: anOperand [
	self shouldBeImplemented.
]

{ #category : #labels }
AJOperand >> extractLabels: aBlock [
	" do nothing"
]

{ #category : #testing }
AJOperand >> fitsInSize: aWordSize [
	self size
		ifNil: [ ^ true ].

	^ self size <= aWordSize
]

{ #category : #testing }
AJOperand >> hasUpperBankIndex [
	"True iff I have an index register, and it is one of r8-r15"

	^ false	"Only can be true for memory references."
]

{ #category : #testing }
AJOperand >> is16 [
	^ self size == 2
]

{ #category : #testing }
AJOperand >> is32 [
	^ self size == 4
]

{ #category : #testing }
AJOperand >> is64 [
	^ self size == 8
]

{ #category : #testing }
AJOperand >> is8 [
	^ self size == 1
]

{ #category : #testing }
AJOperand >> isImmediate [

	^ false
]

{ #category : #testing }
AJOperand >> isLabel [

	^ false
]

{ #category : #testing }
AJOperand >> isMem [
	self flag: 'use the more readable isMemory instead'.
	^ self isMemory
]

{ #category : #testing }
AJOperand >> isMemory [

	^ false
]

{ #category : #testing }
AJOperand >> isNone [
	"Return true if operand is none (OP_NONE)."
	self shouldBeImplemented
]

{ #category : #testing }
AJOperand >> isReadyToEmit [
	^true
]

{ #category : #testing }
AJOperand >> isRegIndex: aRegIndex [

	^ false
]

{ #category : #testing }
AJOperand >> isRegister [

	^ false
]

{ #category : #testing }
AJOperand >> isRegisterOrMemory [

	^ false
]

{ #category : #testing }
AJOperand >> isRegisterType: aRegType [

	^ self isRegister and: [self type == aRegType]
]

{ #category : #testing }
AJOperand >> isRip [
	^ false
]

{ #category : #accessing }
AJOperand >> operandId [
	^ operandId
]

{ #category : #printing }
AJOperand >> printAnnotationOn: aStream [
	annotation ifNil: [ ^ self ].
	aStream
		nextPut: $" ;
		nextPutAll: annotation asString;
		nextPut: $";  space.
]

{ #category : #printing }
AJOperand >> printAsOperandOn: aStream [
	self printAnnotationOn: aStream.
	^ self printOn: aStream
]

{ #category : #printing }
AJOperand >> printBitSizeOn: aStream [
	self size ifNil: [ ^ aStream << '??bit' ].
	aStream print: self size * 8; << 'bit'.
]

{ #category : #converting }
AJOperand >> ptr [

	"turn receiver into a memory operand "

	self subclassResponsibility
]

{ #category : #converting }
AJOperand >> ptr16 [

	"turn receiver into a memory operand with receiver as base,
	with 2 bytes size"

	^ self ptr size: 2
]

{ #category : #converting }
AJOperand >> ptr32 [

	"turn receiver into a memory operand with receiver as base,
	with 4 bytes size"

	^ self ptr size: 4
]

{ #category : #converting }
AJOperand >> ptr64 [

	"turn receiver into a memory operand with receiver as base,
	with 8 bytes size"

	^ self ptr size: 8
]

{ #category : #converting }
AJOperand >> ptr8 [

	"turn receiver into a memory operand with receiver as base,
	with 1 byte size"

	^ self ptr size: 1
]

{ #category : #accessing }
AJOperand >> size [
	"Return size of operand in bytes."

	self shouldBeImplemented
]

{ #category : #accessing }
AJOperand >> size16 [
	^ self size: 2
]

{ #category : #accessing }
AJOperand >> size32 [
	^ self size: 4
]

{ #category : #accessing }
AJOperand >> size64 [
	^ self size: 8
]

{ #category : #accessing }
AJOperand >> size8 [
	^ self size: 1
]

{ #category : #accessing }
AJOperand >> stackSize [
	^ self size
]

{ #category : #validation }
AJOperand >> validateIn: anObject [
	^ anObject validateOperand: self
]
