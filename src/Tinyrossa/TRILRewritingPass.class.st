Class {
	#name : #TRILRewritingPass,
	#superclass : #TRILOptimizationPass,
	#instVars : [
		'seen'
	],
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #evaluation }
TRILRewritingPass >> evaluate: node [
	(seen includes: node) ifTrue: [ 
		"Make sure we evaluate (rewrite) each node only once"
		^ node.
	].
	seen add: node.

	node children do: [:original |
		| simplified |

		simplified := self evaluate: original.
		simplified ~~ original ifTrue: [ 
			node replace: original with: simplified
		].
	].
	^ self rewrite: (super evaluate: node)
]

{ #category : #evaluation }
TRILRewritingPass >> evaluateChildren: node [
	"Nothing to do, childrens are evaluated
	 in evaluate:"
]

{ #category : #rewriting }
TRILRewritingPass >> rewrite: aTRILNode [
	"Possibly rewrite given node and return either
		* a new node that should be used instead of this one or,
		* `aTRILNode` (the parameter) if this node should be left
		  intact."

	^ self subclassResponsibility
]

{ #category : #optimizing }
TRILRewritingPass >> run [
	seen := Set new.
	compilation cfg preorderDo: [ :block | self runOn: block ].
]

{ #category : #optimizing }
TRILRewritingPass >> runOn: aTRILBlock [
	aTRILBlock treetops copy do: [ :original |
		| simplified |

		simplified := self evaluate: original.
		simplified ~~ original ifTrue: [ 
			aTRILBlock replace: original with: simplified
		].
	].
]
