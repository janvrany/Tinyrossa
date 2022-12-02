Class {
	#name : #AJGeneratedCode,
	#superclass : #Object,
	#instVars : [
		'bytes',
		'labels'
	],
	#category : #'AsmJit-Core'
}

{ #category : #'instance creation' }
AJGeneratedCode class >> fromInstructions: instructions [
	^ self new fromInstructions: instructions
]

{ #category : #accessing }
AJGeneratedCode >> bytes [
	^ bytes
]

{ #category : #accessing }
AJGeneratedCode >> bytes: aBytes [

	bytes := aBytes


]

{ #category : #output }
AJGeneratedCode >> dumpWithLabels [

	"dump the native code , interspersed with labels"

	| offsets i str |

	offsets := OrderedCollection new.

	labels keysAndValuesDo: [ :name :offset |
		offsets add: (offset -> name)
	].

	offsets := offsets sort: [:a :b | a key < b key ].

	str := String new writeStream.
	i := 0.

	offsets do: [:offset |
		i to: offset key -1 do: [:x | str nextPutAll: ((bytes at: i+1) printStringBase: 16 nDigits: 2) ; space. i:=i+1. ].
		str cr; nextPutAll: offset value; cr.
	].

	i to: bytes size-1 do: [:x | str nextPutAll: ((bytes at: i+1) printStringBase: 16 nDigits: 2) ; space. i := i + 1] .
	^ str contents
]

{ #category : #'initialize-release' }
AJGeneratedCode >> fromInstructions: instructions [

	bytes := ByteArray new: 100 streamContents: [:stream|
		instructions do: [ :each |
			each extractLabels: [:name :pos | labels at: name put: pos ].
			each storeOn: stream ]].
]

{ #category : #'initialize-release' }
AJGeneratedCode >> initialize [
	labels := Dictionary new.

]

{ #category : #accessing }
AJGeneratedCode >> labels: aLabels [
	"turn labels into a simple name->offset pairs"
	aLabels keysAndValuesDo: [:name :lbl |
		labels at: name put: lbl paddedOffset ].

]

{ #category : #accessing }
AJGeneratedCode >> offsetAt: aLabelName [
	^ labels at: aLabelName
]

{ #category : #printing }
AJGeneratedCode >> printOn: aStream [

	bytes notNil ifTrue: [
		aStream nextPutAll: self dumpWithLabels

		]
]

{ #category : #output }
AJGeneratedCode >> saveToFile [
	self saveToFile: 'asm.bin'
]

{ #category : #output }
AJGeneratedCode >> saveToFile: fileName [
	| wd file |
	wd := FileSystem disk workingDirectory.
	file := wd / fileName.
	file exists
		ifTrue: [ file delete ].
	file binaryWriteStream
		nextPutAll: bytes;
		close
]
