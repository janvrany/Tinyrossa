"
I am the general superclass for x87 instructions with additional FPU stack operations.
"
Class {
	#name : #AJx87StiInstruction,
	#superclass : #AJx87Instruction,
	#instVars : [
		'opCode1'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx87StiInstruction class >> arity [
	^ 0 to: 2
]

{ #category : #accessing }
AJx87StiInstruction class >> group [
	^ #x87sti
]

{ #category : #testing }
AJx87StiInstruction class >> isAbstract [
	^ self == AJx87StiInstruction
]

{ #category : #'code generation' }
AJx87StiInstruction >> emit [
	^ self emitX87Register: AJx86Registers ST1
]

{ #category : #'code generation' }
AJx87StiInstruction >> emitX87Register: register [
	register ifNil: [ ^ self emit ].

	self
		emitByte: (self opCode1 bitAnd: 16rFF00) >> 8;
		emitByte: (self opCode1 bitAnd: 16rFF) + register index.
]

{ #category : #accessing }
AJx87StiInstruction >> opCode1 [
	^ opCode1
]
