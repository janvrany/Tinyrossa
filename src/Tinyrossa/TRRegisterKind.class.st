Class {
	#name : #TRRegisterKind,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRRegisterKind class >> named: aString [
	^ self basicNew initializeWithName: aString

]

{ #category : #initialization }
TRRegisterKind >> initializeWithName: aString [
	name := aString

]

{ #category : #accessing }
TRRegisterKind >> name [
	^ name
]

{ #category : #'printing & storing' }
TRRegisterKind >> printOn:aStream [
	name printOn:aStream.

]
