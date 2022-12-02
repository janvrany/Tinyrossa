Class {
	#name : #TRAMD64Instruction,
	#superclass : #AJx64Instruction,
	#instVars : [
		'node'
	],
	#category : #'Tinyrossa-AMD64-Codegen'
}

{ #category : #accessing }
TRAMD64Instruction >> node [
	^ node
]

{ #category : #accessing }
TRAMD64Instruction >> node:aTRILNode [
	node := aTRILNode.
]
