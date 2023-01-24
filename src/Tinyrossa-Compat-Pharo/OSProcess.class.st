"
This class is simple drop-in replacement for `OSProcess` from Squeak, 
Cuis and Smalltalk/X based on OSSubprocess package. 

Caveat: only APIs used in Tinyrossa are implemented.
"
Class {
	#name : #OSProcess,
	#superclass : #Object,
	#instVars : [
		'process'
	],
	#category : #'Tinyrossa-Compat-Pharo'
}

{ #category : #'external command processing' }
OSProcess class >> command: aString [
	"Run a command in a shell process. Similar to the system(3) call in the standard C library,
	 except that aString runs asynchronously in a child process."
	
	^self new command: aString
]

{ #category : #accesing }
OSProcess >> command: aString [
	process shellCommand: aString. 
	
]

{ #category : #initialization }
OSProcess >> initialize [
	process := OSSUnixSubprocess new.
]

{ #category : #testing }
OSProcess >> isComplete [ 
	^process isComplete
]

{ #category : #testing }
OSProcess >> isRunning [ 
	^process isRunning
]

{ #category : #running }
OSProcess >> startProcess [
	process run
]

{ #category : #'terminating child' }
OSProcess >> terminate [
	process terminate
]
