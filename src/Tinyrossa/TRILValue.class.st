"
A `TRILValue` is an helper object to simplify propagating
values from one block to another.

Due to design of an IL, the only way to propagate value
from one block to another is through store into / load 
from an automatic. Therefore, each IL value is backed
by an automatic. 

`TRILValue` automates allocation of backing automatic
as well as provides support for merging two values
(necessary when two different control flow paths
produce same value.

One example where `TRILValues` are used is VM (virtual) operand
stack where individual stack slots are represented by
`TRILValue`s. See `TRVMOperandStack`.

"
Class {
	#name : #TRILValue,
	#superclass : #Object,
	#instVars : [
		'store'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #'instance creation' }
TRILValue class >> forCompilation: compilation node: node [ 
	^ self new initializeWithCompilation: compilation node: node
]

{ #category : #initialization }
TRILValue >> initializeWithCompilation: compilation node: treetopNode [
	| valueNode |

	self assert: treetopNode opcode == treetop.
	self assert: treetopNode child1 type isVoidType not.

	valueNode := treetopNode child1.
	store := TRILNode opcode: valueNode type storeOpcode
					  symbol: (compilation symbolManager defineAutomatic: nil type: valueNode type)
					children: { valueNode }.
	treetopNode block replace: treetopNode with: store.
]

{ #category : #utilities }
TRILValue >> loadUsing: aTRILBytecodeBuilder [
	| load |

	load := TRILNode opcode: store symbol type loadOpcode symbol: store symbol.
	load location: aTRILBytecodeBuilder location.
	^ load
]

{ #category : #utilities }
TRILValue >> mergeInto: other using: builder [ 

	"If both are already using the same backing automatic,
	 nothing needs to be done."
	self symbol = other symbol ifTrue:[ 
		^ self.
	].

	"If I have only been defined and never used since,
	 use the same automatic as the other value."
	self symbol useCount == 1 ifTrue: [ 
		self symbol: other symbol.
		^ self.
	].

	"If the other has only been defined and never used since,
	 use the same automatic as this value."
	other symbol useCount == 1 ifTrue: [ 
		other symbol: self symbol.
		^ self
	].

	"Otherwise, store this value over the 
	 other value."
	self error: 'Not yet implemented'
]

{ #category : #accessing }
TRILValue >> symbol [
	^ store symbol
]

{ #category : #accessing }
TRILValue >> symbol: aTRAutomaticSymbol [
	| storeInAnotherAuto |

	self assert: self symbol type = aTRAutomaticSymbol type.
	self assert: self symbol useCount == 1.

	storeInAnotherAuto := TRILNode opcode: store opcode
								   symbol: aTRAutomaticSymbol
								 children: { store child1 }.
	store block replace: store with: storeInAnotherAuto.
]
