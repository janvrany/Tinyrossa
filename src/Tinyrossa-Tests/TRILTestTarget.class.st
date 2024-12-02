Class {
	#name : #TRILTestTarget,
	#superclass : #TRTarget,
	#category : #'Tinyrossa-Tests-Compile'
}

{ #category : #'accessing - config - compilation' }
TRILTestTarget >> codeGeneratorClass [
	^ TRILTestCodeGenerator
]

{ #category : #accessing }
TRILTestTarget >> name [
	^ '<triltests>'
]

{ #category : #'queries - private' }
TRILTestTarget >> sizeInBytesOfAddress [
	^ self shouldNotImplement
]

{ #category : #'accessing - config - compilation' }
TRILTestTarget >> systemLinkageClass [
	^ TRILTestLinkage
]
