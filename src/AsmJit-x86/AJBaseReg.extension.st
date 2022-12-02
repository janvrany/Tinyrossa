Extension { #name : #AJBaseReg }

{ #category : #'*AsmJit-x86-Operands' }
AJBaseReg >> assertCL [
	self assert: false description: 'Expected CL but got ', self asString
]

{ #category : #'*AsmJit-x86' }
AJBaseReg >> isLowerBank [
	^ self isUpperBank not
]

{ #category : #'*AsmJit-x86-Operands' }
AJBaseReg >> isRegisterGeneralPurposeByte [
	^ self isRegisterType: RegGPB
]

{ #category : #'*AsmJit-x86-Operands' }
AJBaseReg >> isRegisterGeneralPurposeDoubleword [
	^ self isRegisterType: RegGPD
]

{ #category : #'*AsmJit-x86-Operands' }
AJBaseReg >> isRegisterGeneralPurposeQuadword [
	^ self isRegisterType: RegGPQ
]

{ #category : #'*AsmJit-x86-Operands' }
AJBaseReg >> isRegisterGeneralPurposeWord [
	^ self isRegisterType: RegGPW
]

{ #category : #'*AsmJit-x86' }
AJBaseReg >> isUpperBank [
	"Used for emitting the REX Prefix Byte on 64bit machines"
	^ self index > 7
]

{ #category : #'*AsmJit-x86' }
AJBaseReg >> isX86 [
	self subclassResponsibility
]

{ #category : #'*AsmJit-x86' }
AJBaseReg >> prohibitsRex [
	"Answer true if this register cannot be used in any instruction that has a REX prefix.
	Of the general-purpose registers, this is true only of SPL, BPL, SIL, DIL."

	^ false
]

{ #category : #'*AsmJit-x86' }
AJBaseReg >> requiresRex [
	"Answer true if use of this register requires that the instruction have a REX prefix.
	This can be because the register cannot be accessed except with REX (high bank or 64-only low byte)
	or because the register is 64-bits wide"

	^ false
]
