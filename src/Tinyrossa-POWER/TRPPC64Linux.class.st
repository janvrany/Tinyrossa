Class {
	#name : #TRPPC64Linux,
	#superclass : #TRTarget,
	#category : #'Tinyrossa-POWER-Target'
}

{ #category : #'accessing - config - compilation' }
TRPPC64Linux >> codeGeneratorClass [
	^ TRPPC64CodeGenerator
]

{ #category : #queries }
TRPPC64Linux >> endian [

	"FIXME: allow for BE PPC"
	^ Endian little
]

{ #category : #accessing }
TRPPC64Linux >> name [
	^ 'powerpc64le-linux'
]

{ #category : #'queries - private' }
TRPPC64Linux >> sizeInBytesOfAddress [
	^ 8
]

{ #category : #'accessing - config - compilation' }
TRPPC64Linux >> systemLinkageClass [
	^ TRPPC64PSABILinkage
]
