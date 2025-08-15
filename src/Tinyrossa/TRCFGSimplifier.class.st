"
This optimizaton pass modifies the CFG to eliminate useless control flow.

The algorithm is taken from 'Engineering A Compiler, 2nd Edition' by Cooper 
and Torczon, see Section 10.2, page 547 with one more tweak that eliminates
goto's - see #tryGoto:.

Goto elimination basically simplifies implementation of other steps
as it normalizes all block that do not contain branch to use successor1
(fall-through successor) so other steps count on this. Note, that `goto`
might be reintroduced later when linearizing the code (see 
`TRCFG >> #linearize`).

"
Class {
	#name : #TRCFGSimplifier,
	#superclass : #TROptimizationPass,
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #private }
TRCFGSimplifier >> relink: oldSuccessor to: newSuccessor in: block [
	self assume: oldSuccessor is: TRILBlock | [ :v | v precedessors includes: block ].
	self assume: oldSuccessor is: TRILBlock.
	self assume: block is: TRILBlock.

	block successor1 == oldSuccessor ifTrue: [ 
		block setSuccessor1: newSuccessor.
	].
	block successor2 == oldSuccessor ifTrue: [ 
		| label branch |

		self assert: newSuccessor notNil.

		label := compilation symbolManager defineLabel: newSuccessor.            
		branch := block treetops detect:[:node | node opcode isBranching].
		block replace: branch with: (TRILNode opcode: branch opcode symbol: label children: branch children).

		self assert: block successor2 == newSuccessor.
	].

	self assert: (newSuccessor precedessors includes: block).
]

{ #category : #optimizing }
TRCFGSimplifier >> run [
	[ self simplify ] whileTrue.
	compilation cfg prune.
]

{ #category : #optimizing }
TRCFGSimplifier >> simplify [
	"Perform one pass over CFG and try to simplify it.
	 Return `true` if CFG has been changed, `false` otherwise."

	| modified |

	modified := false.
	compilation cfg postorderDo: [ :block |
		(self tryGoto: block) ifTrue: [ 
			modified := true.
		].

		(self tryFold: block) ifTrue: [ 
			modified := true.
		].

		(self tryCombine: block) ifTrue: [ 
			modified := true.
		].

		(self tryRemove: block) ifTrue: [ 
			modified := true.
		].

		(self tryHoist: block) ifTrue: [ 
			modified := true.
		].
	].
	^ modified.
]

{ #category : #operations }
TRCFGSimplifier >> tryCombine: block [
	"Try to combine blocks. 

	 See Engineering A Compiler, 2nd Edition by Cooper and Torczon,
		 Section 10.2, page 547.
	"
			
	"If 1. block has successor1 and
		2. at most of block and its successor1 contains branch and
		3. blocks successor1 has only one precedessor..."
	
	("1"block successor1 notNil 
	 "2" and: [ (block isBranching and:[block successor1 isBranching]) not
	 "3" and: [ block successor1 precedessors size == 1 ]]) ifTrue: [ 
		"...then block and its successor1 can be combined"
		| first second treetops |

		"We're going to merge 'second' block into the 'first' one, making
		 the 'second' one empty."
		first := block.
		second := block successor1.

		treetops := second treetops copy.
		(2 to: treetops size - 1) do: [:i | 
			| treetop |

			treetop := treetops at: i.
			treetops at: i put: treetop.
			second remove: treetop.            
		].

		self assert: second isEmpty.

		(2 to: treetops size - 1) do: [:i | 
			| treetop |

			treetop := treetops at: i.
			first add: treetop.
		].

		^ true.    
	 ].
	 ^ false
]

{ #category : #operations }
TRCFGSimplifier >> tryFold: block [
	"Try to fold block. 

	 See Engineering A Compiler, 2nd Edition by Cooper and Torczon,
		 Section 10.2, page 547.
	"
	(block successor1 notNil and: [ block successor1 == block successor2 ]) ifTrue: [ 
		self assert: block treetopsLast opcode isBranch.

		block remove: block treetopsLast.
		^ true.
	].
	^ false
]

{ #category : #operations }
TRCFGSimplifier >> tryGoto: block [
	"If block ends with goto, remove it and  use successor1 (fall-through)
	 to transfer control to target's block.

	 This enables #tryRemove: to remove the block completely if
	 it contained only single goto.

	 It also enables #tryCombine: to combine block that 'goto' another
	 block."

	(block notEmpty and:[block treetopsLast opcode isGoto]) ifTrue: [
		| last |

		self assert: block successor1 isNil.
		self assert: block successor2 notNil.

		last := block treetopsLast.
		block remove: last.
		block setSuccessor1: last symbol block.
		^ true.
	].
	^ false
]

{ #category : #operations }
TRCFGSimplifier >> tryHoist: block [
	"Try to fold block. 

	 See Engineering A Compiler, 2nd Edition by Cooper and Torczon,
		 Section 10.2, page 547.
	"

	"Not implemented'"
	^ false
]

{ #category : #operations }
TRCFGSimplifier >> tryRemove: block [
	"Try to remove block. 

	 See Engineering A Compiler, 2nd Edition by Cooper and Torczon,
		 Section 10.2, page 547.
	"

	block isEmpty ifTrue: [ 
		self assert: block successor2 isNil.

		block precedessors do: [:precedessor |
			self relink: block to: block successor1 in: precedessor
		].
	
		"Handle the case we're removing (empty) entry block. 
		 In this case we have to set CFG's entry block to
		 successor1 - but only if there's one, otherwise we'd
		 make CFG with no entry block which is illegal!"
		block == compilation cfg entry ifTrue:[
			block successor1	 notNil ifTrue:[
				compilation cfg entry: block successor1
			]
		].
	
		^ true.
	].
	^ false.
]
