Extension { #name : #AJOperand }

{ #category : #'*AsmJit-x86-Operands' }
AJOperand >> isRegisterGeneralPurposeByte [
	^ false
]

{ #category : #'*AsmJit-x86-Operands' }
AJOperand >> isRegisterGeneralPurposeDoubleword [
	^ false
]

{ #category : #'*AsmJit-x86-Operands' }
AJOperand >> isRegisterGeneralPurposeQuadword [
	^ false
]

{ #category : #'*AsmJit-x86-Operands' }
AJOperand >> isRegisterGeneralPurposeWord [
	^ false
]

{ #category : #'*AsmJit-x86-Operands' }
AJOperand >> isRegisterMM [
	^ false
]

{ #category : #'*AsmJit-x86-Operands' }
AJOperand >> isRegisterX87 [
	^ false
]

{ #category : #'*AsmJit-x86-Operands' }
AJOperand >> isRegisterXMM [
	^ false
]

{ #category : #'*AsmJit-x86-Operands' }
AJOperand >> requiresRex [
	"Answer true if use of this operand requires that the instruction have a REX prefix.
	The REX prefix, available in 64-bit mode, enables use of the AMD64 register and operand size extensions.
	Unlike the legacy instruction modification prefixes, REX is not a single unique value, but occupies a range (40h to 4Fh)."

	self subclassResponsibility
]
