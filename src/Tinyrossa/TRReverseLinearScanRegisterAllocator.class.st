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
		'intervals',
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
	assigned isNil ifTrue: [ self error: 'No available register!' ].

	live add: interval.
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> allocateRegisters [
	instructions := codegen instructions.
	allocatableRegisters := codegen linkage allocatableRegisters.
	codegen compilation config stressRA ifTrue: [ 
		"allocatableRegisters := allocatableRegisters copyFrom: 1 to: 2."
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
	intervals := intervals values asOrderedCollection sort: [ :a :b | a stop < b stop ].

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
	 (ii) ...reload all trashed registers live across 
		  this instruction
	"
	deps notEmptyOrNil ifTrue: [
		"Compute 'live-across' intervals, that is intervals that are
		 assigned before this instruction and used after this instruction."
		liveAcross := Set new: live size.
		live do: [:i | (i start < insnIndex and: [ i stop > insnIndex ]) ifTrue:[liveAcross add:i] ].

		codegen cursor: insnIndex.
		deps post do: [:dep |
			dep isDependency ifTrue:[
				self insertMoveFrom: dep rreg to: dep vreg.
			].
			dep isTrash ifTrue: [
				liveAcross do:[:i |
					(i register allocation == dep rreg) ifTrue: [
						"Live-across register is trashed, we have to spill and reload. 
						 Since we go 'backwards', we reload here.

						 Note, that calling #insertReload: has the sideffect of allocating
						 a spill slot for the (virtual) register. Also, the register is spilled
						 right after it is defined in `#expireRegistersAt:`. Therefore, there's
						 no need to call `#insertSpill:` when satisfying pre-dependencies."
						self insertReload: i.
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
	[ intervals notEmpty and: [ intervals last stop == insnIndex ] ] whileTrue: [ 
		self allocateRegister: intervals removeLast.
	].

	"Satisfy pre-dependencies, i.e., 
	  (i) move values from (virtual) registers to desired 
		  (real) registers and...
	 (ii) spill all thrashed live registers.

	 Moves and spills must be placed placed *before* 
	 the instruction being processed, hence the `insnIndex - 1`"
	deps notEmptyOrNil ifTrue: [
		codegen cursor: insnIndex - 1.
		deps pre reverseDo: [:dep |
			dep isDependency ifTrue:[
				self insertMoveFrom: dep vreg to: dep rreg.
			].
			"Note that there's no need to handle thrashed registers here
			 see comment in code handling post-dependencies above."
		].
	].
]

{ #category : #allocation }
TRReverseLinearScanRegisterAllocator >> expireRegistersAt: insnIndex [
	"Expire all registers no longer live at given instruction (index)."
	[ live notEmpty and:[ live last start >= insnIndex ] ] whileTrue: [
		| expired |

		expired := live removeLast.
		expired spillSlot notNil ifTrue: [ 
			 self insertSpill: expired.
		].
		self freeRegister: expired.
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
TRReverseLinearScanRegisterAllocator >> insertReload: interval [
	| slot |

	self assert: interval register kind == GPR description: 'FIXME: FPRs not yet supported'.
	self assert: interval register allocation notNil.

	slot := interval spillSlot.
	slot isNil ifTrue: [ 
		slot := codegen compilation symbolManager defineAutomatic: nil type: Address.
		interval spillSlot: slot.
	].
	slot incUseCount.
	codegen registerLoad: interval register from: slot.
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> insertSpill: interval [
	| slot |

	self assert: interval spillSlot isTRAutomaticSymbol.
	self assert: interval register kind == GPR description: 'FIXME: FPRs not yet supported'.

	slot := interval spillSlot.
	slot incUseCount.
	codegen registerStore: interval register to: slot.
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> pickRegister: interval [
	"Pick (choose) and assign the best real register for given live interval.
	 Return the chosen register.

	 Internal list of currently available registers is updated accordingly.

	 If there's no available register at this point, return `nil`. Caller
	 is responsible for handling this case and schedule a spill / reload.
	"
	self assert: interval register allocation isNil.

	availableRegisters isEmpty ifTrue: [ ^ nil ].

	allocatableRegisters do: [:rReg | 
		(availableRegisters includes: rReg) ifTrue: [ 
			interval register allocation: rReg.
			self takeRegister: interval.
			^ rReg
		].
	].     
	self assert: false description: 'Should never be reached'.
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> pickSpill: interval [
	"Pick (choose) and return the best spill FIXME: TBW"

	| insn candidates |

	insn := instructions at: interval stop.

	candidates := live copy.
	codegen virtualRegistersReadBy: insn do: [:vReg |
		live do: [:e | e register == vReg ifTrue:[ candidates remove: e ifAbsent:nil] ]
	].
	candidates isEmpty ifTrue: [ 
		^ nil.
	].
	^ candidates first.
]

{ #category : #utilities }
TRReverseLinearScanRegisterAllocator >> takeRegister: interval [
	"Mark register assigned to given interval as used."

	self assert: interval register allocation notNil.

	availableRegisters remove: interval register allocation
]
