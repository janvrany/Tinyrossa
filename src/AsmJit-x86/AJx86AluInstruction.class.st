"
I am the general superclass for the x86 ALU instruction group.
"
Class {
	#name : #AJx86AluInstruction,
	#superclass : #AJx86NewInstruction,
	#instVars : [
		'opCode',
		'opCode2',
		'opCodeRegister'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86AluInstruction class >> arity [
	^ 2 to: 2
]

{ #category : #accessing }
AJx86AluInstruction class >> group [
	^ #alu
]

{ #category : #testing }
AJx86AluInstruction class >> isAbstract [
	^ self == AJx86AluInstruction
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCode := description opCode1.
		opCode2 := description opCode2.
		opCodeRegister := description opCodeR.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitMemory: memory immediate: immediate [
	^ self emitRegisterMemory: memory immediate: immediate
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitMemory: memory register: register [
	^ self
		emitX86RM: self opCode
		nonByteOffsetOperand: register
		size: register size
		registerOrCode: register
		rm: memory
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitRegister: register immediate: immediate [
	register index = 0
		ifTrue: [ ^ self emitShortFirstRegister: register immediate: immediate ].
	(immediate isSigned and: [ immediate isInt8 ])
		ifTrue: [ ^ self emitShortRegister: register immediate: immediate ].
	^ self emitRegisterMemory: register immediate: immediate
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitRegister: register memory: memory [
	^ self emitRegister: register registerMemory: memory
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitRegister: register register: operandRegister [
	register assertSameSize: operandRegister.
	^ self emitRegister: register registerMemory: operandRegister
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitRegister: register registerMemory: registerOrMemory [

	^ self
		emitX86RM: self opCode + 2
		nonByteOffsetOperand: register
		size: register size
		registerOrCode: register
		rm: registerOrMemory
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitRegisterMemory: registerOrMemory immediate: immediate [
	| immediateSize szBits |

	immediateSize := registerOrMemory size min: 4.

	szBits := registerOrMemory size ~= 1
		ifTrue: [ immediateSize ~= 1 ifTrue: [ 1 ] ifFalse: [ 3 ]]
		ifFalse: [ 0 ].

	self
		emitX86RM: self opCode2 + szBits
		size: registerOrMemory size
		registerOrCode: self opCodeRegister
		rm: registerOrMemory.

	^ self emitImmediate: immediate size: immediateSize.
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitShortFirstRegister: register immediate: immediate [

	register is16 ifTrue: [ self emit16BitPrefix ].
	register is64 ifTrue: [ self emit64BitRexPrefix ].

	self emitByte: (self opCodeRegister << 3 bitOr: (16r04 + register isRegisterGeneralPurposeByte not asBit)).
	^ self emitImmediate: immediate size: (register size min: 4)
]

{ #category : #'code generation' }
AJx86AluInstruction >> emitShortRegister: register immediate: immediate [

	| szBits |

	szBits := register size = 1
		ifTrue: [ 0 ]
		ifFalse: [ 3 ].

	self
		emitX86RM: self opCode2 + szBits
		size: register size
		registerOrCode: self opCodeRegister
		rm: register.

	^ self emitImmediate: immediate size: 1.
]

{ #category : #accessing }
AJx86AluInstruction >> opCode [
	^ opCode
]

{ #category : #accessing }
AJx86AluInstruction >> opCode2 [
	^ opCode2
]

{ #category : #accessing }
AJx86AluInstruction >> opCodeRegister [
	^ opCodeRegister
]
