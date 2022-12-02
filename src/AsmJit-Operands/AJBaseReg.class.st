"
AJBaseReg  -- abstract superclass of all register operands.

Instance Variables:
	size	<Number>  Width in bytes (1, 2, 4, 8...)
	code	<Integer>  Non-negative integer, encoding varies with subclass. For AJx86GPRegisters, ten bits: xyttttnnnn
						where nnnn is the register number 0-15, tttt is the ""type"", which encodes size as a power of 2.
						Higher types are used in other subclasses.
						If y is 1, REX prefix is required to encode this register.
						If x is 1, this register cannot be used when any REX prefix is present in the instruction.
	name	<Symbol>  Name by which this register may be referenced in instructions
"
Class {
	#name : #AJBaseReg,
	#superclass : #AJOperand,
	#instVars : [
		'size',
		'code',
		'name'
	],
	#category : #'AsmJit-Operands'
}

{ #category : #'instance creation' }
AJBaseReg class >> code: aRegisterCode name: aSymbol [
	^ self basicNew initializeWithCode: aRegisterCode name: aSymbol
]

{ #category : #comparing }
AJBaseReg >> = otherReg [

	^ (self class == otherReg class) and: [ code = otherReg code ]
]

{ #category : #visiting }
AJBaseReg >> accept: aVisitor [
	^ aVisitor visitRegister: self
]

{ #category : #accessing }
AJBaseReg >> annotation: anObject [
	"registers gereally are used as single instances, hence putting
	an annotation on the default register will change the annotation
	for all the users. To avoid that, the receiver is copied first"
	^ self copy
		basicAnnotation: anObject;
		yourself
]

{ #category : #private }
AJBaseReg >> basicAnnotation: anObject [
	"private setter"
	annotation := anObject
]

{ #category : #accessing }
AJBaseReg >> code [
	"Answer the value of code"

	^ code
]

{ #category : #accessing }
AJBaseReg >> code: anObject [
	"Set the value of code"

	code := anObject
]

{ #category : #accessing }
AJBaseReg >> description [
	^ String streamContents: [ :s | self descriptionOn: s ].
]

{ #category : #printing }
AJBaseReg >> descriptionOn: aStream [
	self subclassResponsibility
]

{ #category : #comparing }
AJBaseReg >> hash [
	^ code hash
]

{ #category : #accessing }
AJBaseReg >> index [
	^ code bitAnd: RegCodeMask
]

{ #category : #accessing }
AJBaseReg >> influencingRegisters [
	^ #()
]

{ #category : #'initialize-release' }
AJBaseReg >> initializeWithCode: aRegisterCode name: aSymbol [
	super initialize.
	self code: aRegisterCode.	"Also sets size"
	name := aSymbol
]

{ #category : #testing }
AJBaseReg >> isGeneralPurpose [
	self subclassResponsibility
]

{ #category : #testing }
AJBaseReg >> isRegIndex: aRegIndex [

	^ self isRegister and: [ self index == (aRegIndex bitAnd: RegCodeMask ) ]

]

{ #category : #testing }
AJBaseReg >> isRegisterOrMemory [

	^ true
]

{ #category : #accessing }
AJBaseReg >> name [
	^ name
]

{ #category : #accessing }
AJBaseReg >> size [
	^ size
]

{ #category : #accessing }
AJBaseReg >> type [
	^ code bitAnd: RegTypeMask
]

{ #category : #validation }
AJBaseReg >> validateIn: anObject [
	^ anObject validateRegister: self
]
