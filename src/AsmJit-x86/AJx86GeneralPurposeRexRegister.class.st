"
I am special general purpose register type that does requires an REX prefixed instruction.
"
Class {
	#name : #AJx86GeneralPurposeRexRegister,
	#superclass : #AJx86GeneralPurposeRegister,
	#pools : [
		'AJx86Registers'
	],
	#category : #'AsmJit-x86-Operands'
}

{ #category : #testing }
AJx86GeneralPurposeRexRegister >> prohibitsRex [
	^ false
]

{ #category : #testing }
AJx86GeneralPurposeRexRegister >> requiresRex [
	^ true
]
