Class {
	#name : #TRSymbolicCodeGenerator,
	#superclass : #TRCodeGeneratorBase,
	#instVars : [
		'prog',
		'metric'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Formal-Codegen'
}

{ #category : #accessing }
TRSymbolicCodeGenerator >> codeBuffer [
	^nil
]

{ #category : #'accessing - config' }
TRSymbolicCodeGenerator >> evaluatorClass [
	^ TRSymbolicEvaluator
]

{ #category : #'code gen-phases' }
TRSymbolicCodeGenerator >> generate [
	"Given the TRIL, generate ML-like form suitable for symbolic
	 execution by MA."

	self
		generateCode
]

{ #category : #'code gen-phases' }
TRSymbolicCodeGenerator >> generateCode [
	"Given the TRIL, generate instruction for it.

	 This is just an instruction selection phase,
	 prologue / epilogues are generated at different
	 phases.
	"

	compilation cfg linearDo: [ :block |
		self generateCodeForBlock: block.
	].
]

{ #category : #'code gen-phases' }
TRSymbolicCodeGenerator >> generateCodeForBlock: block [
	"Generate function for given block and return it as ELet"

	| parms autos bind tfun efun elet |

	"First, generate expression sequence for IL.

	 Note that we need to use fresh evaluator to keep
	 expressions separated (see use of `head` and `tail`
	 in symbolic evaluator)"
	evaluator := self createEvaluator.
	block treetops do:[:node |
		(node opcode ~~ bbstart and:[node opcode ~~ bbend]) ifTrue:[
			evaluator evaluate: node.
		].
	].

	"Now, wrap the sequence in EFun"
	block == compilation cfg entry ifTrue:[
		bind := SpriteBind id: compilation functionSymbol name.
		parms := compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
		autos := #()
	] ifFalse:[
		bind := SpriteBind id: block name.
		parms := compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
		autos := compilation symbolManager lookupSymbolsByType: TRAutomaticSymbol.
	].
	parms := parms sorted: #index.
	autos := autos sorted: #index.

	tfun := (parms , autos) reversed
					inject: compilation functionSymbol type asRType
					into: [ :partial :symbol | TFun x: symbol name s: symbol type asRType t: partial ].


	efun := (parms , autos) reversed
					inject: evaluator expr
					into:[:partial :symbol | EFun bind: (SpriteBind id: symbol name) expr: partial ].

	elet := ELet
					decl: (SpriteRDecl
									bind: bind
									expr: (EAnn
													expr: efun
													ann:  (Refl symbol: bind id rtype: tfun metric: metric)))
					expr: prog expr.

	prog expr: elet.
]

{ #category : #initialization }
TRSymbolicCodeGenerator >> initializeWithCompilation: aTRCompilation [
	super initializeWithCompilation: aTRCompilation.
	
	prog := Prog empty.	
	metric := TerminationMetric with: (DecidableRefinement text: '(0 toInt)').
	
	"
	prog := Prog
					quals: Set new
					meas: #()
					expr: (ΛExpression int: 0)
					data: #()
					options: #()
	"
]

{ #category : #accessing }
TRSymbolicCodeGenerator >> prog [
	^prog
]
