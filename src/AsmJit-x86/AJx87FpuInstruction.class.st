"
I am the general superclass for the general x87 FPU group.
"
Class {
	#name : #AJx87FpuInstruction,
	#superclass : #AJx87Instruction,
	#instVars : [
		'opCode1',
		'opCodeR'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx87FpuInstruction class >> arity [
	^ 0 to: 2
]

{ #category : #accessing }
AJx87FpuInstruction class >> group [
	^ #x87fpu
]

{ #category : #'as yet unclassified' }
AJx87FpuInstruction class >> isAbstract [
	^ self == AJx87FpuInstruction
]

{ #category : #'code generation' }
AJx87FpuInstruction >> emitMemory: memory [
	self
		emitByte: (opCode1 >> (32 - (memory size* 2)) bitAnd: 16rFF).

	memory
		emitModRM: self
		code: opCodeR
]

{ #category : #'code generation' }
AJx87FpuInstruction >> emitX87Register: register x87Register: register2 [
	|shift offset|
	register index = 0
		ifTrue: [
			shift := 24.
			offset := register2 index]
		ifFalse: [
		register2 index = 0
			ifTrue: [
				shift = 16.
				offset := register index]
			ifFalse: [ self error: 'ST0 must be one of arguments, but got ', register asString, ' and ', register2 asString ]].

	"D8 if Storing in ST0, DC if storing in other"
	self
		emitByte: (self opCode1 >> shift bitAnd: 16rFF);
		emitByte: (self opCode1 >> (shift - 16) bitAnd: 16rFF) + offset
]

{ #category : #accessing }
AJx87FpuInstruction >> opCode1 [
	^ opCode1
]

{ #category : #accessing }
AJx87FpuInstruction >> opCodeR [
	^ opCodeR
]
