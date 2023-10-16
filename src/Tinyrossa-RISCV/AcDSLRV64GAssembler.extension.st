Extension { #name : #AcDSLRV64GAssembler }

{ #category : #'*Tinyrossa-RISCV' }
AcDSLRV64GAssembler >> call: operands [
	| insn |

	insn := AcRISCVCall new assembleDSL: 'call' operands: operands asAcDSLOperandList.
	self append: insn.
	^ insn.
]
