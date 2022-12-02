"
I am the general superclass for x86 instructions that take the following combinations of operands:

	Destination: REG
	Source:      MEM | REG
"
Class {
	#name : #AJx86RrmInstruction,
	#superclass : #AJx86SourceDestinationInstruction,
	#instVars : [
		'opCode1'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86RrmInstruction class >> group [
	^ #rrm
]

{ #category : #testing }
AJx86RrmInstruction class >> isAbstract [
	^ self == AJx86RrmInstruction
]

{ #category : #'code generation' }
AJx86RrmInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.

	description ifNotNil: [
		opCode1 := description opCode1.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86RrmInstruction >> emitRegister: destinationRegister memory: memory [
	^ self emitRegister: destinationRegister registerOrMemory: memory
]

{ #category : #'code generation' }
AJx86RrmInstruction >> emitRegister: destinationRegister register: sourceRegister [
	destinationRegister assertSameSize: sourceRegister.
	^ self emitRegister: destinationRegister registerOrMemory: sourceRegister
]

{ #category : #'code generation' }
AJx86RrmInstruction >> emitRegister: destinationRegister registerOrMemory: sourceOperand [
	self
		assert: destinationRegister isRegisterGeneralPurposeByte not
		description: 'Cannot use general 8bit registers, but got ', destinationRegister asString.

	self
		emitX86RM: self opCode1
		size: destinationRegister size
		registerOrCode: destinationRegister
		rm: sourceOperand
]

{ #category : #accessing }
AJx86RrmInstruction >> opCode1 [
	^ opCode1
]
