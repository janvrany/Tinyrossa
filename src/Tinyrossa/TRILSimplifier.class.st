Class {
	#name : #TRILSimplifier,
	#superclass : #TRILRewritingPass,
	#instVars : [
		'stores'
	],
	#classVars : [
		'ArithmeticSimplificationTable',
		'ConditionalBranchSimplificationTable'
	],
	#pools : [
		'TRDataTypes',
		'TRILOpcodeProps1',
		'TRILOpcodeProps3',
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #initialization }
TRILSimplifier class >> initialize [
	| intComparatorTable |

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
		yourself.

	intComparatorTable := SmallDictionary newFromPairs: {
		"LT" CompareTrueIfLess.                         #<  .
		"LE" CompareTrueIfLess | CompareTrueIfEqual.    #<= .
		"EQ" CompareTrueIfEqual.                        #=  .
		"GE" CompareTrueIfGreater | CompareTrueIfEqual. #>= .
		"GE" CompareTrueIfGreater.                      #>  .
		"NE" CompareTrueIfLess | CompareTrueIfGreater.  #~= .   
	}.

	ConditionalBranchSimplificationTable := SmallDictionary newFromPairs: {
		Int8    . intComparatorTable .
		Int16   . intComparatorTable .
		Int32   . intComparatorTable .
		Int64   . intComparatorTable .
		Address . intComparatorTable .
	}
]

{ #category : #evaluation }
TRILSimplifier >> evaluate_bbstart: node [
	stores := Dictionary new.
	^ super evaluate_bbstart: node
]

{ #category : #rewriting }
TRILSimplifier >> rewrite: original [
	| simplified |

	simplified := original.
	simplified := self simplifyArithmetic: simplified.
	simplified := self simplifyStore: simplified.
	simplified := self simplifyIfCompare1: simplified.
	simplified := self simplifyIfCompare2: simplified.
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
TRILSimplifier >> simplifyIfCompare1: node [
	"
	Simplifies

		ificmp<eq|ne> <label>
		  icmp<cond>
			<value1>
			<value2>
		  iconst <0|1>

	to

		ificmp<cond> <label>
		  <value1>
		  <value2>

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
TRILSimplifier >> simplifyIfCompare2: node [
	"
	Simplifies conditional branches where comparison result
	is known staticallty. For example following: 

		if?cmp?? <label>
		  ?const <v1>
		  ?const <v2>

	is simplified to either

		goto <label>

	(if condition always holds) or removed altogether if it does not.

	Note, that this simplification makes some of the blocks unreachable,
	opening up opportunities for further optimizations.

	"
	| op |

	op := node opcode.
	(op isCompareAndBranch and:[ node child1 opcode isLoadConst and: [ node child2 opcode isLoadConst ] ]) ifTrue: [
		| child1Value child2Value comparator comparison |

		child1Value := node child1 constant.
		child2Value := node child2 constant.

		comparator := (ConditionalBranchSimplificationTable 
						at: node child1 type)
						at: node opcode compareFlags.
		comparison := child1Value perform: comparator with: child2Value.

		comparison ifTrue: [ 
			"Condition always holds"
			^ TRILNode opcode: goto symbol: node symbol
		] ifFalse: [
			"Condition never holds"    
			node block remove: node.
		].
	].
	^ node.
]

{ #category : #optimizing }
TRILSimplifier >> simplifyStore: node [
	"This simplification removes unnecessary stores into automatics and parameters.
	 It only handles 'plain stores', i.e., does not handle not indirect  stores and write 
	 barrier stores."
	
	({ bstore . sstore . istore . lstore . astore . fstore . dstore } includes: node opcode) ifFalse: [ 
		^ node.
	].

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

	"Also, store in following form is unncessary:
		
		Xstore <symbol>
			Xload <symbol>
			
	 This is somewhat patological case."
	(({ bload . sload . iload . lload . aload . fload . dload } includes: node child1 opcode)
		and:[node child1 symbol == node symbol]) ifTrue:[
		node block remove: node.
		^node
	].

	"Also, second store in following case is unncessary:

		Xstore <symbol>
			<value>
		...
		Xstore <symbol>
			==> <value>

	"
	((stores includesKey: node symbol) 
		and:[(stores at: node symbol) child1 == node child1]) ifTrue:[
		node block remove: node.
		^node
	].
	
	stores at: node symbol put: node.
	^ node.
]
