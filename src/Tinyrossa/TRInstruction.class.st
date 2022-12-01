"
A custom instruction class that keeps back-reference to
node for which codegen emitted it.

"
Class {
	#name : #TRInstruction,
	#superclass : #ProcessorInstruction,
	#instVars : [
		'node'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #accessing }
TRInstruction >> node [
	^ node
]

{ #category : #accessing }
TRInstruction >> node:aTRILNode [
	self assert: node isNil.
	node := aTRILNode.
]
