Class {
	#name : #TRPPC64Linux,
	#superclass : #TRCompilationTarget,
	#category : #'Tinyrossa-POWER-Compile'
}

{ #category : #accessing }
TRPPC64Linux >> codeGeneratorClass [
	^ TRPPC64CodeGenerator
]

{ #category : #accessing }
TRPPC64Linux >> name [
	^ 'powerpc64le-linux'
]

{ #category : #accessing }
TRPPC64Linux >> systemLinkageClass [
	^ TRPPC64PSABILinkage
]
