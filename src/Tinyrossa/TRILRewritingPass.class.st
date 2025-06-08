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
	| rewritten |

	(seen includesKey: node) ifTrue: [
		"If the node was already evaluated (and possibly rewritten),
		 return the node it was rewritten to"
		^ seen at: node.
	].

	node children do: [:original |
		| rewritten |

		rewritten := self evaluate: original.
		rewritten ~~ original ifTrue: [
			node replace: original with: rewritten
		].
	].

	rewritten := self rewrite: (super evaluate: node).
	seen at: node put: rewritten.
	^ rewritten
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
TRILRewritingPass >> runOn: aTRILBlock [
	seen := Dictionary new.
	aTRILBlock treetops copy do: [ :original |
		| simplified |

		simplified := self evaluate: original.
		simplified ~~ original ifTrue: [ 
			aTRILBlock replace: original with: simplified
		].
	].
]
