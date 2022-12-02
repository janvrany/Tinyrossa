Class {
	#name : #TRAMD64JumpInstruction,
	#superclass : #AJx64JumpInstruction,
	#instVars : [
		'node'
	],
	#category : #'Tinyrossa-AMD64-Codegen'
}

{ #category : #accessing }
TRAMD64JumpInstruction >> node [
	^ node
]

{ #category : #accessing }
TRAMD64JumpInstruction >> node: aTRILNode [
	node := aTRILNode.
]
