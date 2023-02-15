"
TRLeave is a special pseudo-instruction used to mark return(s) from compiled 
functions when compiling (strictly speaking, when performing instruction 
selection).

These are replaced by actual epilogue when generating prologue/epilogues.

The (virtual) register holding the return value is stored in `value` instance
variable.

"
Class {
	#name : #TRLeave,
	#superclass : #AcPseudoInstruction,
	#instVars : [
		'value'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRLeave class >> value: aTRVirtualRegister [
	^ self basicNew initializeWithValue: aTRVirtualRegister
]

{ #category : #'encoding / decoding' }
TRLeave >> disassemble [
	"Return string representing receiver in an assembly language."

	value isNil ifTrue: [ 
		^ 'leave'
	] ifFalse: [
		value allocation notNil ifTrue: [ 
			^ 'leave returning ', value allocation name
		].
		^ 'leave returning ', value name
	]
]

{ #category : #initialization }
TRLeave >> initializeWithValue: aTRVirtualRegister [
	value := aTRVirtualRegister
]

{ #category : #testing }
TRLeave >> isLeaveInstruction [
	^ true
]

{ #category : #accessing }
TRLeave >> name [
	"superclass AcInstruction says that I am responsible to implement this method"

	^ '<leave subroutine>'
]

{ #category : #accessing }
TRLeave >> value [
	^ value
]
