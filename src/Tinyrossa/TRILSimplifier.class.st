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
	"Invoked at system start or when the class is dynamically loaded."

	"  please change as required (and remove this comment)"

	ArithmeticSimplificationTable := IdentityDictionary new
		at: iadd put: #+; "This is bogus, iadd is defined as 2's complement wrap-around addition"
		"Add more here..."
		yourself
]

{ #category : #accessing }
TRILSimplifier >> builder [
	^ TRILBuilder forCompilation: compilation
]

{ #category : #evaluation }
TRILSimplifier >> evaluate: node [
	^ self simplify: (super evaluate: node)
]

{ #category : #optimizing }
TRILSimplifier >> simplify: original [
	| simplified |

	simplified := original.
	simplified := self simplifyArithmetic: simplified.
	simplified := self simplifyStore: simplified.
	"Add more here..."
	^ simplified
]

{ #category : #optimizing }
TRILSimplifier >> simplifyArithmetic: node [    
	((ArithmeticSimplificationTable includesKey: node opcode)
		and: [ node child1 opcode isLoadConst 
		and: [ node child2 opcode isLoadConst ]]) ifTrue: [
			| const1 const2 reduceOp reducedConst simplified |

			const1 := node child1 constant.
			const2 := node child2 constant.

			reduceOp := ArithmeticSimplificationTable at: node opcode.
			reducedConst := const1 perform: reduceOp with: const2.

			simplified := self builder build: node child1 opcode arguments: reducedConst.

			^ simplified.
		].
	^ node.
]
