Class {
	#name : #TRANFNodePrinter,
	#superclass : #TRILNodePrinter,
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-IL-Utils'
}

{ #category : #printing }
TRANFNodePrinter >> print: node on: aStream [
	self assert: (self hasPrinted: node) not.
	
	self printId: node on: aStream.
	aStream nextPutAll: ' = '.
	super print: node on: aStream.
	node children notEmptyOrNil ifTrue: [ 
		(node opcode hasSymbolRef or:[node opcode isBranch]) ifTrue: [ 
			aStream nextPut: $,.
			aStream space.
		].
		node children 
				do: [:each | self printId: each on: aStream]
				separatedBy:[ aStream nextPutAll: ', '].    
	].
]

{ #category : #'printing - private' }
TRANFNodePrinter >> printId: node on: aStream [
	(node opcode isTreeTop or: [ node opcode type == Void ]) ifTrue: [ 
		aStream nextPutAll:'.   '
	] ifFalse: [
		super printId: node on: aStream
	].
]
