"
I am an abstract printer of assembly instructions, taking care of formatting and syntax conventions. My subclasses implement the conventions for specific platforms.
"
Class {
	#name : #AJFormatter,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'AsmJit-Core'
}

{ #category : #formatting }
AJFormatter class >> format: anObject [
	^ self new format: anObject
]

{ #category : #'instance creation' }
AJFormatter class >> on: aStream [
	^ self basicNew
		initializeWithStream: aStream;
		yourself
]

{ #category : #formatting }
AJFormatter >> format: anObject [
	self visit: anObject.
	^ stream contents
]

{ #category : #'initialize-release' }
AJFormatter >> initialize [
	self initializeWithStream: String new writeStream
]

{ #category : #'initialize-release' }
AJFormatter >> initializeWithStream: aWriteStream [
	super initialize.
	stream := aWriteStream
]

{ #category : #visiting }
AJFormatter >> visit: anObject [
	anObject accept: self
]

{ #category : #visiting }
AJFormatter >> visitOperand: anOperand [
	stream print: anOperand
]
