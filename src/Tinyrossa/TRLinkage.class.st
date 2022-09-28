Class {
	#name : #TRLinkage,
	#superclass : #Object,
	#instVars : [
		'codegen'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRLinkage class >> forCodeGenerator: aTRCodeGenerator [
	^ self basicNew initializeWithCodeGenerator: aTRCodeGenerator
]

{ #category : #initialization }
TRLinkage >> initializeWithCodeGenerator: aTRCodeGenerator [
	codegen := aTRCodeGenerator
]
