Extension { #name : #AcDSLAssembler }

{ #category : #'*Tinyrossa' }
AcDSLAssembler >> leave: aTRVirtualRegister [
	| insn |

	insn := TRLeave value: aTRVirtualRegister.
	memory append: insn.
	^ insn
]
