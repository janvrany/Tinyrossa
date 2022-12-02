Class {
	#name : #AJLineStream,
	#superclass : #Object,
	#instVars : [
		'lineStart',
		'writeStream'
	],
	#category : 'AsmJit-Extension'
}

{ #category : #'instance creation' }
AJLineStream class >> on: aWriteStream [
	^ self new
		writeStream: aWriteStream;
		yourself
]

{ #category : #writing }
AJLineStream >> cr [
	self updateLineStart.
	writeStream cr
]

{ #category : #writing }
AJLineStream >> crlf [
	self updateLineStart.
	writeStream crlf
]

{ #category : #'error handling' }
AJLineStream >> doesNotUnderstand: aMessage [
	writeStream
		perform: aMessage selector
		withArguments: aMessage arguments
]

{ #category : #writing }
AJLineStream >> lf [
	self updateLineStart.
	writeStream lf
]

{ #category : #writing }
AJLineStream >> on: aStream [
	^ self new
		writeStream: aStream;
		yourself
]

{ #category : #writing }
AJLineStream >> padColumn: maxCharacterPosition [
	"pad the current line up to maxCharacterPosition with spaces"
	[writeStream position - lineStart < maxCharacterPosition]
		whileTrue: [writeStream space]
]

{ #category : #writing }
AJLineStream >> updateLineStart [
	lineStart := writeStream position
]

{ #category : #writing }
AJLineStream >> writeStream: aWriteStream [
	writeStream := aWriteStream.
	self updateLineStart
]
