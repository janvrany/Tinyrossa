"
I represent a pure data section in an assembly instruction stream.

Example:
	asm := AJx64Assembler noStackFrame.

	""add a raw byte""
	asm db: 16rFF.

	""add a raw word""
	asm dw: #[16r34 16r12].

	""add a raw double""
	asm dw: #[16r78 16r56 16r34 16r12].

	""add a arbitrary sized data section with a byteArray""
	asm data: #[1 2 3 4 5 6 7 8 9 10 11 12 ].
"
Class {
	#name : #AJData,
	#superclass : #AJInstruction,
	#instVars : [
		'data',
		'alignment'
	],
	#pools : [
		'AJConstants'
	],
	#category : #'AsmJit-Instructions'
}

{ #category : #'instance creation' }
AJData class >> byte: aByteValue [
	^ self data: (ByteArray with: aByteValue)
]

{ #category : #'instance creation' }
AJData class >> data: aDataByteArray [
	^ self new
		data: aDataByteArray;
		yourself
]

{ #category : #'instance creation' }
AJData class >> label: aLabel data: aDataByteArray [
	^ self new
		label: aLabel;
		data: aDataByteArray;
		yourself
]

{ #category : #visitor }
AJData >> accept: anObject [
	anObject instructionData: self
]

{ #category : #accessing }
AJData >> data [
	^ machineCode
]

{ #category : #accessing }
AJData >> data: aByteArray [
	"the will be put in the executable."
	machineCode := aByteArray
]

{ #category : #'emitting code' }
AJData >> emitCode: asm [
	machineCode ifNil: [ machineCode := #[] ]
]

{ #category : #testing }
AJData >> is16 [
	^ self size = 2
]

{ #category : #testing }
AJData >> is32 [
	^ self size = 4
]

{ #category : #testing }
AJData >> is64 [
	^ self size = 8
]

{ #category : #testing }
AJData >> is8 [
	^ self size = 1
]

{ #category : #accessing }
AJData >> name [
	name ifNotNil: [ ^ name ].

	"standard data sections"
	self is8 ifTrue: [ ^ 'db' ].
	self is16 ifTrue: [ ^ 'dw' ].
	self is32 ifTrue: [ ^ 'dd' ].
]

{ #category : #accessing }
AJData >> size [
	^ self data size
]
