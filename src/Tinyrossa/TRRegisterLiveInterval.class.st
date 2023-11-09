"
`TRRegisterLiveInterval` is a helper structure used by
(reverse) linear scan allocators. It keeps information
required by the allocator as it progresses and allocates
registers.

"
Class {
	#name : #TRRegisterLiveInterval,
	#superclass : #Object,
	#instVars : [
		'register',
		'start',
		'stop'
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

{ #category : #initialization }
TRRegisterLiveInterval >> initializeWithRegister: aTRVirtualRegister [
	self assert: aTRVirtualRegister isTRVirtualRegister.

	register := aTRVirtualRegister.
	start := SmallInteger maxVal.
	stop := 0.
]

{ #category : #'printing & storing' }
TRRegisterLiveInterval >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut: $(.
	aStream nextPutAll: register name.
	aStream nextPutAll:', <'.
	start printOn:aStream.
	aStream nextPutAll:', '.
	stop printOn:aStream.
	aStream nextPutAll:'>)'.
]

{ #category : #accessing }
TRRegisterLiveInterval >> register [
	^ register
]

{ #category : #accessing }
TRRegisterLiveInterval >> start [
	^ start
]

{ #category : #accessing }
TRRegisterLiveInterval >> stop [
	^ stop
]

{ #category : #utilities }
TRRegisterLiveInterval >> used: anInteger [
	anInteger < start ifTrue:[
		start := anInteger.
	].
	anInteger > stop ifTrue: [ 
		stop := anInteger.
	].
]
