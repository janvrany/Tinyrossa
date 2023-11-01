"
See class TRRegisterDependencies

"
Class {
	#name : #TRRegisterDependency,
	#superclass : #Object,
	#instVars : [
		'vreg',
		'rreg'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRRegisterDependency class >> new [
	^ self shouldNotImplement. "Use virtual:real: instead"
]

{ #category : #'instance creation' }
TRRegisterDependency class >> virtual: vreg real: rreg [
	^ self basicNew initializeWithVirtual: vreg real: rreg
]

{ #category : #initialization }
TRRegisterDependency >> initializeWithVirtual: aTRVirtualRegister real: aTRRealRegister [
	self assert:(aTRVirtualRegister isNil or:[aTRVirtualRegister isTRRegister]).
	self assert: aTRRealRegister isTRRealRegister.

	vreg := aTRVirtualRegister.
	rreg := aTRRealRegister.
]

{ #category : #testing }
TRRegisterDependency >> isDependency [
	^ vreg notNil
]

{ #category : #testing }
TRRegisterDependency >> isTrash [
	^ vreg isNil
]

{ #category : #'printing & storing' }
TRRegisterDependency >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut:$(.
	vreg notNil ifTrue: [
		aStream nextPutAll: vreg name.
		aStream nextPutAll:' -> '.
	] ifFalse: [ 
		aStream nextPutAll: 'thrashing '.
	].
	aStream nextPutAll: rreg name.
	aStream nextPut:$).
]

{ #category : #accessing }
TRRegisterDependency >> rreg [
	^ rreg
]

{ #category : #accessing }
TRRegisterDependency >> vreg [
	^ vreg
]
