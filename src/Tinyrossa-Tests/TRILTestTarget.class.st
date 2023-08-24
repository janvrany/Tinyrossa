Class {
	#name : #TRILTestTarget,
	#superclass : #TRCompilationTarget,
	#category : #'Tinyrossa-Tests-Compile'
}

{ #category : #accessing }
TRILTestTarget >> codeGeneratorClass [
	^ TRILTestCodeGenerator
]

{ #category : #accessing }
TRILTestTarget >> name [
	^ '<triltests>'
]

{ #category : #accessing }
TRILTestTarget >> systemLinkageClass [
	^ TRILTestLinkage
]
