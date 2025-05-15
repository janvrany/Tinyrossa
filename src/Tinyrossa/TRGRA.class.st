Class {
	#name : #TRGRA,
	#superclass : #TRILRewritingPass,
	#instVars : [
		'allocation',
		'loads'
	],
	#pools : [
		'TRILOpcodeTables',
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Optimizer-GRA'
}

{ #category : #allocation }
TRGRA >> allocateRegisters [
	| parameters parameterTypes parameterMappings |

	allocation := Dictionary new.

	"
	1. Map parameters to parameter registers:
	"
	parameters := compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
	parameters := parameters sorted: [ :a :b | a index < b index ].
	parameterTypes := parameters collect: [ :parameter | parameter type ].
	parameterMappings := compilation codegen linkage mapParameters: parameterTypes.

	parameters withIndexDo: [:parameter :index |
		| rreg |

		rreg := parameterMappings at: index.
		rreg isTRRealRegister ifTrue: [
			allocation at: parameter put: rreg.
		].
	].

	"
	TODO: Allocate (some) automatics
	"
]

{ #category : #evaluation }
TRGRA >> evaluate_bbend: node [
	^ super evaluate_bbend: node
]

{ #category : #evaluation }
TRGRA >> evaluate_bbstart: node [
	loads := SmallDictionary new.

	node block liveness liveIn do: [:sym |
		(allocation includesKey: sym) ifTrue: [
			| loadreg |

			loadreg := TRILNode opcode: (LoadRegOpcodes at: sym type) register: (allocation at: sym).
			loads at: sym put: loadreg.
		].
	].

	^ TRILNode opcode: bbstart children: {
		TRILNode opcode: glregdeps children: loads values asArray
	}.
]

{ #category : #rewriting }
TRGRA >> rewrite: aTRILNode [
	aTRILNode opcode isLoadVar ifTrue: [
		^ self rewriteLoad: aTRILNode
	].
	aTRILNode opcode isStore ifTrue: [
		^ self rewriteStore: aTRILNode
	].
	^ aTRILNode
]

{ #category : #rewriting }
TRGRA >> rewriteLoad: load [
	| loadreg |

	loadreg := loads at: load symbol ifAbsent: [ nil ].
	^ loadreg ? load
]

{ #category : #rewriting }
TRGRA >> rewriteStore: store [
	(allocation includesKey: store symbol) ifTrue: [
		^ TRILNode opcode: (StoreRegOpcodes at: store symbol type) register: (allocation at: store symbol)
	] ifFalse: [
		^ store
	].
]

{ #category : #optimizing }
TRGRA >> run [
	TRLiveness compute: compilation cfg.
	self allocateRegisters.
	super run.
]
