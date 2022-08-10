"
A custom instruction class that keeps back-reference to
node for which codegen emitted it.

"
Class {
	#name : #TRRV64GInstruction,
	#superclass : #ProcessorInstruction,
	#instVars : [
		'node'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #accessing }
TRRV64GInstruction >> node [
	^ node
]

{ #category : #accessing }
TRRV64GInstruction >> node:aTRILNode [
	self assert: node isNil.
	node := aTRILNode.
]
