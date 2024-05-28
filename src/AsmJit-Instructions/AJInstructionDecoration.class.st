"
I am wrapper instructions to annotate multiple instructions. I do not alter the final instrauctions but I am only used to display additional information to the programmer.
"
Class {
	#name : #AJInstructionDecoration,
	#superclass : #AJInstruction,
	#instVars : [
		'end'
	],
	#category : #'AsmJit-Instructions'
}

{ #category : #visitor }
AJInstructionDecoration >> accept: anObject [
	anObject instructionDecoration: self
]

{ #category : #accessing }
AJInstructionDecoration >> end [
	end := true
]

{ #category : #printing }
AJInstructionDecoration >> printIndentOn: aStream [
	end ifFalse: [
		super printIndentOn: aStream.
		aStream cr ].
	^ super printIndentOn: aStream
]

{ #category : #printing }
AJInstructionDecoration >> printSelfOn: aStream [
	end
		ifFalse: [ aStream nextPutAll: '/ "' ]
		ifTrue: [       aStream nextPutAll: '\ "end ' ].
	aStream
		nextPutAll: (self annotationAt: String) asString;
		nextPut: $".
]

{ #category : #accessing }
AJInstructionDecoration >> start [
	end := false
]
