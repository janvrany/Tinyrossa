Class {
	#name : #TRILRewritingPass,
	#superclass : #TRILOptimizationPass,
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #evaluation }
TRILRewritingPass >> evaluate: node [
	node children do: [:original |
		| simplified |

		simplified := self evaluate: original.
		simplified ~~ original ifTrue: [ 
			node replace: original with: simplified
		].
	].
	^ super evaluate: node
]

{ #category : #evaluation }
TRILRewritingPass >> evaluateChildren: node [
	"Nothing to do, childrens are evaluated
	 in evaluate:"
]

{ #category : #rewriting }
TRILRewritingPass >> rewrite: aTRILNode [
	^ aTRILNode
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
