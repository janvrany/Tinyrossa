Class {
	#name : #TRAMD64VirtualRegister,
	#superclass : #TRVirtualRegister,
	#instVars : [
		'size'
	],
	#category : #'Tinyrossa-AMD64-Codegen'
}

{ #category : #converting }
TRAMD64VirtualRegister >> asAJOperand [
	allocation notNil ifTrue: [
		allocation value asAJOperand
	] ifFalse: [
		self halt.
	].
]

{ #category : #utilities }
TRAMD64VirtualRegister >> dword [
	self size: 4
]

{ #category : #utilities }
TRAMD64VirtualRegister >> fixupOperands [
	^ (allocation size: self size) fixupOperands
]

{ #category : #testing }
TRAMD64VirtualRegister >> isLabel [
	^ false
]

{ #category : #printing }
TRAMD64VirtualRegister >> printAsOperandOn: aStream [
	value printOn: aStream
]

{ #category : #conversion }
TRAMD64VirtualRegister >> ptr [
	^ (AJMem base: self) size: self size
]

{ #category : #conversion }
TRAMD64VirtualRegister >> ptr16 [
	^ self ptr size:16
]

{ #category : #conversion }
TRAMD64VirtualRegister >> ptr32 [
	^ self ptr size:32
]

{ #category : #conversion }
TRAMD64VirtualRegister >> ptr64 [
	^ self ptr size:64
]

{ #category : #conversion }
TRAMD64VirtualRegister >> ptr8 [
	^ self ptr size:8
]

{ #category : #utilities }
TRAMD64VirtualRegister >> qword [
	self size: 8
]

{ #category : #accessing }
TRAMD64VirtualRegister >> size [
	"Return the size of this virtual register in bytes"
	^ size ? 8
]

{ #category : #accessing }
TRAMD64VirtualRegister >> size: anInteger [
	self assert: (#(8 4) includes: anInteger).
	self assert: (size isNil or: [ size == anInteger ]).

	size := anInteger.
]
