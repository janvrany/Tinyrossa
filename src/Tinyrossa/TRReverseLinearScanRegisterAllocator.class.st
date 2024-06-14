"
`TRReverseLinearScanRegisterAllocator` is the default allocator used in Tinyrossa. 

It is a more or less straightforward reimplementation from original 1999 paper
[1] with few changes.

First, as name suggests, allocation progresses backwards, from the last
instruction in sequence towards the first. This way, we can insert more
instructions in already processed part without a need to update indexes.
Second, the way it implements spilling is more along the lines of [2].

# Spilling and reloading

Each interval one more 'defined position' (or 'defd pos') and
zero or more `used positions` (no use position of an interval might be
a result of interval splitting, see below).

When there's no free register (`#pickRegister` fails) then one live
interval is chosen (`#pickSplit:`) and split (`#splitRegister:at:`).
If interval is split between first 'def position' and following 'use position'
the new interval has no 'use positions' and spans only one instruction.

When an interval is split into two intervals, they're both assigned
same spill slot. The value is spilled at closest prior def position
and reloaded at split position (see `#splitRegister:at:`)

# Satisfying dependencies

Dependencies are satisfied by interval splitting too:

 * Intervals allocated to thrashed registers are split at instruction
   that thrashes them, this forces spill and reload.

 * Unsatisfied post-dependencies are solved by moving the value
   to required real register. If that real register is already
   allocated to some other interval, that interval is split which
   makes it free (and therefore value can be freely moved there).

 * Unsatisfied pre-dependencies on currently allocated real registers
   are trickier and solved by either re-allocating the conflicting
   interval to a free register (if any) or swapping allocations
   or splitting. For details, see comments in relevant part of
   allocateRegistersAt:

---

Note that there's no need to deal with virtual registers being used across
basic block boundary - in Tinyrossa (as well as in Testarossa), the only way
to transfer value from one (extended) block to another is via `?store` and
`?load` IL operations.

[1]: MASSIMILIANO POLETTO and VIVEK SARKAR: Linear Scan Register Allocation
	 http://web.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf

[2]: Christian Wimmer, Hanspeter Mossenbock: Optimized Interval Splitting
		  in a Linear Scan Register Allocator

