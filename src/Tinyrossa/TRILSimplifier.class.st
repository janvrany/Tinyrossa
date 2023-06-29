Class {
	#name : #TRILSimplifier,
	#superclass : #TRILRewritingPass,
	#classVars : [
		'ArithmeticSimplificationTable'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #initialization }
TRILSimplifier class >> initialize [
	ArithmeticSimplificationTable := IdentityDictionary new
		"FIXME: following is bogus, Xadd is defined as 2's complement wrap-around addition"
		at: badd put: #+; 
		at: sadd put: #+; 
		at: iadd put: #+; 
		at: ladd put: #+; 
		at: aiadd put: #+; 
		at: aladd put: #+; 

		at: bsub put: #-; 
		at: ssub put: #-; 
		at: isub put: #-; 
		at: lsub put: #-; 

		at: bmul put: #*; 
		at: smul put: #*; 
		at: imul put: #*; 
		at: lmul put: #*; 

		"Add more here..."
		yourself
]

{ #category : #rewriting }
TRILSimplifier >> rewrite: original [
	| simplified |

	simplified := original.
	simplified := self simplifyArithmetic: simplified.
	simplified := self simplifyStore: simplified.
	simplified := self simplifyIfCompare: simplified.
	"Add more here..."
	^ simplified
]

{ #category : #optimizing }
TRILSimplifier >> simplifyArithmetic: node [
	"Simplifies

		N01 Xadd
		N02    Xconst V1
		N03    Xconst V2

	 into:

		N04 Xconst V1 + V2

	 See `TRILSimplifier class >> #initialize` to actual list of
	 opcodes that are supported."

	((ArithmeticSimplificationTable includesKey: node opcode)
		and: [ node child1 opcode isLoadConst 
		and: [ node child2 opcode isLoadConst ]]) ifTrue: [
			| const1 const2 folder foldedValue simplified |

			const1 := node child1 constant.
			const2 := node child2 constant.

			folder := ArithmeticSimplificationTable at: node opcode.
			foldedValue := const1 perform: folder with: const2.

			simplified := TRILNode opcode: node type constOpcode constant: foldedValue.

			^ simplified.
		].
	^ node.
]

{ #category : #optimizing }
TRILSimplifier >> simplifyIfCompare: node [
	"
	Simplifies

		ificmp<eq|ne> <label>
		  icmp<cond>
			<value1>
			<value2
		  iconst <0|1>

	to

		ificmp<cond> <label>
		  <value1>
		  <value2

	"
	| op |

	op := node opcode.
	(op isCompareAndBranch and:[ op isCompareTrueIfEQ or: [ op isCompareTrueIfNE ] ]) ifTrue: [
		| child1 child2 |

		child1 := node child1.
		child2 := node child2.

		(child1 opcode isCompare and: [ child2 opcode isLoadConst ]) ifTrue: [ 
			| cmpOp ifCmpOp simplified |

			cmpOp := child1 opcode.
			child2 constant == 0 ifTrue: [ 
				cmpOp := cmpOp reverseBranchOpcode.
			].

			ifCmpOp := cmpOp ifCompareOpcode.
			op isCompareTrueIfNE ifTrue: [ 
				ifCmpOp := ifCmpOp reverseBranchOpcode.
			].
			simplified := TRILNode opcode: ifCmpOp symbol: node symbol children: child1 children.
			^ simplified
		].
	].
	^ node.
]

{ #category : #optimizing }
TRILSimplifier >> simplifyStore: node [
	"This simplification removes unnecessary stores into automatics and parameters."
	
	node opcode isStore ifFalse: [ ^node ].

	"A store into automatic (or parameter) is unnecessary if there's 
	no other use of that automatic (or parameter). We can check this 
	by comparing symbol's use count - if it's equal to 1, the it is 
	used (the only use is this very store).
	
	We may not simply *remove* that store with all its children 
	because it's child may have some side-effects. If so, we replace 
	store with treetop. 
	"
	(node symbol useCount == 1
		and:[node symbol isTRAutomaticSymbol or:[node symbol isTRParameterSymbol]]) ifTrue:[
		node child1 mayHaveSideeffect ifTrue:[
			^ TRILNode opcode: treetop children: node children.
		] ifFalse:[
			node block remove: node.
			^node.
		].
	].
	^ node.
]
