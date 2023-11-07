"
`TRLinearScanRegisterAllocator` is the old register allocator superseded by
`TRReverseLinearScanRegisterAllocator`.

It's straightforward reimplementation from original 1999 paper [1] with one
small change: when computing live intervals, use either 2 * i (where i is instruction
index) if the register is read or ( 2 * i ) + 1 if the register is modified.
For example, consider following code: 

  i=0:  reg_B = reg A - 1
  i=1:  reg_C = reg_B * reg_A
  i=2:  reg_D = reg_C

then live intervals are: 
  reg_A = <0, 2>
  reg_B = <1, 2>
  reg_C = <3, 4>
  reg_D = <5, ...>

This helps on 3-address architectures (RISCs) to (for example) allocate
reg_C (used in instruction i=1) into the same physical register as 
reg_B or reg_A - at the start of live interval for reg_C (3) reg_B and reg_A
are already free (since their live interval ends at 2).

Note that there's no need to deal with virtual registers being used across
basic block boundary - in Tinyrossa (as well as in Testarossa), the only way
to transfer value from one (extended) block to another is via `?store` and
`?load` IL operations.

[1]: MASSIMILIANO POLETTO and VIVEK SARKAR: Linear Scan Register Allocation
	 http://web.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf

"
Class {
	#name : #TRLinearScanRegisterAllocator,
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
TRLinearScanRegisterAllocator >> allocateRegisterFor: aTRVirtualRegister [
	self assert: aTRVirtualRegister allocation isNil.

	allocatableRegisters do: [:rReg | 
		(availableRegisters includes: rReg) ifTrue: [ 
			aTRVirtualRegister allocation: rReg.
			availableRegisters remove: rReg.
			^ self.
		].
	].
	self error: 'Should not happen!'.
]

{ #category : #allocation }
TRLinearScanRegisterAllocator >> allocateRegisters [
	| insns |

	insns := codegen instructions.
	allocatableRegisters := codegen linkage allocatableRegisters.
	availableRegisters := allocatableRegisters asSet.
	activeRanges := SortedCollection sortBlock: [ :a :b | a stop < b stop ].

	"Step 1 - compute live intervals."
	liveRanges := Dictionary new.
	codegen virtualRegisters do: [:vReg | 
		liveRanges at: vReg put: (TRRegisterLiveRange forRegister: vReg).
	].
	1 to: insns size do: [:i |
		| insn |
		insn := insns at: i.
		codegen virtualRegistersReadBy: insn do: [:vreg | 
			| liveRange |

			liveRange := liveRanges at: vreg.
			"See class comment why we use `i * 2`."
			liveRange used: i * 2.
		].
		codegen virtualRegistersAssignedBy: insn do: [:vreg | 
			| liveRange |

			liveRange := liveRanges at: vreg.
			"See class comment why we use `(i * 2) + 1`."
			liveRange used: (i * 2) + 1.
		].
	].

	"
	Step 2. Allocate registers using collected intervals.
	"
	liveRanges := liveRanges associations sort: [ :a :b | a start < b start ].
	liveRanges do: [:liveRange | 
		self assert: liveRange start odd.
		self assert: liveRange stop even.
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
TRLinearScanRegisterAllocator >> expireOldIntervals: newRange [
	activeRanges copy do: [:activeRange | 
		activeRange stop >= newRange start ifTrue: [ ^ self ].
		activeRanges remove: activeRange.
		availableRegisters add: activeRange allocation.
	].
]
