"
I am the general superclass for the x86 INC/DEC instruction group.
"
Class {
	#name : #AJx86IncrementDecrementInstruction,
	#superclass : #AJx86NewInstruction,
	#instVars : [
		'opCode',
		'isDecrement'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86IncrementDecrementInstruction class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx86IncrementDecrementInstruction class >> group [
	^ #incdec
]

{ #category : #testing }
AJx86IncrementDecrementInstruction class >> isAbstract [
	^ self == AJx86IncrementDecrementInstruction
]

{ #category : #'code generation' }
AJx86IncrementDecrementInstruction >> emit32Register: register [

	(register isRegisterGeneralPurposeWord
	or: [ register isRegisterGeneralPurposeDoubleword ])
		ifFalse: [ ^ self emitRegisterOrMemory: register ].

	^ self emitX86Inline: self opCode reg: register
]

{ #category : #'code generation' }
AJx86IncrementDecrementInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		isDecrement := description opCodeR= 1.
		opCode := description opCode1.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86IncrementDecrementInstruction >> emitMemory: memory [
	^ self emitRegisterOrMemory: memory
]

{ #category : #'code generation' }
AJx86IncrementDecrementInstruction >> emitRegister: register [

	self is32BitMode
		ifTrue: [ ^ self emit32Register: register ].

	^ self emitRegisterOrMemory: register
]

{ #category : #'code generation' }
AJx86IncrementDecrementInstruction >> emitRegisterOrMemory: registerOrMemory [

	self
		emitX86RM:  16rFE + (registerOrMemory size ~= 1) asBit
		size: registerOrMemory size
		registerOrCode: self isDecrement asBit
		rm:  registerOrMemory
]

{ #category : #accessing }
AJx86IncrementDecrementInstruction >> isDecrement [
	^ isDecrement
]

{ #category : #accessing }
AJx86IncrementDecrementInstruction >> opCode [
	^ opCode
]
