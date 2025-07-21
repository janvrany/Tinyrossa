Extension { #name : #AcRelocation }

{ #category : #'*Tinyrossa' }
AcRelocation >> type [
	"Return type of (ELF) relocation as string, for example 'R_X86_64_GOT32' or
	'R_RISCV_PCREL_LO12_I'. This is used by TRGASGenerator to output
	relocations."

	self assert: self class isAbstract not.

	"By convention, relocation classes are named exactly as in respective
	 specification."
	^ self class name.
]
