"
I am an immediate (constant integer) operand used by the assembler.

Example:
	""create an immediate from an integer""
	1 asImm.
	""implicitely use an immediate in an assembly instrution""
	asm := AJx64Assembler new.
	asm add: 1 to: asm RAX.

"
Class {
	#name : #AJImmediate,
	#superclass : #AJOperand,
	#instVars : [
		'label',
		'size',
		'isUnsigned',
		'value',
		'relocationMode'
	],
	#pools : [
		'AJConstants'
	],
	#category : #'AsmJit-Operands'
}

{ #category : #'as yet unclassified' }
AJImmediate class >> ivalue: aValue [
	^ self new
		ivalue: aValue
]

{ #category : #comparing }
AJImmediate >> = other [
	self class = other class
		ifFalse: [ ^ false ].

	^ self value = other value and: [ self isUnsigned = other isUnsigned ]
]

{ #category : #visiting }
AJImmediate >> accept: aVisitor [
	^ aVisitor visitImmediate: self
]

{ #category : #converting }
AJImmediate >> asByte [
	"answer the byte representing a value"
	(self fitsInSize: 1)
		ifFalse: [ Error signal: self asString, ' exceeds byte (8bit) range' ].

	(self isSigned and: [ value < 0 ]) ifTrue: [ ^ (1<<8) + value ].

	^ value
]

{ #category : #converting }
AJImmediate >> asDoubleword [
	"answer the 32bit word representing a value"
	(self fitsInSize: 4)
		ifFalse: [ Error signal: self asString, ' exceeds doubleword (32bit) range' ].

	(self isSigned and: [ value < 0 ]) ifTrue: [ ^ (1<<32) + value ].

	^ value
]

{ #category : #converting }
AJImmediate >> asQuadword [
	"answer the 64bit word representing a value"
	(self fitsInSize: 8)
		ifFalse: [ Error signal: self asString, ' exceeds quadword (64bit) range' ].

	(self isSigned and: [ value < 0 ]) ifTrue: [ ^ (1<<64) + value ].

	^ value
]

{ #category : #converting }
AJImmediate >> asWord [
	"answer the 16bit word representing a value"
	(self fitsInSize: 2)
		ifFalse: [ Error signal: self asString, ' value exceeds word (16bit) range' ].

	(self isSigned and: [ value < 0 ]) ifTrue: [ ^ (1<<16) + value ].

	^ value
]

{ #category : #'double dispatch' }
AJImmediate >> emitOn: anInstruction [
	^ anInstruction emitImmediate: self
]

{ #category : #'double dispatch' }
AJImmediate >> emitOn: anInstruction immediate: anImmediateOperand [
	^ anInstruction emitImmediate: anImmediateOperand immediate: self
]

{ #category : #'double dispatch' }
AJImmediate >> emitOn: anInstruction memory: aMemoryOperand [
	^ anInstruction emitMemory: aMemoryOperand immediate: self
]

{ #category : #'double dispatch' }
AJImmediate >> emitOn: anObject memory: memory register: register [
	^ anObject emitMemory: memory register: register immediate: self
]

{ #category : #'double dispatch' }
AJImmediate >> emitOn: anInstruction register: aRegister [
	^ anInstruction emitRegister: aRegister immediate: self
]

{ #category : #'double dispatch' }
AJImmediate >> emitOn: anObject register: register memory: memory [
	^ anObject emitRegister: register memory: memory immediate: self
]

{ #category : #'double dispatch' }
AJImmediate >> emitOn: anObject register: register1 register: register2 [

	^ anObject emitRegister: register1 register: register2 immediate: self
]

{ #category : #'double dispatch' }
AJImmediate >> emitOn: anInstruction with: anOperand [
	^ anInstruction emitImmediate: self with: anOperand
]

{ #category : #'emitting code' }
AJImmediate >> emitUsing: emitter size: aSize [

	label ifNotNil: [
		"this will set the label offset"
		emitter setLabelPosition: label.
	].

	aSize = 1 ifTrue: [ ^ emitter emitByte: self asByte ].
	aSize = 2 ifTrue: [ ^ emitter emitWord: self asWord ].
	aSize = 4 ifTrue: [ ^ emitter emitDoubleword: self asDoubleword ].
	aSize = 8 ifTrue: [ ^ emitter emitQuadword: self asQuadword ].

	self error: aSize asString, 'bytes is an invalid immediate value size'
]

{ #category : #accessing }
AJImmediate >> extractLabels: aBlock [

	label ifNotNil: [ label extractLabels: aBlock ]
]

{ #category : #testing }
AJImmediate >> fitsInSize: aSize [
	| maxSize |
	maxSize := 1 << (aSize * 8).

	self isUnsigned
		ifTrue: [ ^ maxSize > value ].

	value < 0
		ifTrue: [ ^ 0 - value <= (maxSize >> 1) ].

	^ value < (maxSize>>1)
]

{ #category : #comparing }
AJImmediate >> hash [
	^ self value hash bitXor: self isUnsigned hash
]

{ #category : #'initialize-release' }
AJImmediate >> initialize [
	value := 0.
	isUnsigned := false.
]

{ #category : #testing }
AJImmediate >> isImmediate [
	^ true
]

{ #category : #testing }
AJImmediate >> isInt16 [
	^ size
		ifNil:  [ self fitsInSize: 2 ]
		ifNotNil: [ size = 2 ]
]

{ #category : #testing }
AJImmediate >> isInt32 [
	  ^ value >= -2147483648 and: [ value <= 2147483647 ]

]

{ #category : #testing }
AJImmediate >> isInt8 [
	^ size
		ifNil:  [ self fitsInSize: 1 ]
		ifNotNil: [ size = 1 ]
]

{ #category : #testing }
AJImmediate >> isNoRelocation [
	^ self relocationMode == #RelocNone
]

{ #category : #testing }
AJImmediate >> isRelocation [
	^ self relocationMode ~~ #RelocNone
]

{ #category : #testing }
AJImmediate >> isSigned [
	^ isUnsigned not
]

{ #category : #testing }
AJImmediate >> isUnsigned [
	^ isUnsigned
]

{ #category : #testing }
AJImmediate >> isZero [
	^ value = 0
]

{ #category : #accessing }
AJImmediate >> ivalue: aValue [
	"signed integer value"
	value := aValue.
	isUnsigned := false.
]

{ #category : #accessing }
AJImmediate >> label: aLabelName [

	label := aLabelName
]

{ #category : #printing }
AJImmediate >> printOn: aStream [
	aStream nextPut: $(.

	self printAnnotationOn: aStream.

	value > 1000000
		ifTrue: [ aStream nextPutAll: value hex]
		ifFalse: [ aStream print: value].

	aStream space.

	aStream nextPut: (
		self isSigned ifTrue: [ $i ] ifFalse: [ $u ]).

	size ifNotNil: [ aStream print: size].

	aStream nextPut: $).



]

{ #category : #testing }
AJImmediate >> prohibitsRex [
	"Answer true if use of this operand requires that the instruction *not* have a REX prefix."

	^ false
]

{ #category : #converting }
AJImmediate >> ptr [

	"turn receiver into a memory operand with absolute address == receiver"

	^ AJMem displacement: self
]

{ #category : #accessing }
AJImmediate >> relocationMode [
	^ relocationMode ifNil: [ #RelocNone ]
]

{ #category : #testing }
AJImmediate >> requiresRex [
	"Answer true if use of this operand requires that the instruction have a REX prefix."

	^ false
]

{ #category : #accessing }
AJImmediate >> size [
	^ size
]

{ #category : #accessing }
AJImmediate >> size: aSize [
	size := aSize
]

{ #category : #accessing }
AJImmediate >> sizeFor: anOperand [
	"Check if I am a valid size to be used together with anOperand
	If so, I will use as much size as it"
	self assert: (self fitsInSize: anOperand size).
	^anOperand size
]

{ #category : #accessing }
AJImmediate >> smallestOperandSize [
	#(1 2 4 8) do: [ :operandSize |
		(self fitsInSize: operandSize)
			ifTrue: [ ^ operandSize ]].
	Error signal: 'Should not happen'.
]

{ #category : #accessing }
AJImmediate >> uvalue: aValue [
	"unsigned value"
	self assert: (aValue >=0).
	value := aValue.
	isUnsigned := true.
]

{ #category : #validation }
AJImmediate >> validateIn: anObject [
	^ anObject validateImmediate: self
]

{ #category : #accessing }
AJImmediate >> value [
	^ value
]
