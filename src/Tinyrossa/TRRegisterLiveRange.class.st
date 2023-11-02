Class {
	#name : #TRRegisterLiveRange,
	#superclass : #Object,
	#instVars : [
		'register',
		'start',
		'stop'
	],
	#category : #'Tinyrossa-Codegen-Register Allocation'
}

{ #category : #'instance creation' }
TRRegisterLiveRange class >> forRegister: aTRVirtualRegister [
	^ self basicNew initializeWithRegister: aTRVirtualRegister
]

{ #category : #'instance creation' }
TRRegisterLiveRange class >> new [
	^ self shouldNotImplement. "Use #forRegister: instead"
]

{ #category : #accessing }
TRRegisterLiveRange >> allocation [
	^ register allocation
]

{ #category : #accessing }
TRRegisterLiveRange >> allocation: aTRRealRegister [
	register allocation: aTRRealRegister
]

{ #category : #initialization }
TRRegisterLiveRange >> initializeWithRegister: aTRVirtualRegister [
	self assert: aTRVirtualRegister isTRVirtualRegister.

	register := aTRVirtualRegister.
	start := SmallInteger maxVal.
	stop := 0.
]

{ #category : #'printing & storing' }
TRRegisterLiveRange >> printOn:aStream [
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
TRRegisterLiveRange >> start [
	^ start
]

{ #category : #accessing }
TRRegisterLiveRange >> stop [
	^ stop
]

{ #category : #utilities }
TRRegisterLiveRange >> used: anInteger [
	anInteger < start ifTrue:[
		start := anInteger.
	].
	anInteger > stop ifTrue: [ 
		stop := anInteger.
	].
]
