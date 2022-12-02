"
I am an abtract class for jump instructions.
"
Class {
	#name : #AJx86ConditionalJumpInstruction,
	#superclass : #AJx86StackInstruction,
	#instVars : [
		'source',
		'destination'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86ConditionalJumpInstruction class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx86ConditionalJumpInstruction class >> group [
	^ #cjmp
]

{ #category : #'as yet unclassified' }
AJx86ConditionalJumpInstruction class >> isAbstract [
	^ self == AJx86ConditionalJumpInstruction
]
