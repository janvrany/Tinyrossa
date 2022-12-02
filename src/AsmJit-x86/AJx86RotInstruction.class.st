"
I am the general superclass for the x86 ROT instruction group for bit rotation.
"
Class {
	#name : #AJx86RotInstruction,
	#superclass : #AJx86NewInstruction,
	#instVars : [
		'opCodeR'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86RotInstruction class >> arity [
	^ 2 to: 2
]

{ #category : #accessing }
AJx86RotInstruction class >> group [
	^ #rot
]

{ #category : #testing }
AJx86RotInstruction class >> isAbstract [
	^ self == AJx86RotInstruction
]

{ #category : #'code generation' }
AJx86RotInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCodeR := description opCodeR.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86RotInstruction >> emitMemory: memory immediate: immediate [
	^ self emitRegisterOrMemory: memory immediate: immediate
]

{ #category : #'code generation' }
AJx86RotInstruction >> emitMemory: memory register: sourceRegister [
	^ self emitRegisterOrMemory: memory register: sourceRegister
]

{ #category : #'code generation' }
AJx86RotInstruction >> emitRegister: register immediate: immediate [
	^ self emitRegisterOrMemory: register immediate: immediate
]

{ #category : #'code generation' }
AJx86RotInstruction >> emitRegister: register register: sourceRegister [
	^ self emitRegisterOrMemory: register register: sourceRegister
]

{ #category : #'code generation' }
AJx86RotInstruction >> emitRegisterOrMemory: registerOrMemory immediate: immediate [
	| opCode useByteImmediate |

	immediate assertFitsInSize: 1.

	useByteImmediate := (immediate value ~= 1) or: [ immediate isRelocation ].

	opCode := useByteImmediate
		ifTrue: [ 16rC0 ] ifFalse: [ 16rD0 ].
	registerOrMemory is8
		ifFalse: [ opCode := opCode bitOr: 1 ].

	self
		emitX86RM: opCode
		size: registerOrMemory size
		registerOrCode: self opCodeR
		rm: registerOrMemory.

	useByteImmediate
		ifTrue: [ immediate emitUsing: self size: 1 ]
]

{ #category : #'code generation' }
AJx86RotInstruction >> emitRegisterOrMemory: registerOrMemory register: register [
	| opCode |

	register assertCL.

	opCode := 16rD0 + 2r10.
	registerOrMemory is8 ifFalse: [
		opCode := opCode bitOr: 1 ].

	self
		emitX86RM: opCode
		size: registerOrMemory size
		registerOrCode: self opCodeR
		rm: registerOrMemory.
]

{ #category : #accessing }
AJx86RotInstruction >> opCodeR [
	^ opCodeR
]
