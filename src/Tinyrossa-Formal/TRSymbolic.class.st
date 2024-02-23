Class {
	#name : #TRSymbolic,
	#superclass : #TRCompilationTarget,
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
