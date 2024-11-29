Class {
	#name : #TRPPC64Linux,
	#superclass : #TRTarget,
	#category : #'Tinyrossa-POWER-Target'
}

{ #category : #'accessing - config - compilation' }
TRPPC64Linux >> codeGeneratorClass [
	^ TRPPC64CodeGenerator
]

{ #category : #accessing }
TRPPC64Linux >> name [
	^ 'powerpc64le-linux'
]

{ #category : #'accessing - config - compilation' }
TRPPC64Linux >> systemLinkageClass [
	^ TRPPC64PSABILinkage
]
