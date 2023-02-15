Class {
	#name : #TRRealRegister,
	#superclass : #AcDSLRegister,
	#instVars : [
		'kind'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRRealRegister class >> value: value [
	self error: 'Use value:kind: instead!'
]

{ #category : #'instance creation' }
TRRealRegister class >> value: value kind: kind [
	^ self basicNew initializeWithValue: value kind: kind
]

{ #category : #accessing }
TRRealRegister >> allocation [
	^ self
]

{ #category : #initialization }
TRRealRegister >> initializeWithValue: anAcAsmMapEntry kind: aTRRegisterKind [
	self value: anAcAsmMapEntry.
	kind := aTRRegisterKind
]

{ #category : #accessing }
TRRealRegister >> kind [
	^ kind
]
