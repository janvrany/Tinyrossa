"
`TRRegisterLiveInterval` represent (virtual) register live interval.

For given (virtual) register it keeps track of all def positions
(i.e., positions where a register was written to) and use positions
(i.e., positions where register value was read). It also knows
spill slot, if any.

Internally, def and use positions are kept in single ordered
`uses` array where

  * each def position `d` is encoded as `(d * 2) + 1` and
  * each use position `u` is encoded as `(u * 2)`

"
Class {
	#name : #TRRegisterLiveInterval,
	#superclass : #Object,
	#instVars : [
		'register',
		'uses',
		'spillSlot'
	],
	#category : #'Tinyrossa-Codegen-Register Allocation'
}

{ #category : #'instance creation' }
TRRegisterLiveInterval class >> forRegister: aTRVirtualRegister [
	^ self basicNew initializeWithRegister: aTRVirtualRegister
]

{ #category : #'instance creation' }
TRRegisterLiveInterval class >> new [
	^ self shouldNotImplement. "Use #forRegister: instead"
]

{ #category : #private }
TRRegisterLiveInterval >> decodePosition: encodedPosition [
	^ encodedPosition // 2
]

{ #category : #utilities }
TRRegisterLiveInterval >> defdAt: position [
	| positionEncoding |

	self assert: position isInteger.

	positionEncoding := self encodeDefPosition: position.
	uses isEmpty ifTrue: [
		uses := Array with: positionEncoding.
	] ifFalse: [
		(uses includes: positionEncoding) ifFalse: [
			uses := (uses copyWith: positionEncoding) sort.
		].
	].
]

{ #category : #enumerating }
TRRegisterLiveInterval >> defdDo: aBlock [
	"Evaluate `aBlock` for each instruction index where this virtual
	 registers is defined."

	uses do: [:i |
		(self encodesDefPosition: i) ifTrue: [
			aBlock value: (self decodePosition: i)
		].
	].
]

{ #category : #private }
TRRegisterLiveInterval >> encodeDefPosition: position [
	^ (position * 2) + 1
]

{ #category : #private }
TRRegisterLiveInterval >> encodeUsePosition: position [
	^ (position * 2)
]

{ #category : #private }
TRRegisterLiveInterval >> encodesDefPosition: encodedPosition [
	^ encodedPosition odd.
]

{ #category : #private }
TRRegisterLiveInterval >> encodesUsePosition: encodedPosition [
	^ encodedPosition even.
]

{ #category : #accessing }
TRRegisterLiveInterval >> firstDef [
	"Return the first def position for this interval."

	uses do: [:encodedPosition |
		(self encodesDefPosition: encodedPosition) ifTrue: [
			^ self decodePosition: encodedPosition
		].
	].
	^ nil
]

{ #category : #initialization }
TRRegisterLiveInterval >> initializeWithRegister: aTRVirtualRegister [
	self assert: aTRVirtualRegister isTRVirtualRegister.

	register := aTRVirtualRegister.
	uses := #().
]

{ #category : #testing }
TRRegisterLiveInterval >> isDefdAt: position [
	| positionEncoding |

	positionEncoding := self encodeDefPosition: position.
	^ uses includes: positionEncoding.
]

{ #category : #testing }
TRRegisterLiveInterval >> isDefdOrUsedAt: position [
	^ (self isDefdAt: position) or: [ self isUsedAt: position ]
]

{ #category : #testing }
TRRegisterLiveInterval >> isUsedAt: position [
	| positionEncoding |

	positionEncoding := self encodeUsePosition: position.
	^ uses includes: positionEncoding.
]

{ #category : #accessing }
TRRegisterLiveInterval >> lastDef [
	"Return the last def position for this interval."

	uses reverseDo: [:encodedPosition |
		(self encodesDefPosition: encodedPosition) ifTrue: [
			^ self decodePosition: encodedPosition
		].
	].
	^ nil
]

{ #category : #accessing }
TRRegisterLiveInterval >> lastUse [
	"Return the last use position for this interval."

	uses reverseDo: [:encodedPosition |
		(self encodesUsePosition: encodedPosition) ifTrue: [
			^ self decodePosition: encodedPosition
		].
	].
	^ nil
]

{ #category : #accessing }
TRRegisterLiveInterval >> lastUseOrDefBefore: position [
	"Return the last use position for this interval smaller than `position`"

	| encodedPosition |

	encodedPosition := self encodeUsePosition: position.
	uses reverseDo: [ :i |
		i < encodedPosition ifTrue: [
			^ self decodePosition: i.
		].
	].
	^ nil.
]

{ #category : #accessing }
TRRegisterLiveInterval >> length [
	^ self stop - self start + 1
]

{ #category : #queries }
TRRegisterLiveInterval >> needsToBeSpilledAt: position [
	^ spillSlot notNil and: [ position = self lastDef ]
]

{ #category : #queries }
TRRegisterLiveInterval >> needsToBeSpilled [
	"Return true, if this interval (register) has to be spilled after its definition"
	^ spillSlot notNil
]

{ #category : #'printing & storing' }
TRRegisterLiveInterval >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut: $(.
	aStream nextPutAll: register name.
	register allocation isNil ifTrue: [ 
		aStream nextPutAll:', *'.
	] ifFalse: [ 
		aStream nextPutAll:', '.
		aStream nextPutAll: register allocation name.
	].
	aStream nextPutAll:', <'.
	self start printOn:aStream.
	aStream nextPutAll:', '.
	self stop printOn:aStream.
	aStream nextPutAll:'>)'.
]

{ #category : #accessing }
TRRegisterLiveInterval >> register [
	^ register
]

{ #category : #accessing }
TRRegisterLiveInterval >> spillSlot [
	^ spillSlot
]

{ #category : #accessing }
TRRegisterLiveInterval >> spillSlot: aTRAutomaticSymbol [
	self assert: (aTRAutomaticSymbol isTRAutomaticSymbol and: [spillSlot isNil])
					| (aTRAutomaticSymbol isNil and: [spillSlot isTRAutomaticSymbol]).

	spillSlot := aTRAutomaticSymbol.
]

{ #category : #accessing }
TRRegisterLiveInterval >> start [
	^ self decodePosition: uses first
]

{ #category : #accessing }
TRRegisterLiveInterval >> stop [
	^ self decodePosition: uses last
]

{ #category : #utilities }
TRRegisterLiveInterval >> usedAt: position [
	| positionEncoding |

	self assert: position isInteger.

	positionEncoding := self encodeUsePosition: position.
	uses isEmpty ifTrue: [
		uses := Array with: positionEncoding.
	] ifFalse: [ 
		(uses includes: positionEncoding) ifFalse: [
			uses := (uses copyWith: positionEncoding) sort.
		].
	].
]

{ #category : #enumerating }
TRRegisterLiveInterval >> usedDo: aBlock [
	"Evaluate `aBlock` for each instruction index where this virtual
	 registers is used (read)."

	 uses do: [:i |
		 (self encodesUsePosition: i) ifTrue: [
			 aBlock value: (self decodePosition: i)
		 ].
	 ].
]
