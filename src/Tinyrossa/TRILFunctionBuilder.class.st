Class {
	#name : #TRILFunctionBuilder,
	#superclass : #TRILBuilder,
	#instVars : [
		'compilation'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #'instance creation' }
TRILFunctionBuilder class >> forCompilation: aTRCompilation [
	^ self basicNew initializeWithCompilation: aTRCompilation
]

{ #category : #'instance creation' }
TRILFunctionBuilder class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #'building-private' }
TRILFunctionBuilder >> build: opcode arguments: arguments [
	| node |

	node := super build: opcode arguments: arguments.
	opcode isTreeTop ifTrue: [
		compilation il add: node.
	].
	^ node.
]

{ #category : #initialization }
TRILFunctionBuilder >> initializeWithCompilation: aTRCompilation [
	compilation := aTRCompilation.
]
