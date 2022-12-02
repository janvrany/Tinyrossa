"
I am the general superclass for the x86 RM instruction group which has as a single parametere a memory or register.
"
Class {
	#name : #AJx86RmInstruction,
	#superclass : #AJx86NewInstruction,
	#instVars : [
		'opCode1',
		'opCodeR'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86RmInstruction class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx86RmInstruction class >> group [
	^ #rm
]

{ #category : #testing }
AJx86RmInstruction class >> isAbstract [
	^ self == AJx86RmInstruction
]

{ #category : #'code generation' }
AJx86RmInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCodeR := description opCodeR.
		opCode1 := description opCode1.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86RmInstruction >> emitMemory: memory [
	self emitRegisterOrMemory: memory
]

{ #category : #'code generation' }
AJx86RmInstruction >> emitRegister: register [
	self emitRegisterOrMemory: register
]

{ #category : #'code generation' }
AJx86RmInstruction >> emitRegisterOrMemory: operand [
	self
		emitX86RM: self opCode1
		nonByteOffsetOperand: operand
		size: operand size
		registerOrCode: self opCodeR
		rm: operand
]

{ #category : #accessing }
AJx86RmInstruction >> opCode1 [
	^ opCode1
]

{ #category : #accessing }
AJx86RmInstruction >> opCodeR [
	^ opCodeR
]
