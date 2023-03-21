Extension { #name : #AcDSLAssembler }

{ #category : #'*Tinyrossa' }
AcDSLAssembler >> leave: aTRVirtualRegister [
	| insn |

	insn := TRLeave forValue: aTRVirtualRegister.
	self append: insn.
	^ insn
]
