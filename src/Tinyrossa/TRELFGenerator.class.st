Class {
	#name : #TRELFGenerator,
	#superclass : #Object,
	#instVars : [
		'compilation'
	],
	#category : #'Tinyrossa-AOT'
}

{ #category : #'instance creation' }
TRELFGenerator class >> forCompilation: aTRCompilation [
	^ self basicNew initializeWithCompilation: aTRCompilation
]

{ #category : #'instance creation' }
TRELFGenerator class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #'generating output' }
TRELFGenerator >> generateObjectFile [
	| asmgen asmcmd |

	asmgen := TRGASGenerator forCompilation: compilation.
	asmgen generateAssemblerFile.

	asmcmd := compilation config target name , '-gnu-as -g -o ''',compilation config objectFile,''' ''',compilation config objectFile,'.s'''.
	Smalltalk isSmalltalkX ifTrue: [
		(OperatingSystem executeCommand: asmcmd) ifFalse: [ 
			self error: 'Failed to generate object file!'
		].
	] ifFalse: [ 
	Smalltalk isPharo ifTrue: [ 
		(Smalltalk os runCommand: asmcmd) ~~ 0 ifTrue: [ 
			self error: 'Failed to generate object file!'
		].
	] ifFalse:[
		self error: 'Unsupported'
	]].
]

{ #category : #initialization }
TRELFGenerator >> initializeWithCompilation: aTRCompilation [ 
	compilation := aTRCompilation.
]