"
Class {
	#name : #TRReverseLinearScanRegisterAllocator,
	#superclass : #TRRegisterAllocator,
	#instVars : [
		'instructions',
		'todo',
		'live',
		'allocatableRegisters',
		'availableRegisters'
	],
	#pools : [
		'TRDataTypes',
		'TRRegisterKinds'
	],
	#category : #'Tinyrossa-Codegen-Register Allocation'
}

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> allocateRegister: interval [
	"Allocate register for given `interval`."

	| assigned |

	self assert: interval register allocation isNil.

	assigned := self pickRegister: interval.
	assigned isNil ifTrue: [
		"No free registers so pick and split some interval to free
		 some. Then try to allocate register again (this should succeed)
		 `interval` and then try to allocate it."

		| split |

		split := self pickSplit: interval.
		split isNil ifTrue: [ 
			self error: 'Cannot allocate register for ', interval vreg name, ': no free registers and no interval to split!'
		].
		self splitRegister: split at: interval stop.

		assigned := self pickRegister: interval.
	].

	self assert: assigned notNil.

	interval register allocation: assigned.
	self takeRegister: interval.
	live add: interval.
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> allocateRegisters [
	| intervals |

	instructions := codegen instructions.
	allocatableRegisters := codegen linkage allocatableRegisters.
	codegen compilation config stressRA ifTrue: [ 
		allocatableRegisters := allocatableRegisters copyFrom: 1 to: 2.
	].
	availableRegisters := allocatableRegisters asSet.  
	live := SortedCollection sortBlock: [ :a :b | a start < b start ].

	"Step 1 - compute live intervals."
	intervals := Dictionary new.
	codegen virtualRegisters do: [:vReg | 
		intervals at: vReg put: (TRRegisterLiveInterval forRegister: vReg).
	].
	"Here we compute live intervals in reverse order although
	 we need not to."
	instructions size downTo: 1 do: [:i |
		| insn |

		insn := instructions at: i.
		codegen virtualRegistersReadBy: insn do: [:vreg | 
			| interval |

			interval := intervals at: vreg.
			interval usedAt: i.
		].
		codegen virtualRegistersAssignedBy: insn do: [:vreg | 
			| interval |

			interval := intervals at: vreg.
			interval defdAt: i.
		].
	].
	intervals do: [:interval | 
		self assert: interval start < interval stop.
	].

	"Create todo (work) list. The list is sorted by interval's end position (#stop).

	 Within the same end positions, intervals are sorted by start position. This is so
	 to make sure short live intervals are allocated first (see #allocateRegistersAt:
	 which allocates registers one by one, taking them off the end of `todo` list.
	"
	todo := intervals values asSortedCollection: [ :a :b | (a stop < b stop) or:[a stop == b stop and:[a start < b start]]].

	"
	Step 2. Walk instructions in reverse order and allocate
	registers. Insert moves / reloads and spills as needed.
	"
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
	| insn deps liveAcross |

	insn := instructions at: insnIndex.
	deps := insn dependencies.

	"Satisfy post-dependencies, i.e., 
	  (i) move values from fixed (real) registers to desired 
		  (virtual) registers and...
	 (ii) ...force-split all thrashed registers live across
		  current position (`insnIndex`)
	"
	codegen cursor: insnIndex.
	deps notEmptyOrNil ifTrue: [
		"Compute 'live-across' intervals, that is intervals that are
		 assigned before this instruction and used after this instruction."
		liveAcross := Set new: live size.
		live do: [:i | (i start < insnIndex and: [ i stop > insnIndex ]) ifTrue:[liveAcross add:i] ].

		deps post do: [:dep |
			dep isUnsatisfiedDependency ifTrue:[
				"Move value from real register to its virtual register."
				self insertMoveFrom: dep rreg to: dep vreg.

				live copy do: [:i |
					(i register allocation == dep rreg) ifTrue: [
						"Live-across register is trashed, we have to spill and reload.
						 We do it by forcefully splitting the interval."
						self splitRegister: i at: insnIndex.
					].
				].
			].
			dep isTrash ifTrue: [
				liveAcross do:[:i |
					(i register allocation == dep rreg) ifTrue: [
						"Live-across register is trashed, we have to spill and reload. 
						 We do it by forcefully splitting the interval."
						self splitRegister: i at: insnIndex.
					].
				]
			].
		].
	].

	"Free registers no longer 'live'"
	self expireRegistersAt: insnIndex.

	"Allocate registers going to be live at this point. Here we remove 
	 the interval from the list so we do not need to always search the
	 list for intervals starting at this point. 
	 In other words, `intervals` collection serve as a worklist."
	[ todo notEmpty and: [ todo last stop == insnIndex ] ] whileTrue: [
		| interval |

		interval := todo removeLast.

		self allocateRegister: interval.
		interval length == 1 ifTrue: [ 
			"We have just allocated an register interval of length 1 -
			 such interval may be result of a split between its 
			 definition and first use. In this case, this interval is 
			 defined at this interval get immediatelly spilled so
			 we can expire it right now to free the register for
			 possibly other intervals that go live here."
			self assert: (interval needsToBeSpilledAt: insnIndex).

			self insertSpill: interval.
			self expireRegister: interval.
		]
	].

	"Spill all live registers that have to spilled at this
	 point."
	live do: [:interval |
		(interval needsToBeSpilledAt: insnIndex) ifTrue: [
			self insertSpill: interval.
		].
	].


	"Satisfy pre-dependencies, i.e., 
	  (i) move values from (virtual) registers to desired 
		  (real) registers and...
	 (ii) spill all thrashed live registers.

	 Moves and spills must be placed placed *before* 
	 the instruction being processed, hence the `insnIndex - 1`"
	codegen cursor: insnIndex - 1.
	deps notEmptyOrNil ifTrue: [
		deps pre reverseDo: [:dep |
			dep isUnsatisfiedDependency ifTrue:[
				| conflicting |

				conflicting := live detect: [:each | each register allocation == dep rreg ] ifNone: nil.
				conflicting notNil ifTrue: [
					"There's a dependency on a real register but (another) live interval (`conflicting`)
					 is allocated to that very real register (so the real register is not free)."

					"If conflicting interval have just gone live..."
					conflicting stop == insnIndex ifTrue: [
						| free |

						free := self pickRegister: conflicting.
						free notNil ifTrue:[
							"...and there's a free register, we can just reassign conflicting register
							 to this free one."
							self freeRegister: conflicting register allocation.
							conflicting register allocation: free.
							self takeRegister: free.

							"Now the real register is free so we can simply move
							 value from virtual to (now free) real register."
							self insertMoveFrom: dep vreg to: dep rreg.
						] ifFalse: [
							"If there's no free register, then we swap allocations for
							 conflicting and dependent registers. However, we can do this
							 safely only if dependent register has also gone live at this
							 position."

							| dependent |

							dependent := live detect: [:each | each register == dep vreg ].
							dependent stop == insnIndex ifFalse: [
								"So if it doesn't (has alreadt been live at this point), se
								 split it and allocate it right back to the same register.
								 This way, we can easily swap allocations without possibly
								 creating conflict in already allocated intervals."

								self splitRegister: dependent at: insnIndex.
								self allocateRegister: (dependent := todo removeLast).
							].

							self assert: dependent stop == insnIndex.

							"Now, swap allocations"
							conflicting register allocation: dependent register allocation.
							dependent register allocation: dep rreg.

							"Since dependent (virtual) register is allocated to required (real) register,
							 there's no need to move values."
						].
					] ifFalse: [
						"Ouch, what to do here?"
						self notYetImplemented.
					].
				] ifFalse: [
					"There's no conflict, i.e., there's no live register currently allocated
					 to required real register. Therefore we can simply move value from
					 virtual register to real register."
					self insertMoveFrom: dep vreg to: dep rreg.
				].
			].
			"Note that there's no need to handle thrashed registers here
			 as all thrashed intervals have been split, see above."
		].
	].
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> expireRegister: interval [
	"Expire given interval"

	interval spillSlot notNil ifTrue: [
		codegen cursor: interval start.
		self insertSpill: interval.
	].
	self freeRegister: interval.
	live remove: interval.
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> expireRegistersAt: insnIndex [
	"Expire all registers no longer live at given instruction (index)."
	[ live notEmpty and:[ live last start >= insnIndex ] ] whileTrue: [
		self expireRegister: live last.
	].
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> freeRegister: interval [
	"Free register assigned to given interval, i.e.,
	 put it back to list of available registers."

	self assert: interval register allocation notNil.

	availableRegisters add: interval register allocation
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> insertReload: interval from: spillSlot [

	self assert: interval register kind == GPR description: 'FIXME: FPRs not yet supported'.
	self assert: interval register allocation notNil.
	self assert: spillSlot isTRAutomaticSymbol.

	spillSlot incUseCount.
	codegen registerLoad: interval register from: spillSlot.
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> insertSpill: interval [
	| spillSlot |

	self assert: interval spillSlot isTRAutomaticSymbol.
	self assert: interval register kind == GPR description: 'FIXME: FPRs not yet supported'.

	spillSlot := interval spillSlot.
	interval spillSlot: nil.
	codegen registerStore: interval register to: spillSlot.
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> pickRegister: interval [
	"Pick (choose) and return the best real register to assign to given (about to
	 going live) `interval`. Chosen register is NOT assigned.

	 If there's no available register at this point, return `nil`. Caller
	 is responsible for handling this case and schedule a spill / reload.
	"
	availableRegisters isEmpty ifTrue: [ ^ nil ].
	allocatableRegisters do: [:rReg | 
		(availableRegisters includes: rReg) ifTrue: [ 
			^ rReg
		].
	].     
	self assert: false description: 'Should never be reached'.
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> pickSpillSlot: interval [
	"Pick (choose) a spill slot to use when splitting given `interval`."

	self assert: interval register kind == GPR description: 'FIXME: FPRs not yet supported'.

	^ codegen compilation symbolManager defineAutomatic: nil type: Address.
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> pickSplit: interval [
	"Pick (choose) and return 'good enough' live interval to split
	 (and therefore spill) in order to allocate given (about to go live)
	 `interval`.

	 Preferably, choose among intervals that are not not defined not
	 used at current position. If there's none such that, choose among
	 ones that are used but not defined.

	 Among multiple candidates to split, prefer the one whose previous
	 (since we go backwards) use/def is the furthest from current position.
	 This frees the register for longest possible time.

	 Above process may not be the best, but it is 'good enough'.

	 [1]: Christian Wimmer, Hanspeter Mossenbock: Optimized Interval Splitting
		  in a Linear Scan Register Allocator
	"

	| candidates candidate candidatePrevUse |

	"1. Select candidates"
	candidates := live reject: [:each | each isDefdOrUsedAt: interval stop ].
	candidates isEmpty ifTrue: [
	candidates := live reject: [:each | each isDefdAt: interval stop ].
	].

	"2. Among candidates, select the one one whose previous use/def
		is the furthest."
	candidatePrevUse := SmallInteger maxVal.
	candidate := nil.
	candidates reverseDo: [ :each |
		| eachPrevUse |

		eachPrevUse := each lastUseOrDefBefore: interval stop.
		(eachPrevUse notNil and: [ eachPrevUse < candidatePrevUse ]) ifTrue: [
			candidate := each.
			candidatePrevUse := eachPrevUse.
		].
	].

	^ candidate
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> splitRegister: interval at: insnIndex [
	"Split given live `interval` at given `position`.
	 After interval is split. given `interval` is no
	 longer live (but may become live at `position` - 1)
	 and the part of interval before `position` is added to
	 the worklist (`todo`). "

	| before regmap spillSlot |

	self assert: (live includes: interval).

	before := TRRegisterLiveInterval forRegister: (codegen allocateRegister: interval register kind).

	"Create new interval representing the first part of original interval
	 up to current position. While walking definitions and uses,
	 update instructions to use new virtual registers"
	regmap := Dictionary new at: interval register name put: before register; yourself.
	interval defdDo: [ :i |
		before defdAt:i.
		instructions at: i put: ((instructions at: i) replaceVirtualRegistersUsing: regmap).
	].
	interval usedDo: [:i | i <= insnIndex ifTrue: [
		before usedAt:i.
		instructions at: i put: ((instructions at: i) replaceVirtualRegistersUsing: regmap).
	]].

	"Allocate spill slot for being-splitted `interval`. Insert reload
	 and arrange `before` interval so that value is spilled when
	 defined."
	spillSlot := self pickSpillSlot: interval.
	self insertReload: interval from: spillSlot.
	before spillSlot: spillSlot.

	"Finally, expire `interval` and push `before` to
	 worklist."
	self expireRegister: interval.
	todo add: before.

	"Just a sanity check."
	self assert: (live includes: interval) not.
	self assert: (availableRegisters includes: interval register allocation).
	self assert: (todo includes: before).
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> takeRegister: interval [
	"Mark register assigned to given interval as used."

	self assert: interval register allocation notNil.

	availableRegisters remove: interval register allocation
]
