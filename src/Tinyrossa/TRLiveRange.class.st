Class {
	#name : #TRLiveRange,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'blocks'
	],
	#category : #'Tinyrossa-Optimizer-GRA'
}

{ #category : #utilities }
TRLiveRange class >> compute: aTRCFG [
	"Compute live raages if parameter and automatic symbols for each (reachable)
	 block in CFG. Once finished, live range for a particular symbol used in given
	 block can be retrieved using `block liveness ranges at: symbol ifAbsent:[...]`."

	aTRCFG entry liveness liveIn do: [:symbol |
		self forSymbol: symbol block: aTRCFG entry
	].

	aTRCFG preorderDo: [ :block |
		block liveness liveIn do: [:symbol |
			self assert: (block liveness ranges includesKey: symbol)
		].

		block liveness liveOut do: [:symbol |
			| range |

			range := block liveness ranges at: symbol ifAbsentPut: [self forSymbol: symbol block: block].

			block successorsDo: [ :succ |
				(succ liveness liveIn includes: symbol) ifTrue:[
					range addBlock: succ.
				]
			].
		].
	].
]

{ #category : #'instance creation' }
TRLiveRange class >> forSymbol: symbol block: block [
	^ self basicNew initalizeWithSymbol: symbol block: block
]

{ #category : #initialization }
TRLiveRange >> addBlock: block [
	"Add a block to the range. This should be called only during live ranges
	 computation (that is, within `TRLiveRange class >> #compute:`)."

	self assert: (block isTRILBlock).
	self assert: (block liveness notNil).
	self assert: ((block liveness liveIn , block liveness liveOut) includes: symbol).

	(blocks includes: block) ifFalse: [
		block liveness ranges at: symbol put: self.
		blocks add: block.
	].
]

{ #category : #accessing }
TRLiveRange >> blocks [
	^ blocks
]

{ #category : #initialization }
TRLiveRange >> initalizeWithSymbol: symbolArg block: blockArg [
	self assert: (symbolArg isTRParameterSymbol or: [ symbolArg isTRAutomaticSymbol ]).

	symbol := symbolArg.
	blocks := Set new.

	self addBlock: blockArg.
]

{ #category : #'printing & storing' }
TRLiveRange >> printOn:aStream [
	super printOn:aStream.
	aStream nextPutAll:'(symbol = "'.
	aStream nextPutAll: symbol name.
	aStream nextPutAll:'", blocks = {'.
	blocks do:[:block | aStream nextPutAll: block name ] separatedBy: [ aStream nextPut:$,; space ].
	aStream nextPutAll:'})'.
]

{ #category : #accessing }
TRLiveRange >> symbol [
	^ symbol
]
