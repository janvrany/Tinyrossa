"
I am the general superclass for the x86 that consist of a unique operation code withou parameters.
"
Class {
	#name : #AJx86DirectInstruction,
	#superclass : #AJx86NewInstruction,
	#instVars : [
		'opCode',
		'is32BitOnly',
		'is64BitOnly'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86DirectInstruction class >> arity [
	^ 0 to: 0
]

{ #category : #accessing }
AJx86DirectInstruction class >> group [
	^ #emit
]

{ #category : #testing }
AJx86DirectInstruction class >> isAbstract [
	^ self == AJx86DirectInstruction
]

{ #category : #'instance creation' }
AJx86DirectInstruction class >> opcode: integer [
	^ self new
		opcode: integer;
		yourself
]

{ #category : #'code generation' }
AJx86DirectInstruction >> emit [

	(self is64BitOnly and: [ self is64BitMode not ]) ifTrue: [
		self error: 'instruction ', self name asUppercase,' is only for 64 bit mode' ].

	(self is32BitOnly and: [ self is32BitMode not ]) ifTrue: [
		self error: 'instruction ', self name asUppercase,' is only for 32 bit mode' ].

	self emitOpCode: self opCode.
]

{ #category : #'code generation' }
AJx86DirectInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCode := description opCode1.
		is32BitOnly := description is32BitOnly.
		is64BitOnly := description is64BitOnly.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #testing }
AJx86DirectInstruction >> is32BitOnly [
	^ is32BitOnly
]

{ #category : #testing }
AJx86DirectInstruction >> is64BitOnly [
	^ is64BitOnly
]

{ #category : #accessing }
AJx86DirectInstruction >> opCode [
	^ opCode
]

{ #category : #accessing }
AJx86DirectInstruction >> opCode1 [
	^ opCode
]
