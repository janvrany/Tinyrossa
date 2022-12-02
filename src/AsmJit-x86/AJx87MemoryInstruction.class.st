"
I am the general superclass for x87 instructions with Memory destination operands.
"
Class {
	#name : #AJx87MemoryInstruction,
	#superclass : #AJx87Instruction,
	#instVars : [
		'o1Flags',
		'opCode1',
		'opCodeR'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx87MemoryInstruction class >> arity [
	^ 0 to: 2
]

{ #category : #accessing }
AJx87MemoryInstruction class >> group [
	^ #x87mem
]

{ #category : #'as yet unclassified' }
AJx87MemoryInstruction class >> isAbstract [
	^ self == AJx87MemoryInstruction
]

{ #category : #'code generation' }
AJx87MemoryInstruction >> emitMemory: memory [
	| opCode mod |
	opCode := mod := 0.

	(memory is16 and: [ (self o1Flags bitAnd: OFM2) ~= 0 ]) ifTrue: [
		opCode := (self opCode1 bitAnd: 16rFF000000) >> 24.
		mod := self opCodeR ].

	(memory is32 and: [ (self o1Flags bitAnd: OFM4) ~= 0 ]) ifTrue: [
		opCode := (self opCode1 bitAnd: 16r00FF0000) >> 16.
		mod := self opCodeR ].

	(memory is64 and: [ (self o1Flags bitAnd: OFM8) ~= 0 ]) ifTrue: [
		opCode := (self opCode1 bitAnd: 16r0000FF00) >> 8.
		mod :=  (self opCode1 bitAnd: 16r000000FF) ].

	opCode = 0 ifTrue: [ self invalidInstruction ].

	self
		emitSegmentPrefix: memory;
		emitByte: opCode.
	memory
		emitModRM: self
		code: mod.
]

{ #category : #accessing }
AJx87MemoryInstruction >> o1Flags [
	^ o1Flags
]

{ #category : #accessing }
AJx87MemoryInstruction >> opCode1 [
	^ opCode1
]

{ #category : #accessing }
AJx87MemoryInstruction >> opCodeR [
	^ opCodeR
]
