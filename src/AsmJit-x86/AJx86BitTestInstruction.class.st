"
I am the general superclass for the x86 Bit Test instruction group for bit rotation.
"
Class {
	#name : #AJx86BitTestInstruction,
	#superclass : #AJx86SourceDestinationInstruction,
	#instVars : [
		'opCode1',
		'opCode2',
		'opCodeR'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86BitTestInstruction class >> group [
	^ #bt
]

{ #category : #'as yet unclassified' }
AJx86BitTestInstruction class >> isAbstract [
	^ self == AJx86BitTestInstruction
]

{ #category : #accessing }
AJx86BitTestInstruction >> destination: aRegisterOrMemory [
	self
		assert: aRegisterOrMemory isRegisterOrMemory
		description: 'Expected register or memory but got ', aRegisterOrMemory asString.
	^ super destination: aRegisterOrMemory
]

{ #category : #'code generation' }
AJx86BitTestInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.

	description ifNotNil: [
		opCode1 := description opCode1.
		opCode2 := description opCode2.
		opCodeR := description opCodeR.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86BitTestInstruction >> emitRegister: destinationRegister immediate: sourceImmediate [
	destinationRegister assertMinimumSize: 2.

	sourceImmediate isInt8
		ifFalse: [ self error: 'Expected imm8 but got ', sourceImmediate size asString, ' immediate.' ].

	self
		emitX86RM: self opCode2
		size: destinationRegister size
		registerOrCode: self opCodeR
		rm: destinationRegister.

	^ self emitImmediate: sourceImmediate size: 1
]

{ #category : #'code generation' }
AJx86BitTestInstruction >> emitRegister: destinationRegister register: sourceRegister [
	destinationRegister
		assertSameSize: sourceRegister;
		assertMinimumSize: 2.

	self
		emitX86RM: self opCode1
		size: sourceRegister size
		registerOrCode: sourceRegister
		rm: destinationRegister
]

{ #category : #accessing }
AJx86BitTestInstruction >> opCode1 [
	^ opCode1
]

{ #category : #accessing }
AJx86BitTestInstruction >> opCode2 [
	^ opCode2
]

{ #category : #accessing }
AJx86BitTestInstruction >> opCodeR [
	^ opCodeR
]
