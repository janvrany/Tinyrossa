"
I am platform independent abstract instruction used for jumps.
By default I contain a description and a label I jump to. Labels are resovled at code generation time to real addresses which then is used to generate the real jump instruction.
"
Class {
	#name : #AJJumpInstruction,
	#superclass : #AJInstruction,
	#instVars : [
		'label',
		'description'
	],
	#category : #'AsmJit-Instructions'
}

{ #category : #visitor }
AJJumpInstruction >> accept: anObject [
	^ anObject jumpInstruction: self
]

{ #category : #accessing }
AJJumpInstruction >> codeSize [
	^ machineCode size
]

{ #category : #accessing }
AJJumpInstruction >> description [
	^ description
]

{ #category : #accessing }
AJJumpInstruction >> description: anInstructionDescription [
	description := anInstructionDescription
]

{ #category : #testing }
AJJumpInstruction >> isLabelUsed: anAJJumpLabel [
	^ label = anAJJumpLabel
]

{ #category : #accessing }
AJJumpInstruction >> label [
	^ label
]

{ #category : #accessing }
AJJumpInstruction >> label: anObject [
	label := anObject
]

{ #category : #printing }
AJJumpInstruction >> printSelfOn: aStream [
	aStream nextPutAll: name; space.
	label printSelfOn: aStream.

	machineCode ifNotNil: [
		aStream space; nextPut: $[ .
		machineCode do: [:byte | aStream nextPutAll: (byte printStringBase: 16)] separatedBy: [ aStream space ].
		aStream nextPut: $].
	].


]
