Class {
	#name : #TRSymbolic,
	#superclass : #TRTarget,
	#category : #'Tinyrossa-Formal-Compile'
}

{ #category : #accessing }
TRSymbolic >> codeGeneratorClass [
	^ TRSymbolicCodeGenerator
]

{ #category : #accessing }
TRSymbolic >> name [
	^ 'symbolic'
]

{ #category : #'queries - private' }
TRSymbolic >> sizeInBytesOfAddress [
	"Return size of address (pointer) in bytes"

	^ 8 "BOGUS"
]

{ #category : #accessing }
TRSymbolic >> systemLinkageClass [
	^ TRSymbolicLinkage
]
