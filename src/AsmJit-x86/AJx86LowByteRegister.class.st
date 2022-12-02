"
I am a specialized low-byte registers AL, CL, DL, BL.
My high-byte opposites are AH, CH, DH, BH of type AJx86GeneralPurposeHighByteRegister
"
Class {
	#name : #AJx86LowByteRegister,
	#superclass : #AJx86GeneralPurposeRegister,
	#instVars : [
		'highByteComplementRegister'
	],
	#pools : [
		'AJx86Registers'
	],
	#category : #'AsmJit-x86-Operands'
}

{ #category : #converting }
AJx86LowByteRegister >> asHighByte [
	self isHighByte
		ifTrue: [ ^ self ].
	self isLowByte
		ifFalse: [ Error signal: 'Can only convert AH, BH, CH, or DH to high byte registers' ].
	^ highByteComplementRegister
]

{ #category : #converting }
AJx86LowByteRegister >> asLowByte [
	^ self
]

{ #category : #testing }
AJx86LowByteRegister >> assertCL [
	self
		assert: self index = 1
		description: [ 'Expected CL but got ', self asString ]
]

{ #category : #accessing }
AJx86LowByteRegister >> highByteComplementRegister [

	^ highByteComplementRegister
]

{ #category : #accessing }
AJx86LowByteRegister >> highByteComplementRegister: aHighByteRegister [

	highByteComplementRegister := aHighByteRegister
]

{ #category : #testing }
AJx86LowByteRegister >> isLowByte [
	"return true for 8bit low-byte register (AL - DL)"
	^ true
]
