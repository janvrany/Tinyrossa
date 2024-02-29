Class {
	#name : #TRSymbolicEvaluator,
	#superclass : #TRILEvaluator,
	#instVars : [
		'codegen',
		'head',
		'tail',
		'impossible'
	],
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Formal-Codegen'
}

{ #category : #'instance creation' }
TRSymbolicEvaluator class >> forCodeGenerator: aTRCodeGenerator [
	^ self basicNew initializeWithCodeGenerator: aTRCodeGenerator
]

{ #category : #'instance creation' }
TRSymbolicEvaluator class >> new [
	self shouldNotImplement. "Use #forCodeGenerator:"
]

{ #category : #private }
TRSymbolicEvaluator >> append: expr [
	head isNil ifTrue:[
		head := tail := expr.
	] ifFalse:[
		tail expr: expr.
		tail := expr.
	].
	^expr
]

{ #category : #private }
TRSymbolicEvaluator >> appendLet: name to: expr [
	| elet |

	elet := ELet decl: (SpriteDecl bind: (SpriteBind id: name) expr: expr)
						 expr: impossible.
	^self append: elet.

]

{ #category : #accessing }
TRSymbolicEvaluator >> codegen [
	^ codegen
]

{ #category : #'evaluation-helpers' }
TRSymbolicEvaluator >> common: node [
	"Generic evaluation of a node Return resulting value
	 as ΛEApp.

   Caller must ensure that node's children have been already evaluated
   and this node has NOT been evaluated."

	^node opcode asΛEApp: node children


]

{ #category : #'evaluation-helpers' }
TRSymbolicEvaluator >> commonBranchConditional: node [
	"
	Generate something like:

	cond = ificmpeq(N003, N004)
	if (cond) {
		symbol(arg1, arg1, arg3)
	} else {
	   let _ = 0. // <-- `tail` will point here upon return
	         = 1234 // <-- this is returned ΛExpression to make #evaluate: happy.

	}
	"

	| parms autos jump cont if |

	parms := (self compilation symbolManager lookupSymbolsByType: TRParameterSymbol) sorted: #index.
	autos := (self compilation symbolManager lookupSymbolsByType: TRAutomaticSymbol) sorted: #index.

	jump := node symbol asΛEApp: (parms , autos).
	cont := ELet decl: (SpriteDecl bind: (SpriteBind id: '_') expr: (0 asΛExpr: TInt instance))
						 expr: impossible.

	self appendLet: 'cond' to: (node opcode asΛEApp: node children).

	if := EIf cond: (EVar of: 'cond')
					trueE: jump
					falseE: cont.
	self append: if.

	tail := cont.
	^1234 asΛExpr: TInt instance"dummy value"

]

{ #category : #'evaluation-helpers' }
TRSymbolicEvaluator >> commonConst: node [
	^ node opcode asΛEApp: { node constant asExpr: node type asΛBase  }
]

{ #category : #'evaluation-helpers' }
TRSymbolicEvaluator >> commonLoad: node [
	^ node opcode asΛEApp: { node symbol }
]

{ #category : #'evaluation-helpers' }
TRSymbolicEvaluator >> commonReturn: node [
	^ node opcode asΛEApp: { node child1 }
]

{ #category : #'evaluation-helpers' }
TRSymbolicEvaluator >> commonStore: node [
	^ node opcode asΛEApp: { node symbol }
]

{ #category : #accessing }
TRSymbolicEvaluator >> compilation [
	^ codegen compilation
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate: node [
	| result |

	self assert: node isUsed.
	self assert: (node result isNil or: [ node useCount > 1 ]).

	result := node result.
	result isNil ifTrue: [
		| value |

		"Evaluate children if needed"
		node children do: [:child |
			self evaluate: child
		].

		"Evaluate this node (value is ΛExpression)..."
		value := super evaluate: node.
		self assert: (value isKindOf: ΛExpression).

		"...and append it to the chain."
		node opcode isReturn ifTrue:[
			result := self append: value.
			tail := nil.
		] ifFalse:[
			"For any non-return, we wrap the value into an ELet
			 since this allows (i) referencing the value and (ii)
			 chaining subsequent expressions (for IL nodes following this one)."

			node opcode type == Void ifTrue:[
				"If the node does not really yield a value,
				 create 'dummy' ELet."
				result := self appendLet: '.' to: value.
			] ifFalse:[
				| name |

				name := 'N', (node id printPaddedWith: $0 to: 3 base: 10).
				result := self appendLet: name to: value.
				"Mark node has been evaluated. Using #setResultUnchecked:
			 because result is not an V-reg but symbolic expression"
				node setResultUnchecked: result.
			].
		].



	].
	^ result.
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_iadd: node [
	^self common: node.
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_iconst: node [
	^self commonConst: node.
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_idiv: node [
	^self common: node.
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_ificmpeq: node [
	^self commonBranchConditional: node
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_ificmpge: node [
	^self commonBranchConditional: node
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_ificmpgt: node [
	^self commonBranchConditional: node
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_ificmple: node [
	^self commonBranchConditional: node
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_ificmplt: node [
	^self commonBranchConditional: node
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_ificmpne: node [
	^self commonBranchConditional: node
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_iload: node [
	^self commonLoad: node
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_imul: node [
	^self common: node.
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_ireturn: node [
	^self commonReturn: node.
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_istore: node [
	^self commonStore: node
]

{ #category : #evaluation }
TRSymbolicEvaluator >> evaluate_isub: node [
	^self common: node.
]

{ #category : #accessing }
TRSymbolicEvaluator >> expr [
	"Return the head of expression list
	 created by evaluation"

	^head
]

{ #category : #initialization }
TRSymbolicEvaluator >> initializeWithCodeGenerator: aTRCodeGenerator [
	codegen := aTRCodeGenerator.
	head := tail := nil.
	impossible := ΛEApp mkEApp: (EImm imm: (EVar of: 'impossible')) args: { 0 asExpr: TInt instance }.
]
