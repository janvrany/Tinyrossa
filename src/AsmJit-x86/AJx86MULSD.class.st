"
Multiply Scalar Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86MULSD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MULSD class >> description [
	^ #(#mulsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F59 0 )
]

{ #category : #accessing }
AJx86MULSD class >> mnemonic [
	^ #mulsd
]
