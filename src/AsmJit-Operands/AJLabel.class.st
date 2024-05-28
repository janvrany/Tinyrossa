"
I am a label used to mark a an arbitrary position inside the final assembler code. Labels can be used to jump to locations that are unknown at creation time and can only be resolved when the final instruction bytes are generated.
"
Class {
	#name : #AJLabel,
	#superclass : #AJOperand,
	#instVars : [
		'label',
		'position',
		'relative'
	],
	#pools : [
		'AJConstants'
	],
	#category : #'AsmJit-Operands'
}

{ #category : #'instance creation' }
AJLabel class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #visiting }
AJLabel >> accept: aVisitor [
	^ aVisitor visitLabel: self
]

{ #category : #'double dispatch' }
AJLabel >> emitOn: anInstruction [
	^ anInstruction emitLabel: self
]

{ #category : #'double dispatch' }
AJLabel >> emitOn: anInstruction memory: aMemoryOperand [
	^ anInstruction emitMemory: aMemoryOperand label: self
]

{ #category : #'double dispatch' }
AJLabel >> emitOn: anInstruction register: aRegister [
	^ anInstruction emitRegister: aRegister label: self
]

{ #category : #testing }
AJLabel >> hasPosition [
	^ position notNil
]

{ #category : #initialization }
AJLabel >> initialize [
	super initialize.
	relative := true
]

{ #category : #testing }
AJLabel >> isLabel [
	^true
]

{ #category : #testing }
AJLabel >> isReadyToEmit [
	^self hasPosition
]

{ #category : #testing }
AJLabel >> isRelative [
	^ relative
]

{ #category : #accessing }
AJLabel >> label [
	^ label
]

{ #category : #accessing }
AJLabel >> label: anObject [
	label := anObject
]

{ #category : #accessing }
AJLabel >> position [
	^position
]

{ #category : #accessing }
AJLabel >> position: aSmallInteger [
	position := aSmallInteger
]

{ #category : #printing }
AJLabel >> printOn: aStream [
	self label ifNil: [ ^ super printOn: aStream ].
	aStream << '@@'; << self label.
	self hasPosition
		ifTrue: [ aStream << '('; print: self position; << ')' ].
]

{ #category : #testing }
AJLabel >> requiresRex [
	self flag: 'Probably we do not require REX here... '.
	^ false
]

{ #category : #accessing }
AJLabel >> size [
	self flag: 'TODO: Clearly this has to be assembler dependent!'.
	^ 4
]
