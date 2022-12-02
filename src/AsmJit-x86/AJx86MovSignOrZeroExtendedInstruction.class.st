"
I am the general superclass for the x86 Mov Sign/Zero-Extended Integer instruction group for bit rotation.
"
Class {
	#name : #AJx86MovSignOrZeroExtendedInstruction,
	#superclass : #AJx86MovInstruction,
	#instVars : [
		'opCode1'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86MovSignOrZeroExtendedInstruction class >> group [
	^ #movSxZx
]

{ #category : #testing }
AJx86MovSignOrZeroExtendedInstruction class >> isAbstract [
	^ self == AJx86MovSignOrZeroExtendedInstruction
]

{ #category : #'code generation' }
AJx86MovSignOrZeroExtendedInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCode1 := description opCode1 ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86MovSignOrZeroExtendedInstruction >> emitRegister: destinationRegister memory: memory [

	^ self emitRegister: destinationRegister registerOrMemory: memory
]

{ #category : #'code generation' }
AJx86MovSignOrZeroExtendedInstruction >> emitRegister: destinationRegister register: register [
	self
		assert: register isGeneralPurpose
		description: 'Expected general purpose register, but got ', register asString.

	^ self emitRegister: destinationRegister registerOrMemory: register
]

{ #category : #'code generation' }
AJx86MovSignOrZeroExtendedInstruction >> emitRegister: destinationRegister registerOrMemory: sourceRegisterOrMemory [
	sourceRegisterOrMemory is16
		ifTrue: [
			self
				assert: (destinationRegister is32 or: [destinationRegister is64])
				description: '16bit source ', sourceRegisterOrMemory asString, ' can only be combined with 32 or 64bit destination, but got ', destinationRegister asString ].

	sourceRegisterOrMemory assertSmallerThan: destinationRegister.

	self
		emitX86RM: self opCode1 + sourceRegisterOrMemory is16 asBit
		size: destinationRegister size
		registerOrCode: destinationRegister
		rm: sourceRegisterOrMemory

]

{ #category : #accessing }
AJx86MovSignOrZeroExtendedInstruction >> opCode1 [
	^ opCode1
]
