"
This class is poor man's replacement for 
Squeak / Cuis (and Smalltalk/X) OSProcess. 
"
Class {
	#name : #OSProcess,
	#superclass : #Object,
	#instVars : [
		'process'
	],
	#category : #'Tinyrossa-Compat-Pharo'
}

{ #category : #'instance creation' }
OSProcess class >> command: aString [
	"Run a command in a shell process. Similar to the system(3) call in the standard C library,
	except that aCommandString runs asynchronously in a child process."
	
	^self new 
		command: aString;
		yourself
]

{ #category : #initialization }
OSProcess >> command: aCommandString [
	"Run a command in a shell process. Similar to the system(3) call in the standard C library,
	except that aCommandString runs asynchronously in a child process."
	
	process := OSSUnixSubprocess new command: aCommandString.
	process run.
	
	
]

{ #category : #testing }
OSProcess >> isComplete [
	^process notNil and:[process isComplete]
]

{ #category : #testing }
OSProcess >> isRunning [
	^process notNil and:[process isRunning]
]

{ #category : #actions }
OSProcess >> kill [
	process notNil ifTrue:[
		process kill
	]
]

{ #category : #actions }
OSProcess >> terminate [
	process notNil ifTrue:[
		process terminate
	]
]
