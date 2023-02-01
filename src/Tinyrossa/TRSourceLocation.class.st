Class {
	#name : #TRSourceLocation,
	#superclass : #TRLocation,
	#instVars : [
		'file',
		'line',
		'column'
	],
	#category : #'Tinyrossa-Annotations'
}

{ #category : #'instance creation' }
TRSourceLocation class >> file: file line: line column: column [
	^ self new initializeWithFile: file line: line column: column
]

{ #category : #accessing }
TRSourceLocation >> column [
	^ column
]

{ #category : #accessing }
TRSourceLocation >> file [
	^ file
]

{ #category : #initialization }
TRSourceLocation >> initializeWithFile: fileArg line: lineArg column: columnArg [
	self assert: fileArg isString.
	self assert: lineArg isInteger.
	self assert: columnArg isInteger.

	file := fileArg.
	line := lineArg.
	column := columnArg
]

{ #category : #testing }
TRSourceLocation >> isTRSourceLocation [
	^ true
]

{ #category : #accessing }
TRSourceLocation >> line [
	^ line
]

{ #category : #'printing & storing' }
TRSourceLocation >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	self class name printOn:aStream.
	aStream nextPutAll:' file: '.
	file storeOn:aStream.
	aStream nextPutAll:' line: '.
	line storeOn:aStream.
	aStream nextPutAll:' column: '.
	column storeOn:aStream.
]
