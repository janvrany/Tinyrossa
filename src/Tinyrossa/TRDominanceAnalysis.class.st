Class {
	#name : #TRDominanceAnalysis,
	#superclass : #Object,
	#category : #'Tinyrossa-Optimizer-Loops'
}

{ #category : #analyzing }
TRDominanceAnalysis class >> analyze: aTRCFG [
	^ self new analyze: aTRCFG
]

{ #category : #analyzing }
TRDominanceAnalysis >> analyze: aTRCFG [
	"Compute dominator tree. Once finished, in immediate dominator
	 is stored in each (reachable) block (see #immediateDominator)."

	| blocks dominance initial |

	blocks := aTRCFG blocks.
	dominance := Dictionary new.

	"Initialize dominance sets for each block"
	initial := blocks asSet.
	blocks do: [:block | dominance at: block put: initial ].
	dominance at: aTRCFG entry put: (Set with: aTRCFG entry).

	"Compute dominance sets. This uses iterative fixpoint algorithm (see
	 for example [1], Section 9.2.1).

	 [1] Keith D. Cooper, Linda Torczon: Engineering a Compiler Second Edition"
	[
		| changed |

		changed := false.
		blocks do: [:block |
			| temp |

			temp := Set new
						add: block;
						addAll: (self intersectionOfAll: (block precedessors collect:[:pred | dominance at: pred]));
						yourself.

			temp ~= (dominance at: block) ifTrue: [
				dominance at: block put: temp.
				changed := true.
			].
		].
		changed.
	] whileTrue.

	"Now for each block compute immediate dominator:

		Given a node n in a flow graph, the set of nodes that
		strictly dominate n is given by (Dom(n) − n). The node
		in that set that is closest to n is called n’s immediate
		dominator, denoted IDom(n).

	To easily find the 'closest' node without traversing the CFG,
	we exploit the fast that blocks are ordered in pre-order manner,
	meaning parent first and then children, starting with entry block.

	So the 'closest' block to a given block at given index is the
	one with highest index smaller then given block's index.

	Here we do it reverse so we can conveniently use existing method
	#indexOfAnyOf:startingAt:ifAbsent:.
	"
	blocks := blocks reversed.
	self assert: blocks last == aTRCFG entry.
	blocks withIndexDo: [ :block :blockIndex |
		| idomIndex |

		idomIndex := blocks indexOfAnyOf: (dominance at: block) startingAt: blockIndex + 1 ifAbsent: 0.
		idomIndex ~= 0 ifTrue: [
			block setSetImmediateDominator: (blocks at: idomIndex)
		].
	].
]

{ #category : #private }
TRDominanceAnalysis >> intersectionOfAll: arrayOfSets [
	| intersection |

	arrayOfSets isEmpty ifTrue:[ ^ Set new ].

	intersection := arrayOfSets first.
	2 to: arrayOfSets size do: [:i |
		intersection := intersection intersect: (arrayOfSets at: i).
	].
	^ intersection
]
