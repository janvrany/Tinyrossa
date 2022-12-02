"
I am the general superclass for x86 instructions that take the following operan types:

	Destination: MEM | REG
	Source:      REG
"
Class {
	#name : #AJx86RmrInstruction,
	#superclass : #AJx86SourceDestinationInstruction,
	#instVars : [
		'opCode1'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86RmrInstruction class >> group [
	^ #rmr
]

{ #category : #'as yet unclassified' }
AJx86RmrInstruction class >> isAbstract [
	^ self == AJx86RmrInstruction
]

{ #category : #'code generation' }
AJx86RmrInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCode1 := description opCode1.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86RmrInstruction >> emitMemory: memory register: sourceRegister [
	^ self emitRegisterOrMemory: memory register: sourceRegister

]

{ #category : #'code generation' }
AJx86RmrInstruction >> emitRegister: register register: sourceRegister [
	register assertSameSize: sourceRegister.
	^ self emitRegisterOrMemory: register register: sourceRegister

]

{ #category : #'code generation' }
AJx86RmrInstruction >> emitRegisterOrMemory: destinationOperand register: sourceRegister [
	self
		emitX86RM: self opCode1
		nonByteOffsetOperand: sourceRegister
		size: sourceRegister size
		registerOrCode: sourceRegister
		rm: destinationOperand
]

{ #category : #accessing }
AJx86RmrInstruction >> opCode1 [
	^ opCode1
]
