"
A custom linkage that implements standard RISC-V semihosting call sequence [1].

[1]: The RISC-V Instruction Set Manual Volume I: Unprivileged ISA,
	 Section 2.8 Environment Call and Breakpoints

"
Class {
	#name : #TRRV64GSemihostingLinkage,
	#superclass : #TRLinkage,
	#pools : [
		'TRILOpcodes',
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #'code generation' }
TRRV64GSemihostingLinkage >> generateCall: node [
	"Generate semihosting call. This generates standard RISC-V semihosting sequence [1].
	 The first child specifies the semihosting call number and must be an `iconst`.

	 [1]: The RISC-V Instruction Set Manual Volume I: Unprivileged ISA,
		  Section 2.8 Environment Call and Breakpoints
	"
	| callNo depsBefore depsAfter parameterVregs parameterTypes parameterRregs retVreg |

	self assert: node child1 opcode == iconst.

	callNo := node child1 constant.
	depsBefore := TRRegisterDependencies new.
	depsAfter := TRRegisterDependencies new.

	"Step 1: collect parameters and map parameters to parameter registers
	 (and stack slots, thought that's not supported yet)"

	parameterVregs := Array new: node children size - 1.
	parameterTypes := Array new: node children size - 1.

	2 to: node children size do: [:i |
		| parameter |

		parameter := node children at: i.
		parameterVregs at: i - 1 put: (codegen evaluator evaluate: parameter).
		parameterTypes at: i - 1 put: parameter type.
	].

	parameterRregs := self mapParameters: parameterTypes.

	"Step 2: map parameters into parameter registers. Note
	 that we do not need to thrash any registers as semihosting
	 calls surgically extract parameters from registers and
	 place return value into a0, all other registers are kept
	 intact."
	parameterVregs with: parameterRregs do: [:vReg :rReg |
		depsBefore pre addDependency: vReg on: rReg.
		rReg ~~ a0 ifTrue: [
			depsAfter post addDependency: vReg on: rReg.
		]
	].

	"Step 3: generate call instructions"
	(generate slli: zero, zero, 16r1f) dependencies: depsBefore.
	 generate ebreak.
	(generate srai: zero, zero, callNo) dependencies: depsAfter.

	"Step 4: map return value into return register (if any) and finish"
	node symbol type == Void ifTrue:[
		retVreg := nil.
	] ifFalse:[
		retVreg := codegen allocateRegister.
		depsAfter post addDependency: retVreg on: a0.
	].

	^ retVreg

]

{ #category : #'code generation' }
TRRV64GSemihostingLinkage >> generateCallIndirect: node [
	^ self shouldNotImplement

]

{ #category : #'code generation' }
TRRV64GSemihostingLinkage >> generateEpilogue: valReg [
	self shouldNotImplement

]

{ #category : #'code generation' }
TRRV64GSemihostingLinkage >> generatePrologue [
	self shouldNotImplement

]

{ #category : #mapping }
TRRV64GSemihostingLinkage >> mapParameters: parameterTypes [
	| parameterMapping |

	parameterMapping := Array new: parameterTypes size.
	parameterTypes withIndexDo: [:type :index |
		"For now, only up to 8 integer parameters are supported."
		self assert: type isIntegerType.
		self assert: index <= self parameterRegisters size.
		parameterMapping at: index put: (self parameterRegisters at: index)
	].
	^ parameterMapping

]

{ #category : #accessing }
TRRV64GSemihostingLinkage >> parameterRegisters [
	^ { a0 . a1 . a2 . a3 . a4 . a5 . a6 . a7 }
]
