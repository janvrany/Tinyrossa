Class {
	#name : #TRAMD64Register,
	#superclass : #TRRealRegister,
	#instVars : [
		'overlaps'
	],
	#category : #'Tinyrossa-AMD64-Codegen'
}

{ #category : #conversion }
TRAMD64Register >> asAJOperand [
	^ value
]

{ #category : #utilities }
TRAMD64Register >> fixupOperands [
	^ self asAJOperand
]

{ #category : #testing }
TRAMD64Register >> isLabel [
	^ false
]

{ #category : #accessing }
TRAMD64Register >> name [
	^ value name asLowercase
]

{ #category : #queries }
TRAMD64Register >> prohibitsRex [
	"Required by AsmJit"
	^ value prohibitsRex
]

{ #category : #conversion }
TRAMD64Register >> ptr [
	^ (AJMem base: self) size: self size
]

{ #category : #conversion }
TRAMD64Register >> ptr16 [
	^ self ptr size:16
]

{ #category : #conversion }
TRAMD64Register >> ptr32 [
	^ self ptr size:32
]

{ #category : #conversion }
TRAMD64Register >> ptr64 [
	^ self ptr size:64
]

{ #category : #conversion }
TRAMD64Register >> ptr8 [
	^ self ptr size:8
]

{ #category : #initialization }
TRAMD64Register >> setOverlaps: anArray [
	overlaps ~~ anArray ifTrue: [
		overlaps := anArray.
		overlaps do: [:reg | reg notNil ifTrue:[reg setOverlaps: anArray] ]
	].
]

{ #category : #accessing }
TRAMD64Register >> size [
	"Return size of the register in bytes"
	^ value size
]

{ #category : #accessing }
TRAMD64Register >> size: anInteger [
	anInteger == 8 ifTrue: [ ^ overlaps at: 1 ].
	anInteger == 4 ifTrue: [ ^ overlaps at: 2 ].

	self error: 'Unsupported register size'
]
