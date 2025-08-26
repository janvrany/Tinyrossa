"
`TRLoop` represent a single natural loop of back edge `tail` -> `head`
It also provides means to iterate over blocks comprising the loop.

Implementation note:  For now iterating over loops' blocks is expensive
since blocks are ""computed"" on demand by traversing the original CFG.
If that proves too costly, blocks should be cached once computed.

"
Class {
	#name : #TRLoop,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail'
	],
	#category : #'Tinyrossa-Optimizer-Loops'
}

{ #category : #'instance creation' }
TRLoop class >> forHead: headBlock tail: tailBlock [
	^ self basicNew initializeWithHead: headBlock tail: tailBlock
]

{ #category : #'instance creation' }
TRLoop class >> new [
	^ self shouldNotImplement. "Use #forHead:tail: instead"
]

{ #category : #'accessing - private' }
TRLoop >> blockSet [
	"Return the Set of all blocks comprising the loop"

	| stack seen |

	stack := Stack with: tail.
	seen := Set with: tail.
	[ stack notEmpty ] whileTrue: [
		| block |

		block := stack pop.

		block ~~ head ifTrue: [
			block precedessors do: [:pred |
				(seen includes: pred) ifFalse: [
					stack push: pred.
					seen add: pred.
				].
			].
		].
	].

	^ seen
]

{ #category : #accessing }
TRLoop >> blocks [
	"Return the list of all blocks comprising the loop in pre-order."

	| preorder |

	preorder := OrderedCollection new.
	self preorderDo: [ :block | preorder add: block ].
	self assert: preorder first == head.
	^ preorder.
]

{ #category : #accessing }
TRLoop >> head [
	^ head
]

{ #category : #initialization }
TRLoop >> initializeWithHead: headBlock tail: tailBlock [
	self assume: headBlock is: TRILBlock.
	self assume: tailBlock is: TRILBlock | [:v | v successors includes: headBlock ].

	head := headBlock.
	tail := tailBlock.
]

{ #category : #enumerating }
TRLoop >> postorderDo: aBlock [
	"Traverse blocks of this loop starting with head and evaluate
	 `aBlock` for each block in depth-first post-order manner."

	| blocks |

	blocks := self blockSet.
	head postorderDo: aBlock filter: [ :b | blocks includes: b ].
]

{ #category : #enumerating }
TRLoop >> preorderDo: aBlock [
	"Traverse blocks of this loop starting with head and evaluate
	 `aBlock` for each block in depth-first pre-order manner."

	| blocks |

	blocks := self blockSet.
	head preorderDo: aBlock filter: [ :b | blocks includes: b ].
]

{ #category : #'printing & storing' }
TRLoop >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut:$(.
	head name printOn:aStream.
	aStream nextPut:$).
]

{ #category : #accessing }
TRLoop >> tail [
	^ tail
]
