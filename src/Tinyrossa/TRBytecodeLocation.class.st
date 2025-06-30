Class {
	#name : #TRBytecodeLocation,
	#superclass : #TRLocation,
	#instVars : [
		'index'
	],
	#category : #'Tinyrossa-Annotations'
}

{ #category : #'instance creation' }
TRBytecodeLocation class >> index: index [
	^ self new initializeWithIndex: index
]

{ #category : #accessing }
TRBytecodeLocation >> index [
	^ index
]

{ #category : #initialization }
TRBytecodeLocation >> initializeWithIndex: indexArg [
	self assume: indexArg is: Integer | [ :v | v > 0 ].

	index := indexArg.
]

{ #category : #testing }
TRBytecodeLocation >> isTRBytecodeLocation [
	^ true
]

{ #category : #'printing & storing' }
TRBytecodeLocation >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	self class name printOn:aStream.
	aStream nextPutAll:' index: '.
	index printOn:aStream.
]
