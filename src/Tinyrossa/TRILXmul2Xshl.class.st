Class {
	#name : #TRILXmul2Xshl,
	#superclass : #TRILRewritingPass,
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #rewriting }
TRILXmul2Xshl >> rewrite: node [
	node opcode isMul ifFalse:[ ^ node ].
	node opcode type isIntegerType ifFalse:[ ^ node ].
	node child2 opcode isLoadConst ifFalse: [ ^ node ].
	node child2 constant isPowerOfTwo ifFalse: [ ^ node ].

	^TRILNode opcode: ishl children:
		{ node child1 .
		  TRILNode opcode: iconst constant: (node child2 constant log:2) asInteger }



]
