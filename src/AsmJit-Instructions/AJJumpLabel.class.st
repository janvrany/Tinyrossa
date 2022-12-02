"
A label for a jump
"
Class {
	#name : #AJJumpLabel,
	#superclass : #AJInstruction,
	#instVars : [
		'isSet'
	],
	#category : #'AsmJit-Instructions'
}

{ #category : #visitor }
AJJumpLabel >> accept: anObject [
	anObject jumpLabel: self
]

{ #category : #converting }
AJJumpLabel >> asAJOperand [
	^ AJLabel new
		label: name asSymbol;
		yourself
]

{ #category : #'emitting code' }
AJJumpLabel >> emitCode: asm [

]

{ #category : #accessing }
AJJumpLabel >> extractLabels: aBlock [

	aBlock value: name value: position
]

{ #category : #testing }
AJJumpLabel >> isLabel [
	^true
]

{ #category : #accessing }
AJJumpLabel >> isSet [
	^ isSet == true
]

{ #category : #accessing }
AJJumpLabel >> isSet: anObject [
	isSet := anObject
]

{ #category : #printing }
AJJumpLabel >> printAsOperandOn: aStream [

	aStream nextPutAll: '@@';
		nextPutAll: name asString
]

{ #category : #printing }
AJJumpLabel >> printOn: aStream [

	aStream nextPutAll: '@@';
		nextPutAll: name asString
]

{ #category : #printing }
AJJumpLabel >> printSelfOn: aStream [
	self printOn: aStream
]
