"
I am an abstract instruction combining functioniality of PUSH and POP
"
Class {
	#name : #AJx86PopInstruction,
	#superclass : #AJx86StackInstruction,
	#instVars : [
		'opCode2',
		'opCodeR',
		'opCode1'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86PopInstruction class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx86PopInstruction class >> group [
	^ #pop
]

{ #category : #testing }
AJx86PopInstruction class >> isAbstract [
	^ self == AJx86PopInstruction
]

{ #category : #'code generation' }
AJx86PopInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCodeR := description opCodeR.
		opCode1 := description opCode1.
		opCode2 := description opCode2.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86PopInstruction >> emitMemory: memory [
	self
		emitX86RM: self opCode2
		size: memory size
		registerOrCode: self opCodeR
		rm: memory
]

{ #category : #'code generation' }
AJx86PopInstruction >> emitRegister: register [
	"(register isRegisterGeneralPurposeWord | (self isRegisterGeneralPurposeNative: register))
		ifFalse: [ self error: 'Invalid register given: ', register asString ]."
	register assertMinimumSize: 2.

	self is64BitMode
		ifTrue: [ ^ self emitX86Inline: self opCode1 register: register withRex: register isUpperBank ].

	^ self emitX86Inline: self opCode1 reg: register.
]

{ #category : #accessing }
AJx86PopInstruction >> opCode1 [
	^ opCode1
]

{ #category : #accessing }
AJx86PopInstruction >> opCode2 [
	^ opCode2
]

{ #category : #accessing }
AJx86PopInstruction >> opCodeR [
	^ opCodeR
]
