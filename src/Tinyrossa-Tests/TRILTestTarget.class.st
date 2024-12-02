Class {
	#name : #TRILTestTarget,
	#superclass : #TRTarget,
	#category : #'Tinyrossa-Tests-Compile'
}

{ #category : #'accessing - config - compilation' }
TRILTestTarget >> codeGeneratorClass [
	^ TRILTestCodeGenerator
]

{ #category : #queries }
TRILTestTarget >> endian [
	^ self shouldNotImplement
]

{ #category : #accessing }
TRILTestTarget >> name [
	^ '<triltests>'
]

{ #category : #'accessing - config - compilation' }
TRILTestTarget >> systemLinkageClass [
	^ TRILTestLinkage
]
