Class {
	#name : #TRLoopAnalysisTests,
	#superclass : #TRILTestCase,
	#category : #'Tinyrossa-Tests'
}

{ #category : #tests }
TRLoopAnalysisTests >> test_01 [
	"Taken from Keith D. Cooper, Linda Torczon: Engineering a Compiler Second Edition,
	 Chapter 9, Section 9.2.1 Dominance."

	| cfg b0 b1 b2 b3 b4 b5 b6 b7 b8 loop |

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
	TRLoopAnalysis analyze: cfg.

	self assert: cfg loops size equals: 1.
	loop := cfg loops anyOne.
	self assert: loop head equals: b1.
	self assert: loop tail equals: b3.
	self assert: loop blocks asArray equals: { b1 . b2 . b3 . b5 . b6 . b7 . b8  }
]

{ #category : #tests }
TRLoopAnalysisTests >> test_02 [
	"Taken from Peter Thiemann's 2025 Compiler Construction course [1], [2], slide 20.

	 [1]: https://proglang.github.io/teaching/25ss/cc/slides/18-loop.pdf
	 [2]: https://proglang.github.io/teaching/25ss/cc.html
	"

	| cfg b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 loop |

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
	TRLoopAnalysis analyze: cfg.

	self assert: cfg loops size equals: 3.

	loop := cfg loops detect: [:l | l head = b2 ].
	self assert: loop tail equals: b3.
	self assert: loop blocks asArray equals: { b2 . b3 }.

	loop := cfg loops detect: [:l | l head = b5 ].
	self assert: loop tail equals: b10.
	self assert: loop blocks asArray equals: { b5 . b8 . b9 . b10 }.

	loop := cfg loops detect: [:l | l head = b8 ].
	self assert: loop tail equals: b9.
	self assert: loop blocks asArray equals: { b8 . b9 }
]

{ #category : #tests }
TRLoopAnalysisTests >> test_18_1b [
	"Taken from Peter Thiemann's 2025 Compiler Construction course [1,2].
	 slide Example Loops 18-1b.

	 [1]: https://proglang.github.io/teaching/25ss/cc/slides/18-loop.pdf
	 [2]: https://proglang.github.io/teaching/25ss/cc.html
	"

	| cfg b0 b1 b2 b3 b4 b5 b6 b7 loop |

	cfg := compilation cfg.
	b0 := cfg addBlockNamed: 'B0'.
	b1 := cfg addBlockNamed: 'B1'.
	b2 := cfg addBlockNamed: 'B2'.
	b3 := cfg addBlockNamed: 'B3'.
	b4 := cfg addBlockNamed: 'B4'.
	b5 := cfg addBlockNamed: 'B5'.
	b6 := cfg addBlockNamed: 'B6'.
	b7 := cfg addBlockNamed: 'B7'.

	b0 setSuccessor1ForTestingOnly: b1.

	b1 setSuccessor1ForTestingOnly: b2.

	b2 setSuccessor1ForTestingOnly: b3.
	b2 setSuccessor2ForTestingOnly: b5.

	b3 setSuccessor1ForTestingOnly: b4.
	b3 setSuccessor2ForTestingOnly: b6.

	b4 setSuccessor1ForTestingOnly: b1.
	b4 setSuccessor2ForTestingOnly: b7.

	cfg entry: b0.

	TRDominanceAnalysis analyze: cfg.
	TRLoopAnalysis analyze: cfg.

	self assert: cfg loops size equals: 1.

	loop := cfg loops detect: [:l | l head = b1 ].
	self assert: loop tail equals: b4.
	self assert: loop blocks asArray equals: { b1 . b2 . b3 . b4 }.
]

{ #category : #tests }
TRLoopAnalysisTests >> test_18_1c [
	"Taken from Peter Thiemann's 2025 Compiler Construction course [1,2].
	 slide Example Loops 18-1c.

	 [1]: https://proglang.github.io/teaching/25ss/cc/slides/18-loop.pdf
	 [2]: https://proglang.github.io/teaching/25ss/cc.html
	"

	| cfg b0 b1 b2 b3 b4 loop |

	cfg := compilation cfg.
	b0 := cfg addBlockNamed: 'B0'.
	b1 := cfg addBlockNamed: 'B1'.
	b2 := cfg addBlockNamed: 'B2'.
	b3 := cfg addBlockNamed: 'B3'.
	b4 := cfg addBlockNamed: 'B4'.

	b0 setSuccessor1ForTestingOnly: b1.

	b1 setSuccessor1ForTestingOnly: b2.
	b1 setSuccessor2ForTestingOnly: b3.

	b2 setSuccessor1ForTestingOnly: b1.
	b2 setSuccessor2ForTestingOnly: b4.

	b3 setSuccessor1ForTestingOnly: b1.
	b3 setSuccessor2ForTestingOnly: b4.

	cfg entry: b0.

	TRDominanceAnalysis analyze: cfg.
	TRLoopAnalysis analyze: cfg.

	self assert: cfg loops size equals: 2.

	loop := cfg loops detect: [:l | l head = b1 and:[l tail = b2 ] ].
	self assert: loop blocks asArray equals: { b1 . b2 }.

	loop := cfg loops detect: [:l | l head = b1 and:[l tail = b3 ] ].
	self assert: loop blocks asArray equals: { b1 . b3 }.
]

{ #category : #tests }
TRLoopAnalysisTests >> test_18_1d [
	"Taken from Peter Thiemann's 2025 Compiler Construction course [1,2].
	 slide Example Loops 18-1d.

	 [1]: https://proglang.github.io/teaching/25ss/cc/slides/18-loop.pdf
	 [2]: https://proglang.github.io/teaching/25ss/cc.html
	"

	| cfg b0 b1 b2 b3 b4 b5 loop |

	cfg := compilation cfg.
	b0 := cfg addBlockNamed: 'B0'.
	b1 := cfg addBlockNamed: 'B1'.
	b2 := cfg addBlockNamed: 'B2'.
	b3 := cfg addBlockNamed: 'B3'.
	b4 := cfg addBlockNamed: 'B4'.
	b5 := cfg addBlockNamed: 'B5'.

	b0 setSuccessor1ForTestingOnly: b1.

	b1 setSuccessor1ForTestingOnly: b2.

	b2 setSuccessor1ForTestingOnly: b3.

	b3 setSuccessor1ForTestingOnly: b4.
	b3 setSuccessor2ForTestingOnly: b2.

	b4 setSuccessor1ForTestingOnly: b5.
	b4 setSuccessor2ForTestingOnly: b1.

	cfg entry: b0.

	TRDominanceAnalysis analyze: cfg.
	TRLoopAnalysis analyze: cfg.

	self assert: cfg loops size equals: 2.

	loop := cfg loops detect: [:l | l head = b1 ].
	self assert: loop tail equals: b4.
	self assert: loop blocks asArray equals: { b1 . b2 . b3 . b4 }.

	loop := cfg loops detect: [:l | l head = b2 ].
	self assert: loop tail equals: b3.
	self assert: loop blocks asArray equals: { b2 . b3 }.
]

{ #category : #tests }
TRLoopAnalysisTests >> test_18_1e [
	"Taken from Peter Thiemann's 2025 Compiler Construction course [1,2].
	 slide Example Loops 18-1e.

	 [1]: https://proglang.github.io/teaching/25ss/cc/slides/18-loop.pdf
	 [2]: https://proglang.github.io/teaching/25ss/cc.html
	"

	| cfg b0 b1 b2 b3 b4 b5 b6 b7 loop |

	cfg := compilation cfg.
	b0 := cfg addBlockNamed: 'B0'.
	b1 := cfg addBlockNamed: 'B1'.
	b2 := cfg addBlockNamed: 'B2'.
	b3 := cfg addBlockNamed: 'B3'.
	b4 := cfg addBlockNamed: 'B4'.
	b5 := cfg addBlockNamed: 'B5'.
	b6 := cfg addBlockNamed: 'B6'.
	b7 := cfg addBlockNamed: 'B7'.

	b0 setSuccessor1ForTestingOnly: b1.

	b1 setSuccessor1ForTestingOnly: b2.

	b2 setSuccessor1ForTestingOnly: b3.
	b2 setSuccessor2ForTestingOnly: b4.

	b3 setSuccessor1ForTestingOnly: b7.
	b3 setSuccessor2ForTestingOnly: b5.

	b4 setSuccessor2ForTestingOnly: b5.

	b5 setSuccessor1ForTestingOnly: b6.
	b5 setSuccessor2ForTestingOnly: b2.

	b6 setSuccessor1ForTestingOnly: b7.
	b6 setSuccessor2ForTestingOnly: b1.

	cfg entry: b0.

	TRDominanceAnalysis analyze: cfg.
	TRLoopAnalysis analyze: cfg.

	self assert: cfg loops size equals: 2.

	loop := cfg loops detect: [:l | l head = b1 ].
	self assert: loop tail equals: b6.
	self assert: loop blocks asArray equals: { b1 . b2 . b3 . b5  . b6 . b4  }.

	loop := cfg loops detect: [:l | l head = b2 ].
	self assert: loop tail equals: b5.
	self assert: loop blocks asArray equals: { b2 . b3 . b5 . b4 }.
]

{ #category : #tests }
TRLoopAnalysisTests >> test_MaskRay_2025_01_20 [
	"Taken from MaskRay [1]:

	digraph G{
		0->1
		1->2
		1->7
		2->3
		2->4
		3->2
		8->3
		4->5
		4->6
		5->4
		6->1
		6->6
	}


	 [1]: https://maskray.me/blog/2025-01-20-natural-loops
	"

	| cfg b0 b1 b2 b3 b4 b5 b6 b7 loop |

	cfg := compilation cfg.
	b0 := cfg addBlockNamed: 'B0'.
	b1 := cfg addBlockNamed: 'B1'.
	b2 := cfg addBlockNamed: 'B2'.
	b3 := cfg addBlockNamed: 'B3'.
	b4 := cfg addBlockNamed: 'B4'.
	b5 := cfg addBlockNamed: 'B5'.
	b6 := cfg addBlockNamed: 'B6'.
	b7 := cfg addBlockNamed: 'B7'.

	b0 setSuccessor1ForTestingOnly: b1.

	b1 setSuccessor1ForTestingOnly: b2.
	b2 setSuccessor2ForTestingOnly: b7.

	b2 setSuccessor1ForTestingOnly: b4.
	b2 setSuccessor2ForTestingOnly: b3.

	b3 setSuccessor1ForTestingOnly: b2.

	b4 setSuccessor1ForTestingOnly: b5.
	b4 setSuccessor2ForTestingOnly: b6.

	b5 setSuccessor1ForTestingOnly: b4.

	b6 setSuccessor1ForTestingOnly: b1.
	b6 setSuccessor2ForTestingOnly: b6.

	cfg entry: b0.

	TRDominanceAnalysis analyze: cfg.
	TRLoopAnalysis analyze: cfg.

	self assert: cfg loops size equals: 4.

	loop := cfg loops detect: [:l | l head = b1 ].
	self assert: loop tail equals: b6.
	self assert: loop blocks asArray equals: { b1 . b2 . b4 . b5 . b6 . b3 }.

	loop := cfg loops detect: [:l | l head = b2 ].
	self assert: loop tail equals: b3.
	self assert: loop blocks asArray equals: { b2 . b3  }.

	loop := cfg loops detect: [:l | l head = b4 ].
	self assert: loop tail equals: b5.
	self assert: loop blocks asArray equals: { b4 . b5  }.

	loop := cfg loops detect: [:l | l head = b6 ].
	self assert: loop tail equals: b6.
	self assert: loop blocks asArray equals: { b6 }.
]
