"
I am the abstract superclass of all AsmJit assemblers.
"
Class {
	#name : #AJAssembler,
	#superclass : #Object,
	#instVars : [
		'instructions',
		'labels',
		'decorationNestingLevel',
		'lastInstruction'
	],
	#category : #'AsmJit-Core'
}

{ #category : #'instruction list' }
AJAssembler >> addInstruction: anInstruction [
	anInstruction validate.
	"add one or multiple instructions to the tail"
	instructions
		ifNil: [ instructions := anInstruction ]
		ifNotNil: [ lastInstruction := lastInstruction last next: anInstruction ].
	anInstruction level: decorationNestingLevel.
	lastInstruction := anInstruction last.
	^ anInstruction

]

{ #category : #'instruction list' }
AJAssembler >> addInstruction: sel description: description operands: operands [

	^ self addInstruction: (self newInstruction: sel description: description operands: operands)
]

{ #category : #'instruction list' }
AJAssembler >> addInstruction: sel operands: operands [

	^ self
		addInstruction: sel
		description: (self instructionDescriptions at: sel)
		operands: operands
]

{ #category : #'code generation' }
AJAssembler >> bytes [

	^ self generatedCode bytes.
]

{ #category : #'code generation' }
AJAssembler >> generatedCode [

	^ AJGeneratedCode new
		fromInstructions: self prepareInstructions.

]

{ #category : #'initialize-release' }
AJAssembler >> initialize [
	super initialize.
	self reset
]

{ #category : #accessing }
AJAssembler >> instructionDescriptions [
	^ self subclassResponsibility
]

{ #category : #accessing }
AJAssembler >> newStackManager [
	^ self subclassResponsibility
]

{ #category : #'code generation' }
AJAssembler >> prepareInstructions [
	"A final step before generating machine code:
	prepare instructions by reifying jump labels.

	Prepared instructions will contain machine code, ready for use
	"

	instructions emitCodeAtOffset: 0 assembler: self.
	^ instructions
]

{ #category : #'instruction list' }
AJAssembler >> replace: anInstruction with: otherInstructions [

	"replace a single instruction with one or more other instructions"

	^ instructions := instructions replace: anInstruction with: otherInstructions.
]

{ #category : #'initialize-release' }
AJAssembler >> reset [
	instructions := lastInstruction := nil.
	labels := Dictionary new.
	decorationNestingLevel := 0.
	self addInstruction: AJRoutinePrologue new
]
