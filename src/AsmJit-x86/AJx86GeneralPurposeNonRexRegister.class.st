"
I am special general purpose register type that does requires a non-REX prefixed instruction.
"
Class {
	#name : #AJx86GeneralPurposeNonRexRegister,
	#superclass : #AJx86GeneralPurposeRegister,
	#pools : [
		'AJx86Registers'
	],
	#category : #'AsmJit-x86-Operands'
}

{ #category : #testing }
AJx86GeneralPurposeNonRexRegister >> prohibitsRex [
	^ true
]

{ #category : #testing }
AJx86GeneralPurposeNonRexRegister >> requiresRex [
	^ false
]
