Class {
	#name : #TRILBlock,
	#superclass : #Object,
	#instVars : [
		'name',
		'treetops',
		'precedessors',
		'successor1',
		'successor2',
		'next'
	],
	#classVars : [
		'IdCounter'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #initialization }
TRILBlock class >> initialize [
	IdCounter := 0.
]

{ #category : #'instance creation' }
TRILBlock class >> new [
	^ self basicNew initialize
]

{ #category : #'adding & removing' }
TRILBlock >> add: aTRNode [
	self assert: aTRNode opcode isTreeTop description: 'Invalid node (not a treetop)'.
	self assert: self hasReturned not description: 'Cannot add more nodes after a return'.

	treetops add: aTRNode.
	aTRNode block: self.
	"Reset successors if we're returning from this block
	 since they're unreachable."
	aTRNode opcode isReturn ifTrue: [
		successor1 notNil ifTrue: [ 
			successor1 removePrecedessor: self.
			successor1 := nil.
		].
		successor2 notNil ifTrue: [ 
			successor2 removePrecedessor: self.
			successor2 := nil.
		].
	].
]

{ #category : #'adding & removing' }
TRILBlock >> addPrecedessor: aTRILBlock [
	precedessors isNil ifTrue: [ 
		precedessors := Array with: aTRILBlock
	] ifFalse: [ 
		precedessors := precedessors copyWith: aTRILBlock
	].
]

{ #category : #testing }
TRILBlock >> hasReturned [
	^ treetops notEmpty and: [ treetops last opcode isReturn ]
]

{ #category : #initialization }
TRILBlock >> initialize [
	super initialize.

	name := String streamContents: [:s | s nextPutAll: 'BB_'; nextPutAll: (IdCounter printPaddedWith: $0 to: 3 base: 10). IdCounter := IdCounter + 1].
	treetops := OrderedCollection new.

	"Modified: / 25-07-2022 / 11:37:39 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #testing }
TRILBlock >> isEmpty [
	^ treetops isEmpty
]

{ #category : #testing }
TRILBlock >> isExtension [
	"
	Return `true` if this block is an 'extension' of previous block.

	From https://github.com/eclipse/omr/blob/master/doc/compiler/il/IntroToTrees.md#basic-blocks: 

	   | and locates blocks whose only predecessor is the 
	   | previous block in program order. Such blocks are 
	   | flagged as 'extensions' of the previous block
	"
	^ precedessors size == 1 
		and: [ precedessors first successor1 == self
		and: [ precedessors first next == self ] ]
]

{ #category : #testing }
TRILBlock >> isTRILBlock [
	^ true
]

{ #category : #accessing }
TRILBlock >> name [
	^ name
]

{ #category : #accessing }
TRILBlock >> next [
	"Return the next block (in sense of linear order).
	 This is only valid after block linearization."

	^ next
]

{ #category : #'printing & storing' }
TRILBlock >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut:$(.
	name printOn:aStream.
	aStream nextPut:$).
]

{ #category : #'adding & removing' }
TRILBlock >> removePrecedessor: aTRILBlock [
	precedessors notNil ifTrue: [ 
		precedessors copyWithout: aTRILBlock.
	].
]

{ #category : #initialization }
TRILBlock >> setNext: aTRILBlock [ 
	"Set next block (in sense of linear order). This is used
	 during block linearization."
	
	next := aTRILBlock.
]

{ #category : #initialization }
TRILBlock >> setSuccessor1: aTRILBlock [
	successor1 notNil ifTrue: [ 
		successor1 setSuccessor1: aTRILBlock.
		^ self.
	].
	self hasReturned ifFalse: [ 
		successor1 := aTRILBlock.
		successor1 addPrecedessor: self.
		^ self.
	].
]

{ #category : #initialization }
TRILBlock >> setSuccessor2: aTRILBlock [
	self assert: successor2 isNil.

	successor2 := aTRILBlock.
	successor2 addPrecedessor: self.
]

{ #category : #accessing }
TRILBlock >> successor1 [
	^ successor1
]

{ #category : #accessing }
TRILBlock >> successor2 [
	^ successor2
]

{ #category : #accessing }
TRILBlock >> treetops [
	| bbstartNode bbendNode |

	bbstartNode := (TRILNode opcode: bbstart symbol: nil constant: nil children: nil).
	bbstartNode block: self.
	bbendNode := (TRILNode opcode: bbend symbol: nil constant: nil children: nil).
	bbendNode block: self.

	^ { bbstartNode } , treetops , { bbendNode }
]
