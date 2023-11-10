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
		'instructions',
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
	self assert: availableRegisters notEmpty.

	allocatableRegisters do: [:rReg | 
		(availableRegisters includes: rReg) ifTrue: [ 
			newRange allocation: rReg.
			availableRegisters remove: rReg.
			activeRanges add: newRange.
			^ self.
		].
	].
	self error: 'Should not happen!'.
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> allocateRegisters [
	instructions := codegen instructions.
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
	instructions size downTo: 1 do: [:i |
		| insn |

		insn := instructions at: i.
		codegen virtualRegistersUsedBy: insn do: [:vreg | 
			| liveRange |

			liveRange := liveRanges at: vreg.
			liveRange used: i.
		].
	].
	liveRanges do: [:liveRange | 
		self assert: liveRange start < liveRange stop.
	].

	"
	Step 2. Walk instructions in reverse order and allocate
	registers. Insert moves / reloads and spills as needed.
	"
	liveRanges := liveRanges values asOrderedCollection sort: [ :a :b | a stop < b stop ].

	instructions size downTo: 1 do: [:i |  
		self allocateRegistersAt: i 
	].
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> allocateRegistersAt: insnIndex [
	"Helper to allocate registers for instruction at given index.
	 Also makes ensures both pre and post register dependencies are
	 met at this point.

	 When reading this code, keep in mind that we progress in reverse order, 
	 from last to first instruction!
	"
	| insn deps |

	insn := instructions at: insnIndex.
	deps := insn dependencies.

	"Satisfy post-dependencies, i.e., move values from fixed (real)
	 registers to desired (virtual) registers"
	deps notEmptyOrNil ifTrue: [
		codegen cursor: insnIndex.
		deps post do: [:dep |
			dep isDependency ifTrue:[
				self insertMoveFrom: dep rreg to: dep vreg.
			].
		].
	].

	"Free registers no longer 'live'"
	self expireOldIntervalsAt: insnIndex.

	"Allocate registers going to be live at this point.
	 Here we remove a register for list of live intervals
	 (liveRanges is actually a worklist)."
	[ liveRanges notEmpty and: [ liveRanges last stop == insnIndex ] ] whileTrue: [
		self allocateRegisterFor: liveRanges removeLast.
	].

	"Satisfy pre-dependencies, i.e., move values from (virtual) registers
	 to desired (real) registers. They're placed *before* the instruction
	 being processed, hence the `insnIndex - 1`"
	deps notEmptyOrNil ifTrue: [
		codegen cursor: insnIndex - 1.
		deps pre do: [:dep |
			dep isDependency ifTrue:[
				self insertMoveFrom: dep vreg to: dep rreg.
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
