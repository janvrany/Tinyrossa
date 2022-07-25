Class {
	#name : #TRILFunctionBuilder,
	#superclass : #TRILBuilder,
	#category : #'Tinyrossa-IL'
}

{ #category : #'building-private' }
TRILFunctionBuilder >> build: opcode arguments: arguments [
	| node |

	node := super build: opcode arguments: arguments.
	opcode isTreeTop ifTrue: [
		compilation il add: node.
	].
	^ node.
]

{ #category : #'defining symbols' }
TRILFunctionBuilder >> defineParameter: name type: type [
	compilation symbolManager defineParameter: name type: type
]
