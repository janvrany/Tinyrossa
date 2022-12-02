"
I am the general superclass for x86 instructions that have a destination operand and at least one source operand.
"
Class {
	#name : #AJx86SourceDestinationInstruction,
	#superclass : #AJx86NewInstruction,
	#instVars : [
		'source',
		'destination'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86SourceDestinationInstruction class >> arity [
	^ 2 to: 2
]

{ #category : #testing }
AJx86SourceDestinationInstruction class >> isAbstract [
	^ self = AJx86SourceDestinationInstruction
]

{ #category : #'code generation' }
AJx86SourceDestinationInstruction >> basicEmitCode: asm [
	destination
		emitOn: self
		with: source
]

{ #category : #accessing }
AJx86SourceDestinationInstruction >> destination [
	^ destination
]

{ #category : #accessing }
AJx86SourceDestinationInstruction >> destination: anObject [
	destination := anObject
]

{ #category : #'code generation' }
AJx86SourceDestinationInstruction >> emitCode: asm [

	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		destination ifNil: [
			destination := operands first ].
		source ifNil: [
			source := operands second ].
		description := nil ].

	^ super emitCode: asm
]

{ #category : #accessing }
AJx86SourceDestinationInstruction >> operandsDo: aBlock [
	self flag: 'Compatibility code, remove later!'.
	self description ifNotNil: [
		 ^ super operandsDo: aBlock ].

	aBlock
		value: destination;
		value: source.
]

{ #category : #printing }
AJx86SourceDestinationInstruction >> printOperandsOn: aStream [
	aStream
		space; nextPut: $(.
	(destination == nil ) ifFalse: [
	destination printAsOperandOn: aStream.
	].
	aStream space.
	(source == nil ) ifFalse: [
	source printAsOperandOn: aStream.
	].
	aStream nextPut: $).
]

{ #category : #'code generation' }
AJx86SourceDestinationInstruction >> reifyOperandsWith: anAJAssembler [
	destination ifNil: [
		destination := operands first ].
	destination := self reifyOperand: destination with: anAJAssembler.

	source ifNil: [
		source := operands second ].
	source := self reifyOperand: source with: anAJAssembler.

	self flag: 'TODO: sync the operands and the real operands. Also this is ugly'.
	operands ifNotNil: [
		operands
			at: 1 put: destination;
			at: 2 put: source ].
]

{ #category : #accessing }
AJx86SourceDestinationInstruction >> source [
	^ source
]

{ #category : #accessing }
AJx86SourceDestinationInstruction >> source: anObject [
	source := anObject
]
