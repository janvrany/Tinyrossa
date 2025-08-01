Class {
	#name : #TRILBytecodeBuilder,
	#superclass : #TRILBuilder,
	#category : #'Tinyrossa-IL-Builder-Bytecode'
}

{ #category : #'building-locations' }
TRILBytecodeBuilder >> bci: index [
	"Record current bytecode index"

	self location: (TRBytecodeLocation index: index).
]

{ #category : #accessing }
TRILBytecodeBuilder >> currentState [
	^ current currentState
]

{ #category : #accessing }
TRILBytecodeBuilder >> entryState [
	^ entry startState
]

{ #category : #accessing }
TRILBytecodeBuilder >> entryState: aTRVMState [
	entry startState: aTRVMState
]

{ #category : #'building-blocks' }
TRILBytecodeBuilder >> orphanClass [
	^ TRILBytecodeBuilder
]

{ #category : #'building-helpers' }
TRILBytecodeBuilder >> pop [
	| value |

	self assume: self currentState notNil.

	value := self currentState pop.
	^ value loadUsing: self.
]

{ #category : #'building-helpers' }
TRILBytecodeBuilder >> push: aTRILNode [
	| value |

	self assume: self currentState notNil.
	self assume: aTRILNode opcode isTreeTop not.

	value := TRILValue forCompilation: compilation node: (self treetop: { aTRILNode }).
	self currentState push: value
]

{ #category : #'building-helpers' }
TRILBytecodeBuilder >> top [
	"Return top of the (virtual) stack, without removing it"
	^ self top: 1
]

{ #category : #'building-helpers' }
TRILBytecodeBuilder >> top: index [
	"Return nth element from the top of the (virtual) stack. Indexing
	 starts from one - the top most element (lastly pushed) is at index
	 1, previous one at 2 and so on."
	| value |

	self assume: self currentState notNil.

	value := self currentState top: index.
	^ value loadUsing: self.
]

{ #category : #'building-private' }
TRILBytecodeBuilder >> transferTo: aTRILBlock [ 
	| target |

	target := super transferTo: aTRILBlock.
	self currentState notNil ifTrue: [
		aTRILBlock startState isNil ifTrue: [
			aTRILBlock startState: self currentState.
		] ifFalse: [
			| mergeBuilder |

			mergeBuilder := self orphan.
			self currentState mergeInto: aTRILBlock startState using: mergeBuilder.
			mergeBuilder current setSuccessor1: target.
			target := mergeBuilder entry.
		].
	].
	^ target.
]
