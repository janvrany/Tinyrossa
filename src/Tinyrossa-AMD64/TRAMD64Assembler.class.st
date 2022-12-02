Class {
	#name : #TRAMD64Assembler,
	#superclass : #AJx64Assembler,
	#instVars : [
		'grounder',
		'cursor'
	],
	#category : #'Tinyrossa-AMD64-Codegen'
}

{ #category : #'instruction list' }
TRAMD64Assembler >> addInstruction: anInstruction [
	instructions isNil ifTrue: [ 
		instructions := OrderedCollection new.
		cursor := 0.
	].
	instructions add: anInstruction afterIndex: cursor.
	cursor := cursor + 1. 


	anInstruction isPseudoInstruction ifFalse: [ 
		"We need to maintain a linked list of real instructions since
		 AsmJit requires that."

		| index |

		"Find and link previous real instruction..."
		index := cursor - 1.
		[ index > 0 and:[ (instructions at:index) isPseudoInstruction ] ] whileTrue: [ 
			index := index - 1.
		].
		index > 0 ifTrue: [ 
			(instructions at: index) next: anInstruction
		].

		"Find and link next real instruction..."
		index := cursor + 1.
		[ index <= instructions size and:[ (instructions at:index) isPseudoInstruction ] ] whileTrue: [ 
			index := index + 1.
		].
		index <= instructions size ifTrue: [ 
			anInstruction next: (instructions at: index)
		] ifFalse: [ 
			lastInstruction := anInstruction.
		].
	].
]

{ #category : #accessing }
TRAMD64Assembler >> address [
	^ 0

	"Created: / 18-11-2022 / 15:47:46 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #accessing }
TRAMD64Assembler >> cursor [
	^ cursor
]

{ #category : #accessing }
TRAMD64Assembler >> cursor: anInteger [
	cursor := anInteger.
]

{ #category : #accessing }
TRAMD64Assembler >> instructions [
	^ instructions

	"Created: / 18-11-2022 / 15:39:04 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #instructions }
TRAMD64Assembler >> leave: aTRVirtualRegister [
	| insn |

	insn := TRLeave value: aTRVirtualRegister.
	self addInstruction: insn.
	^ insn
]

{ #category : #accessing }
TRAMD64Assembler >> memory [
	^ self
]

{ #category : #accessing }
TRAMD64Assembler >> newInstruction [
	^ TRAMD64Instruction new
]

{ #category : #accessing }
TRAMD64Assembler >> newJumpInstruction [
	^ TRAMD64JumpInstruction new
]

{ #category : #'code generation' }
TRAMD64Assembler >> prepareInstructions [
	"A final step before generating machine code: 
	prepare instructions by injecting a stack alignment
	and reifying jump labels.

	Prepared instructions will contain machine code, ready for use
	"
	"instructions := stackManager analyzeInstructions: instructions assembler: self."
	instructions do: [:instruction | 
		instruction isPseudoInstruction ifFalse: [ 
			instruction emitCodeAtOffset: 0 assembler: self.
			^ instruction.
		].
	].
	^ nil
]
