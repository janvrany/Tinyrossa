"
I am a specialized low-byte registers AH, CH, DH, BH.
My low-byte opposites are AL, CL, DL, BL, of type AJx86GeneralPurposeLowByteRegister
"
Class {
	#name : #AJx86HighByteRegister,
	#superclass : #AJx86GeneralPurposeNonRexRegister,
	#instVars : [
		'lowByteComplementRegister'
	],
	#pools : [
		'AJx86Registers'
	],
	#category : #'AsmJit-x86-Operands'
}

{ #category : #converting }
AJx86HighByteRegister >> asHighByte [
	^ self
]

{ #category : #converting }
AJx86HighByteRegister >> asLowByte [
	self isLowByte
		ifTrue: [ ^ self ].
	self isHighByte
		ifFalse: [ Error signal: 'Can only convert high byte 8bit register to low byte' ].
	^ lowByteComplementRegister
]

{ #category : #testing }
AJx86HighByteRegister >> isHighByte [
	"return true for 8bit high-byte registers (AH - DH)"
	^ true
]

{ #category : #accessing }
AJx86HighByteRegister >> lowByteComplementRegister [

	^ lowByteComplementRegister
]

{ #category : #accessing }
AJx86HighByteRegister >> lowByteComplementRegister: aRegister [

	lowByteComplementRegister := aRegister
]
