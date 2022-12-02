"
I am a pseudo instruction used to align the following instruction to a multiple of a given byte number.

Example:
	asm := AJx64Assembler noStackFrame.

	""align the following instruction to a word (2bytes)""
	asm alignWord.
	asm inc: asm RAX.

	""align the following instruction to a double (4bytes)""
	asm alignDouble.
	asm inc: asm RAX.

	""align the following instruction to a QuadWord (8bytes)""
	asm alignQuad.
	asm inc: asm RAX.

	""align the following instruction to a multiple of an arbirary count""
	asm align: 64.
	asm inc: asm RAX.
"
Class {
	#name : #AJAlignmentInstruction,
	#superclass : #AJInstruction,
	#instVars : [
		'alignTo'
	],
	#pools : [
		'AJConstants'
	],
	#category : #'AsmJit-Instructions'
}

{ #category : #'instance creation' }
AJAlignmentInstruction class >> align: byteSize [
	^ self new align: byteSize
]

{ #category : #'instance creation' }
AJAlignmentInstruction class >> alignDoubleword [
	^ self new alignDoubleword
]

{ #category : #'instance creation' }
AJAlignmentInstruction class >> alignQuadword [
	^ self new alignQuadword
]

{ #category : #'instance creation' }
AJAlignmentInstruction class >> alignWord [
	^ self new alignWord
]

{ #category : #visitor }
AJAlignmentInstruction >> accept: anObject [
	self shouldBeImplemented
]

{ #category : #accessing }
AJAlignmentInstruction >> align [
	^ alignTo
]

{ #category : #accessing }
AJAlignmentInstruction >> align: bytesSize [
	"align the data to the given byte count"
	alignTo := bytesSize
]

{ #category : #alignment }
AJAlignmentInstruction >> alignByte [
	self align: 1
]

{ #category : #alignment }
AJAlignmentInstruction >> alignDoubleword [
	self align: 4
]

{ #category : #alignment }
AJAlignmentInstruction >> alignQuadword [
	self align: 8
]

{ #category : #alignment }
AJAlignmentInstruction >> alignWord [
	self align: 2
]

{ #category : #'emitting code' }
AJAlignmentInstruction >> emitCode: asm [
	| padding |

	padding := self paddingForPosition: position.

	"new machine code: | padding |"
	machineCode := ByteArray new: padding .
]

{ #category : #'initialize-release' }
AJAlignmentInstruction >> initialize [
	super initialize.
	self alignByte.
]

{ #category : #accessing }
AJAlignmentInstruction >> name [
	^ String streamContents: [ :s|
		self printSelfOn: s]
]

{ #category : #'emitting code' }
AJAlignmentInstruction >> paddingForPosition: aPositionNumber [
	| padding |

	padding := aPositionNumber \\ self align.
	padding = 0
		ifFalse: [ padding := self align - padding ].

	^ padding
]

{ #category : #accessing }
AJAlignmentInstruction >> printSelfOn: aStream [
	self align <= 1 ifTrue: [ ^ self ].

	aStream nextPut: $|.
	self align <= 8
		ifTrue: [
			self align timesRepeat: [
				aStream nextPutAll: '----|']]
		ifFalse: [
			aStream
				nextPutAll: (self align asString padded: #left to: 4 with: $ );
				nextPut: $|]
]
