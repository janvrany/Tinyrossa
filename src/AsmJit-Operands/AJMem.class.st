"
I am memory operand used in assembly instructions. I can be created from an immedate or a register.

Memory operands are used to read values indirectly from memory using certain offsets.

Example:
	asm := AJx86Assembler new.

	""create an memory operand on the address 1234""
	1234 asImm ptr

	""create a simple memory operand with RAX as base""
	asm RAX ptr.

	""the same with a 8 byte offset""
	asm RAX ptr + 8
"
Class {
	#name : #AJMem,
	#superclass : #AJOperand,
	#instVars : [
		'size',
		'base',
		'index',
		'shift',
		'segmentPrefix',
		'hasLabel',
		'target',
		'displacement',
		'ripLabel'
	],
	#category : #'AsmJit-Operands'
}

{ #category : #'instance creation' }
AJMem class >> base: aMemory [
	^ self new
		base: aMemory;
		yourself
]

{ #category : #'instance creation' }
AJMem class >> displacement: anImmediate [
	^ self new
		displacement: anImmediate;
		yourself
]

{ #category : #accessing }
AJMem >> * aScale [
	self scale: aScale
]

{ #category : #accessing }
AJMem >> + displacementOrIndex [

	displacementOrIndex isInteger
		ifTrue: [
			self displacement: (AJImmediate ivalue: displacementOrIndex).
			^ self ].

	displacementOrIndex isGeneralPurpose
		ifTrue: [
			index := displacementOrIndex.
			^ self ].

	 self error: 'Expected integer or general purpose register for memory displacement but got ', displacementOrIndex class name, '.'.
]

{ #category : #accessing }
AJMem >> - aDisplacement [

	aDisplacement isInteger
		ifFalse: [ self error: 'Expected integer for memory displacement but got ', aDisplacement class name, '.' ].
	self displacement: (AJImmediate ivalue: aDisplacement negated).
	^ self
]

{ #category : #visiting }
AJMem >> accept: aVisitor [
	^ aVisitor visitMemory: self
]

{ #category : #conversion }
AJMem >> as16 [
	^ self size: 2
]

{ #category : #conversion }
AJMem >> as32 [
	^ self size: 4
]

{ #category : #conversion }
AJMem >> as64 [
	^ self size: 8
]

{ #category : #conversion }
AJMem >> as8 [
	^ self size: 1
]

{ #category : #accessing }
AJMem >> base [
	"Answer the value of base"

	^ base
]

{ #category : #accessing }
AJMem >> base: anObject [
	"Set the value of base"

	base := anObject
]

{ #category : #accessing }
AJMem >> displacement [
	"Answer the value of displacement"

	^ displacement
]

{ #category : #accessing }
AJMem >> displacement: anImm [
	"Set the value of displacement"
	self assert: anImm isImmediate.
	displacement := anImm
]

{ #category : #emitting }
AJMem >> emit32BitAbsoluteDisplacementModRM: emitter code: rCode [
	self hasIndex
		ifTrue: [
			self assert: index index ~= RIDESP.	" ESP/RSP"
			emitter
				emitMod: 0 reg: rCode rm: 4;
				emitScale: shift index: index index base: 5 ]
		ifFalse: [ emitter emitMod: 0 reg: rCode rm: 5 ].

	self hasLabel
		ifFalse: [
			" Absolute address"
			^ displacement emitUsing: emitter size: 4 ].

	"X86 uses absolute addressing model, all relative addresses will be
	 relocated to absolute ones."
	"target is label"
	target
		addRelocationAt: emitter offset
		displacement: displacement
		absolute: true
		size: 4.
	emitter emitInt32: 0.
]

{ #category : #emitting }
AJMem >> emit64BitAbsoluteDisplacementModRM: emitter code: rCode [
	self flag: 'TODO: deduplicate with the 32bit version'.
	self hasIndex
		ifTrue: [
			self assert: index index ~= RIDESP.	" ESP/RSP"
			emitter
				emitMod: 0 reg: rCode rm: 4;
				emitScale: shift index: index index base: 5 ]
		ifFalse: [
			emitter
				emitMod: 2r00 reg: rCode rm: 2r100;
				emitScale: 2r00 index: 2r100 base: 2r101 ].

	self hasLabel
		ifFalse: [
			" Absolute address"
			^ displacement emitUsing: emitter size: 4 ].

	"X86 uses absolute addressing model, all relative addresses will be
	 relocated to absolute ones."
	"target is label"
	target
		addRelocationAt: emitter offset
		displacement: displacement
		absolute: true
		size: 4.
	emitter emitInt32: 0.
]

{ #category : #emitting }
AJMem >> emitBaseDisplacementModRM: emitter code: rCode [
	| mod |

	self base isRip
		ifTrue: [
			self emitRipModRM: emitter code: rCode.
			^ self ].

	mod := 0.
	displacement isZero
		ifFalse: [
			mod := displacement isInt8 ifTrue: [ 1 ] ifFalse: [ 2 ]].

	self base index == RIDESP
		ifTrue: [
			"ESP/RSP/R12"
			emitter emitMod: mod reg: rCode rm: RIDESP.
			emitter emitScale: 0 index: RIDESP base: RIDESP ]
		ifFalse: [
			(self base index ~= RIDEBP and: [ displacement isZero ])
				ifTrue: [
					"just base, and not EBP/RBP/R13 "
					^ emitter emitMod: 0 reg: rCode rm: base index ].
			"force emitting displacement"
			mod = 0 ifTrue: [ mod := 1 ].
			emitter emitMod: mod reg: rCode rm: base index ].

	mod = 1 ifTrue: [ displacement emitUsing: emitter size: 1 ].
	mod = 2 ifTrue: [ displacement emitUsing: emitter size: 4 ].
]

{ #category : #emitting }
AJMem >> emitModRM: emitter code: rCode [
	"Receiver is memory location. rCode is a register number"

	"[base + displacement]"
	(self hasBase and: [ self hasIndex not ])
		ifTrue: [ ^ self emitBaseDisplacementModRM: emitter code: rCode ].

	"[base + index * scale + displacement]"
	(self hasBase and: [ self hasIndex ])
		ifTrue: [ ^ self emitScaledBaseDisplacementModRM: emitter code: rCode ].

   "Address                       | 32-bit mode | 64-bit mode
   -------------------------------+-------------+---------------
   [displacement]                 |   ABSOLUTE  | RELATIVE (RIP)
   [index * scale + displacement] |   ABSOLUTE  | ABSOLUTE (ZERO EXTENDED)"

	"In 32bit-mode is used absolute addressing model. "
	emitter is32BitMode
		ifTrue: [ ^ self emit32BitAbsoluteDisplacementModRM: emitter code: rCode ].

	"In 64bit-mode a relative addressing model is used together with an absolute
   addressing one. If the instruction contains a SIB byte then relative addressing
   (RIP) is not possible."
	emitter is64BitMode
		ifTrue: [ ^ self emit64BitAbsoluteDisplacementModRM: emitter code: rCode ].

	self invalidInstruction
]

{ #category : #emitting }
AJMem >> emitModRM: emitter code: rCode immSize: immSize [
	^ self emitModRM: emitter code: rCode
]

{ #category : #'double dispatch' }
AJMem >> emitOn: anInstruction [
	^ anInstruction emitMemory: self
]

{ #category : #'double dispatch' }
AJMem >> emitOn: anInstruction immediate: anImmediateOperand [
	^ anInstruction emitImmediate: anImmediateOperand memory: self
]

{ #category : #'double dispatch' }
AJMem >> emitOn: anInstruction memory: aMemoryOperand [
	^ anInstruction emitMemory: aMemoryOperand memory: self
]

{ #category : #'double dispatch' }
AJMem >> emitOn: anInstruction register: aRegister [
	^ anInstruction emitRegister: aRegister memory: self
]

{ #category : #'double dispatch' }
AJMem >> emitOn: anObject register: aRegister with: anOperand [
	^ anObject emitRegister: aRegister memory: self with: anOperand
]

{ #category : #'double dispatch' }
AJMem >> emitOn: anInstruction with: anOperand [
	^ anInstruction emitMemory: self with: anOperand
]

{ #category : #'double dispatch' }
AJMem >> emitOn: anObject with: anOperand1 with: anOperand2 [
	^ anObject emitMemory: self with: anOperand1 with: anOperand2
]

{ #category : #emitting }
AJMem >> emitRipModRM: emitter code: rCode [
	emitter emitMod: 0 reg: rCode rm: 2r101.
	(self ripDisplacementForEmitter: emitter) emitUsing: emitter size: 4
]

{ #category : #emitting }
AJMem >> emitScaledBaseDisplacementModRM: emitter code: rCode [

	self assert: index index ~= RIDESP.
	(base index ~= RIDEBP and: [ displacement isZero ])
		ifTrue: [
			emitter emitMod: 0 reg: rCode rm: 4.
			^ emitter emitScale: shift index: index index base: base index ].

	displacement isInt8
		ifTrue: [
			emitter emitMod: 1 reg: rCode rm: 4.
			emitter emitScale: shift index: index index base: base index.
			displacement emitUsing: emitter size: 1 ]
		ifFalse: [
			emitter emitMod: 2 reg: rCode rm: 4.
			emitter emitScale: shift index: index index base: base index.
			displacement emitUsing: emitter size: 4 ].
	^ self
]

{ #category : #testing }
AJMem >> hasBase [
	^ base notNil
]

{ #category : #testing }
AJMem >> hasIndex [
	^ index notNil
]

{ #category : #accessing }
AJMem >> hasLabel [
	"Answer the value of hasLabel"
	^ false
]

{ #category : #testing }
AJMem >> hasSegmentPrefix [
	^ segmentPrefix notNil
]

{ #category : #testing }
AJMem >> hasUpperBankIndex [
	"True iff I have an index register, and it is one of r8-r15"

	^ self hasIndex and: [ self index isUpperBank ]
]

{ #category : #accessing }
AJMem >> index [
	"Answer the value of index"

	^ index
]

{ #category : #accessing }
AJMem >> index: anIndex [
	"Set the value of index, must be a general purpose register"
	self assert: (anIndex isGeneralPurpose).
	index := anIndex
]

{ #category : #'initialize-release' }
AJMem >> initialize [
	displacement := AJImmediate new.
	shift := 0.
]

{ #category : #testing }
AJMem >> isMemory [
	^ true
]

{ #category : #testing }
AJMem >> isRegisterOrMemory [

	^ true
]

{ #category : #testing }
AJMem >> isRip [
	^ self base isRip
]

{ #category : #testing }
AJMem >> isUpperBank [
	"see `AJBaseReg >> #isUpperBank` "
	self base ifNil: [ ^ false ].
	^ self base isUpperBank
]

{ #category : #printing }
AJMem >> printOn: aStream [
	self printAnnotationOn: aStream.
	aStream nextPutAll: 'mem['.
	base
		ifNotNil: [
			base printAsMemBaseOn: aStream.
			(index isNil and: [ displacement isNil ])
				ifFalse: [ aStream nextPutAll: ' + ' ] ].
	index
		ifNotNil: [
			aStream nextPutAll: index registerName.
			self printScaleOn: aStream.
			displacement ifNotNil: [ aStream nextPutAll: ' + ' ] ].
	displacement ifNotNil: [ aStream print: displacement ].
	aStream nextPut: $]
]

{ #category : #printing }
AJMem >> printScaleOn: aStream [
	aStream nextPutAll: ' * '.
	(2 raisedToInteger: shift) printOn: aStream
]

{ #category : #testing }
AJMem >> prohibitsRex [
	"Answer true if use of this operand requires that the instruction *not* have a REX prefix."

	^ false
]

{ #category : #testing }
AJMem >> requiresRex [
	"Answer true if use of this operand requires that the instruction have a REX prefix.
	For a memory reference, this is true if width of the transfer is 64,
	or if either the base or index register is in the upper bank -- the
	use of a 64-bit base or index register is not enough by itself."

	^ self is64 or: [ (self hasBase and: [ base isUpperBank ]) or: [ self hasIndex and: [ index isUpperBank ] ] ]
]

{ #category : #emitting }
AJMem >> ripDisplacementForEmitter: emitter [
	| labelPos nextInstruction |
	self ripLabel isNil
		ifTrue: [ ^ displacement ].	"Absolute case"
	labelPos := ripLabel position.
	labelPos ifNil: [ self errorUndefinedLabel: ripLabel ].
	nextInstruction := emitter positionAtTheMoment + 4.	"RIP-relative always uses disp32"
	^ AJImmediate ivalue: displacement value + labelPos - nextInstruction	"Label-relative case"
]

{ #category : #accessing }
AJMem >> ripLabel [
	^ ripLabel
]

{ #category : #accessing }
AJMem >> ripLabel: anObject [
	ripLabel := anObject
]

{ #category : #accessing }
AJMem >> scale: aScale [
	"a valid scale values is 1 , 2 , 4 and 8"

	aScale = 1 ifTrue: [  shift := 0. ^ self ].
	aScale = 2 ifTrue: [  shift := 1. ^ self ].
	aScale = 4 ifTrue: [  shift := 2. ^ self ].
	aScale = 8 ifTrue: [  shift := 3. ^ self ].

	self error: 'invalid scale value'
]

{ #category : #accessing }
AJMem >> segmentPrefix [
	"Answer the value of segmentPrefix"

	^ segmentPrefix
]

{ #category : #accessing }
AJMem >> segmentPrefix: anObject [
	"Set the value of segmentPrefix"

	segmentPrefix := anObject
]

{ #category : #accessing }
AJMem >> shift [
	"Answer the value of shift"

	^ shift
]

{ #category : #accessing }
AJMem >> shift: value [
	"Set the value of shift"
	self assert: (value >=0 and: [ value < 4 ]).
	shift := value
]

{ #category : #accessing }
AJMem >> size [

	^ size
]

{ #category : #accessing }
AJMem >> size: anInteger [
	"Size of the memory operand in bytes"
	size := anInteger
]
