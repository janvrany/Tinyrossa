Class {
	#name : #TRVMOperandStack,
	#superclass : #Object,
	#instVars : [
		'values'
	],
	#category : #'Tinyrossa-IL-Builder-Bytecode'
}

{ #category : #'instance creation' }
TRVMOperandStack class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #accessing }
TRVMOperandStack >> depth [
	^ values size
]

{ #category : #initialization }
TRVMOperandStack >> initialize [
	super initialize.
	values := OrderedCollection new.
]

{ #category : #operations }
TRVMOperandStack >> mergeInto: currentStack using: builder [
	| currentValues |

	currentValues := currentStack slots.
	self assert: values size == currentValues size.

	1 to: values size do: [:slotIndex | 
		| currentValue incomingValue  |

		currentValue := currentValues at: slotIndex.
		incomingValue := values at: slotIndex.

		currentValue ~~ incomingValue ifTrue: [ 
			incomingValue mergeInto: currentValue using: builder
		].
	].
]

{ #category : #operations }
TRVMOperandStack >> pop [
	self assert: values size > 0.

	^ values removeLast
]

{ #category : #copying }
TRVMOperandStack >> postCopy [
	values := values copy.
]

{ #category : #'printing & storing' }
TRVMOperandStack >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut:$(.
	values size printOn:aStream.
	aStream nextPut:$).
]

{ #category : #operations }
TRVMOperandStack >> push: aTRILValue [
	values addLast: aTRILValue
]

{ #category : #accessing }
TRVMOperandStack >> slots [
	^ values
]
