"
A general purpose x86 & x64 registers
"
Class {
	#name : #AJx86GeneralPurposeRegister,
	#superclass : #AJRegister,
	#pools : [
		'AJx86Registers'
	],
	#category : #'AsmJit-x86-Operands'
}

{ #category : #converting }
AJx86GeneralPurposeRegister >> as16 [
	^ self isHighByte
		ifTrue: [ self asLowByte as16 ]
		ifFalse: [
			AJx86Registers
				generalPurposeWithIndex: self index
				size: 2 ]
]

{ #category : #converting }
AJx86GeneralPurposeRegister >> as32 [
	^ self isHighByte
		ifTrue: [ self asLowByte as32 ]
		ifFalse: [
			AJx86Registers
				generalPurposeWithIndex: self index
				size: 4 ]
]

{ #category : #converting }
AJx86GeneralPurposeRegister >> as64 [
	^ self isHighByte
		ifTrue: [ self asLowByte as64 ]
		ifFalse: [
			AJx86Registers
				generalPurposeWithIndex: self index
				size: 8 ]
]

{ #category : #converting }
AJx86GeneralPurposeRegister >> as8 [
	"8-bit low-byte registers require REX if they have a high index (>7), or if they are one of BPL, SIL, DIL, SPL (indices 4-7).
	The only way to get AH, BH, CH, or DH out of this method is to send it to one of those registers."

	^ self is8
		ifTrue: [ self ]
		ifFalse: [
			AJx86Registers
				generalPurposeWithIndex: self index
				size: 1]
]

{ #category : #converting }
AJx86GeneralPurposeRegister >> asHighByte [
	Error signal: 'Can only convert AH, BH, CH, or DH to high byte registers'
]

{ #category : #converting }
AJx86GeneralPurposeRegister >> asLowByte [
	Error signal: 'Can only convert high byte 8bit register to low byte'
]

{ #category : #accessing }
AJx86GeneralPurposeRegister >> descriptionOn: s [
	s nextPutAll: 'A '; print: self size * 8; nextPutAll: 'bit general purpose register'.
]

{ #category : #emitting }
AJx86GeneralPurposeRegister >> emitModRM: emitter code: rCode [

	"Receiver is register, hence mod = 3
	immSize is ignored"

	^ emitter emitMod: 3 reg: rCode rm: self code
]

{ #category : #emitting }
AJx86GeneralPurposeRegister >> emitModRM: emitter code: rCode immSize: immSize [

	^ self emitModRM: emitter code: rCode
]

{ #category : #testing }
AJx86GeneralPurposeRegister >> isGeneralPurpose [
	^ true
]

{ #category : #testing }
AJx86GeneralPurposeRegister >> isHighByte [
	"return true for 8bit high-byte registers (AH - DH)"

	^ false
]

{ #category : #testing }
AJx86GeneralPurposeRegister >> isLowByte [
	"return true for 8bit low-byte register (AL - DL)"

	"Note that this does *not* answer true for all byte registers -- send #is8 for that."

	^ false
]

{ #category : #printing }
AJx86GeneralPurposeRegister >> printAsMemBaseOn: aStream [

	aStream nextPutAll: self registerName
]

{ #category : #printing }
AJx86GeneralPurposeRegister >> printOn: aStream [

	aStream nextPutAll: self registerName
]

{ #category : #converting }
AJx86GeneralPurposeRegister >> ptr [

	"turn receiver into a memory operand with receiver as base"

	^ AJMem base: self
]

{ #category : #accessing }
AJx86GeneralPurposeRegister >> registerName [
	^ name asString.
]

{ #category : #accessing }
AJx86GeneralPurposeRegister >> stackSize [
	^ self size
]
