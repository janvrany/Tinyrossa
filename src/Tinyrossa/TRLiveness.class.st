Class {
	#name : #TRLiveness,
	#superclass : #Object,
	#instVars : [
		'block',
		'genSet',
		'killSet',
		'liveIn',
		'liveOut',
		'ranges'
	],
	#category : #'Tinyrossa-Codegen-Register Allocation'
}

{ #category : #utilities }
TRLiveness class >> compute: aTRCFG [
	"Compute liveness of automatic symbols for each (reachable)
	 block in CFG. Once finished, liveness information for a block
	 can be retrieved using `TRILBlock >> #liveness`.

	 See https://engineering.purdue.edu/~milind/ece573/2015fall/project/step7/step7.html
	 "


	"First, initialize parameter and automatic liveness info and
	 compute gen set and kill set for each block..."

	| worklist |

	aTRCFG preorderDo: [ :block |
		| liveness |

		liveness := TRLiveness forBlock: block.
		block treetopsDo: [ :treetop |
			(treetop opcode isStore "and: [treetop symbol isTRAutomaticSymbol]") ifTrue: [
				liveness killSet add: treetop symbol
			].
			treetop preorderDo: [ :node |
				(node opcode isLoadVar "and: [ node symbol isTRAutomaticSymbol ]") ifTrue: [
					liveness genSet add: node symbol
				].
			].
		]
	].

	"Then, compile live-in and live-out sets for each block.

	 From https://engineering.purdue.edu/~milind/ece573/2015fall/project/step7/step7.html

	 >   The trick to computing liveness (and we will discuss this in more detail in class) is to
	 >   compute a ﬁxpoint: assignments to each of the live-in and live-out sets so that if you
	 >   try to compute any node's live-in or live-out set again, you'll get the same result you
	 >   already have. To do this, we will use a worklist algorithm:
	 >
	 >       1. Put all of the IR nodes on the worklist
	 >       2. Pull an IR node off the worklist, and compute its live-out and live-in sets
	 >       according to the deﬁnitions above.
	 >       3. If the live-in set of the node gets updated by the previous step, put all of the
	 >       node's predecessors on the worklist (because they may need to update their
	 >       live-out sets).
	 >       4. Repeat steps 2 and 3 until the worklist is empty.
	 >       5. The live-out sets of each node now represent a ﬁxpoint.
	 >
	"

	worklist := aTRCFG blocks.
	[ worklist notEmpty ] whileTrue: [
		| block liveOut liveIn |

		block := worklist removeFirst.

		"
		>  * The set of variables that are live out of a node is the union of all the variables
		>    that are live in to the node's successors.
		"
		liveOut := Set new.
		block successorsDo: [ :succ | liveOut addAll: succ liveness liveIn ].
		block liveness liveOut: liveOut.

		"
		>   * The set of variables that are live in to a node is the set of variables that are live
		>     out for the node, minus any variables that are killed by the node, plus any
		>     variables that are gen-ed by the node.
		"
		liveIn := (liveOut difference: block liveness killSet) union: block liveness genSet.
		(liveIn ~= block liveness liveIn) ifTrue: [
			"live-in set has changed..."
			worklist addAll: block precedessors.
		].
		block liveness liveIn: liveIn.
	].
]

{ #category : #'instance creation' }
TRLiveness class >> forBlock: aTRILBlock [
	^ self basicNew initializeWithBlock: aTRILBlock
]

{ #category : #'instance creation' }
TRLiveness class >> new [
	self shouldNotImplement. "Use #forBlock:"
]

{ #category : #accessing }
TRLiveness >> block [
	^ block
]

{ #category : #accessing }
TRLiveness >> genSet [
	^ genSet
]

{ #category : #initialization }
TRLiveness >> initializeWithBlock: aTRILBlock [
	self assert: aTRILBlock isTRILBlock.

	block := aTRILBlock.
	genSet := Set new: 5.
	killSet := Set new: 5.
	liveIn := Set new: 0.
	liveOut := Set new: 0.
	ranges := SmallDictionary new.

	aTRILBlock setLiveness: self.
]

{ #category : #accessing }
TRLiveness >> killSet [
	^ killSet
]

{ #category : #accessing }
TRLiveness >> liveIn [
	^ liveIn
]

{ #category : #accessing }
TRLiveness >> liveIn: aSet [
	liveIn := aSet.
]

{ #category : #accessing }
TRLiveness >> liveOut [
	^ liveOut
]

{ #category : #accessing }
TRLiveness >> liveOut: aSet [
	liveOut := aSet.
]

{ #category : #'printing & storing' }
TRLiveness >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPutAll:'(live-in = {'.
	liveIn do:[:sym | aStream nextPutAll: sym name ] separatedBy: [ aStream nextPut:$,; space ].
	aStream nextPutAll:'}, live-out = {'.
	liveOut do:[:sym | aStream nextPutAll: sym name ] separatedBy: [ aStream nextPut:$,; space ].
	aStream nextPutAll:'})'.
]

{ #category : #accessing }
TRLiveness >> ranges [
	^ ranges
]
