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
TRSymbolic >> systemLinkageClass [
	^ TRSymbolicLinkage
]
