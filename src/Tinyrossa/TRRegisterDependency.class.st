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
	self assume: aTRVirtualRegister is: TRVirtualRegister | TRRealRegister | nil.
	self assume: aTRRealRegister is: TRRealRegister.

	vreg := aTRVirtualRegister.
	rreg := aTRRealRegister.
]

{ #category : #testing }
TRRegisterDependency >> isTrash [
	^ vreg isNil
]

{ #category : #testing }
TRRegisterDependency >> isUnsatisfiedDependency [
	"Return true, if
	   (1) this dependency express dependency on
		   real register (a value of virtual register has to be
		   in specified real register)
	AND
	  (ii) this dependecy is not satisfied, that is
		   the virtual register is allocated a different register
		   than required real register"

	^ vreg notNil and: [ vreg allocation ~~ rreg ]
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
