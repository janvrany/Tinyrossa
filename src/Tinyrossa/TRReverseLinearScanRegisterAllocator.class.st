"
`TRReverseLinearScanRegisterAllocator` is the default allocator used in Tinyrossa. 

It's straightforward reimplementation from original 1999 paper [1] with one
small change: the allocation progresses in reverse order. That is, from last 
instruction towards first one.

Note that there's no need to deal with virtual registers being used across
basic block boundary - in Tinyrossa (as well as in Testarossa), the only way
to transfer value from one (extended) block to another is via `?store` and
`?load` IL operations.

[1]: MASSIMILIANO POLETTO and VIVEK SARKAR: Linear Scan Register Allocation
	 http://web.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf

"
Class {
	#name : #TRReverseLinearScanRegisterAllocator,
	#superclass : #TRRegisterAllocator,
	#instVars : [
		'liveRanges',
		'activeRanges',
		'allocatableRegisters',
		'availableRegisters'
	],
	#category : #'Tinyrossa-Codegen-Register Allocation'
}

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> allocateRegisterFor: newRange [
	self assert: newRange allocation isNil.

	allocatableRegisters do: [:rReg | 
		(availableRegisters includes: rReg) ifTrue: [ 
			newRange allocation: rReg.
			availableRegisters remove: rReg.
			^ self.
		].
	].
	self error: 'Should not happen!'.
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> allocateRegisters [
	| insns |

	insns := codegen instructions.
	allocatableRegisters := codegen linkage allocatableRegisters.
	availableRegisters := allocatableRegisters asSet.  
	activeRanges := SortedCollection sortBlock: [ :a :b | a start < b start ].

	"Step 1 - compute live intervals."
	liveRanges := Dictionary new.
	codegen virtualRegisters do: [:vReg | 
		liveRanges at: vReg put: (TRRegisterLiveRange forRegister: vReg).
	].
	"Here we compute live intervals in reverse order although
	 we need not to."
	insns size downTo: 1 do: [:i |
		| insn |

		insn := insns at: i.
		codegen virtualRegistersUsedBy: insn do: [:vreg | 
			| liveRange |

			liveRange := liveRanges at: vreg.
			liveRange used: i.
		].
	].

	"
	Step 2. Allocate registers using collected intervals.
	"
	liveRanges := liveRanges values sort: [ :a :b | a stop < b stop ].
	liveRanges reverseDo: [:liveRange |
		self assert: liveRange start < liveRange stop.
		
		self expireOldIntervals: liveRange.
		availableRegisters isEmpty ifTrue: [ 
			self error: 'Spilling not supported yet!'
		] ifFalse: [ 
			self allocateRegisterFor: liveRange.
			activeRanges add: liveRange
		].
	].

	"
	Step 3. Insert register moves to satisfy register dependencies
	"
	insns size downTo: 1 do: [:i |
		| insn deps |

		insn := insns at: i.
		deps := insn dependencies.

		deps notEmptyOrNil ifTrue: [ 
			codegen cursor: i.
			deps post do: [:dep |
				dep isDependency ifTrue:[ 
					self insertMoveFrom: dep rreg to: dep vreg.
				].
			].

			codegen cursor: i - 1.
			deps pre do: [:dep |
				dep isDependency ifTrue:[ 
					self insertMoveFrom: dep vreg to: dep rreg.
				].
			].
		].
	].
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> expireOldIntervals: newRange [
	^ self expireOldIntervalsAt: newRange stop
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> expireOldIntervalsAt: i [
	[ activeRanges notEmpty and:[ activeRanges last start >= i ] ] whileTrue: [
		| expiredRange |

		expiredRange := activeRanges removeLast.
		availableRegisters add: expiredRange allocation
	].
]
