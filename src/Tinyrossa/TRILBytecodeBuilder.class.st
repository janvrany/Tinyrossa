Class {
	#name : #TRILBytecodeBuilder,
	#superclass : #TRILBuilder,
	#instVars : [
		'entryState',
		'currentState'
	],
	#category : #'Tinyrossa-IL-Builder-Bytecode'
}

{ #category : #'building-locations' }
TRILBytecodeBuilder >> bci: index [
	"Record current bytecode index"

	self location: (TRBytecodeLocation index: index).
]

{ #category : #accessing }
TRILBytecodeBuilder >> entryState [
	^ entryState
]

{ #category : #accessing }
TRILBytecodeBuilder >> entryState: aTRVMState [
	self assert: entryState isNil.
	self assert: currentState isNil.

	entryState := aTRVMState.
	currentState := aTRVMState copy.
]

{ #category : #'building-blocks' }
TRILBytecodeBuilder >> orphanClass [
	^ TRILBytecodeBuilder
]

{ #category : #'building-helpers' }
TRILBytecodeBuilder >> pop [
	| value |

	self assert: currentState notNil.

	value := currentState pop.
	^ value loadUsing: self.
]

{ #category : #'building-helpers' }
TRILBytecodeBuilder >> push: aTRILNode [
	| value |

	self assert: currentState notNil.
	self assert: aTRILNode opcode isTreeTop not.

	value := TRILValue forCompilation: compilation node: (self treetop: { aTRILNode }).
	currentState push: value
]

{ #category : #'building-private' }
TRILBytecodeBuilder >> transferTo: aTRILBuilder [
	| target |

	target := aTRILBuilder entry.
	currentState notNil ifTrue: [ 
		aTRILBuilder entryState isNil ifTrue: [ 
			aTRILBuilder entryState: currentState.
		] ifFalse: [ 
			| mergeBuilder |

			mergeBuilder := self orphan.
			currentState mergeInto: aTRILBuilder entryState using: mergeBuilder.
			mergeBuilder fallThroughToBlock: aTRILBuilder entry.
			target := mergeBuilder entry.
		].
	].
	^ target.
]
