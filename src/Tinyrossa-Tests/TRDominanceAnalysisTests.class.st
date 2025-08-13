Class {
	#name : #TRDominanceAnalysisTests,
	#superclass : #TRILTestCase,
	#category : #'Tinyrossa-Tests'
}

{ #category : #tests }
TRDominanceAnalysisTests >> test_01 [
	"Taken from Keith D. Cooper, Linda Torczon: Engineering a Compiler Second Edition,
	 Chapter 9, Sectuon 9.2.1 Dominance."

	| cfg b0 b1 b2 b3 b4 b5 b6 b7 b8 |

	cfg := compilation cfg.
	b0 := cfg addBlockNamed: 'B0'.
	b1 := cfg addBlockNamed: 'B1'.
	b2 := cfg addBlockNamed: 'B2'.
	b3 := cfg addBlockNamed: 'B3'.
	b4 := cfg addBlockNamed: 'B4'.
	b5 := cfg addBlockNamed: 'B5'.
	b6 := cfg addBlockNamed: 'B6'.
	b7 := cfg addBlockNamed: 'B7'.
	b8 := cfg addBlockNamed: 'B8'.

	b0 setSuccessor1ForTestingOnly: b1.

	b1 setSuccessor1ForTestingOnly: b2.
	b1 setSuccessor2ForTestingOnly: b5.

	b2 setSuccessor1ForTestingOnly: b3.

	b3 setSuccessor1ForTestingOnly: b4.
	b3 setSuccessor2ForTestingOnly: b1.

	b5 setSuccessor1ForTestingOnly: b6.
	b5 setSuccessor2ForTestingOnly: b8.

	b6 setSuccessor1ForTestingOnly: b7.

	b7 setSuccessor1ForTestingOnly: b3.

	b8 setSuccessor1ForTestingOnly: b7.

	cfg entry: b0.

	TRDominanceAnalysis analyze: cfg.

	self assert: b0 immediateDominator equals: nil.
	self assert: b1 immediateDominator equals: b0.
	self assert: b2 immediateDominator equals: b1.
	self assert: b3 immediateDominator equals: b1.
	self assert: b4 immediateDominator equals: b3.
	self assert: b5 immediateDominator equals: b1.
	self assert: b6 immediateDominator equals: b5.
	self assert: b7 immediateDominator equals: b5.
	self assert: b8 immediateDominator equals: b5.

	self assert: b0 dominators equals: { b0 } asSet.
	self assert: b1 dominators equals: { b0 . b1 } asSet.
	self assert: b2 dominators equals: { b0 . b1 . b2 } asSet.
	self assert: b3 dominators equals: { b0 . b1 . b3 } asSet.
	self assert: b4 dominators equals: { b0 . b1 . b3 . b4 } asSet.
	self assert: b5 dominators equals: { b0 . b1 . b5 } asSet.
	self assert: b6 dominators equals: { b0 . b1 . b5 . b6 } asSet.
	self assert: b7 dominators equals: { b0 . b1 . b5 . b7 } asSet.
	self assert: b8 dominators equals: { b0 . b1 . b5 . b8 } asSet.
]

{ #category : #tests }
TRDominanceAnalysisTests >> test_02 [
	"Taken from Peter Thiemann's 2025 Compiler Construction course [1], [2]

	 [1]: https://proglang.github.io/teaching/25ss/cc/slides/18-loop.pdf
	 [2]: https://proglang.github.io/teaching/25ss/cc.html
	"

	| cfg b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 |

	cfg := compilation cfg.
	b1 := cfg addBlockNamed: 'B1'.
	b2 := cfg addBlockNamed: 'B2'.
	b3 := cfg addBlockNamed: 'B3'.
	b4 := cfg addBlockNamed: 'B4'.
	b5 := cfg addBlockNamed: 'B5'.
	b6 := cfg addBlockNamed: 'B6'.
	b7 := cfg addBlockNamed: 'B7'.
	b8 := cfg addBlockNamed: 'B8'.
	b9 := cfg addBlockNamed: 'B9'.
	b10:= cfg addBlockNamed: 'B10'.
	b11:= cfg addBlockNamed: 'B11'.
	b12:= cfg addBlockNamed: 'B12'.

	b1 setSuccessor1ForTestingOnly: b2.

	b2 setSuccessor1ForTestingOnly: b3.
	b2 setSuccessor2ForTestingOnly: b4.

	b3 setSuccessor1ForTestingOnly: b2.

	b4 setSuccessor1ForTestingOnly: b5.
	b4 setSuccessor2ForTestingOnly: b6.

	b5 setSuccessor1ForTestingOnly: b8.
	b5 setSuccessor2ForTestingOnly: b7.

	b6 setSuccessor1ForTestingOnly: b7.

	b7 setSuccessor1ForTestingOnly: b11.

	b8 setSuccessor1ForTestingOnly: b9.

	b9 setSuccessor1ForTestingOnly: b8.
	b9 setSuccessor2ForTestingOnly: b10.

	b10 setSuccessor1ForTestingOnly: b12.
	b10 setSuccessor2ForTestingOnly: b5.

	b11 setSuccessor1ForTestingOnly: b12.
	b11 setSuccessor2ForTestingOnly: b12.

	cfg entry: b1.

	TRDominanceAnalysis analyze: cfg.

	self assert: b1 immediateDominator equals: nil.
	self assert: b2 immediateDominator equals: b1.
	self assert: b3 immediateDominator equals: b2.
	self assert: b4 immediateDominator equals: b2.
	self assert: b5 immediateDominator equals: b4.
	self assert: b6 immediateDominator equals: b4.
	self assert: b7 immediateDominator equals: b4.
	self assert: b8 immediateDominator equals: b5.
	self assert: b9 immediateDominator equals: b8.
	self assert: b10 immediateDominator equals: b9.
	self assert: b11 immediateDominator equals: b7.
	self assert: b12 immediateDominator equals: b4.
]
